const pinataSDK = require('@pinata/sdk')
const axios = require('axios')

const pinata = pinataSDK(
    process.env.PINATA_API_KEY,
    process.env.PINATA_API_SECRET
)

pinata.pinFromFS('build/site', {
    pinataMetadata: {
	name: 'dhruvin.dev',
	keyvalues: Object.fromEntries(
	    Object.entries({
		buildJobId: process.env.JOB_ID,
		buildJobUrl: process.env.JOB_URL,
		buildSubmitter: process.env.BUILD_SUBMITTER,
		buildReason: process.env.BUILD_REASON
	    }).filter(([k, v]) => v !== undefined)
	)
    },
    pinataOptions: { cidVersion: 1 }
}).then(({IpfsHash}) => {
    console.info('[pinata]', `Pinned /ipfs/${IpfsHash}`)
    axios({
	method: 'PATCH',
	baseURL: 'https://api.digitalocean.com/v2',
	url: `/domains/_dnslink.dhruvin.dev/records/${process.env.DOMAIN_RECORD_ID}`,
	headers: {
	    'Authorization': `Bearer ${process.env.DIGITALOCEAN_TOKEN}`
	},
	data: {
	    type: 'TXT',
	    name: '@',
	    data: `dnslink=/ipfs/${IpfsHash}`
	}
    }).then(() => {
	console.info('[digitalocean]', 'Domain record updated')
    }).catch(e => {
	console.error('[digitalocean]', e)
	process.exit(1)
    })
}).catch(e => {
    console.error('[pinata]', e)
    process.exit(1)
})
