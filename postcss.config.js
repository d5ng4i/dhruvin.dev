const purgecss = require('@fullhuman/postcss-purgecss')({
  content: [ './hugo_stats.json' ],
  defaultExtractor: (content) => {
    const elements = JSON.parse(content).htmlElements
    return elements.tags.concat(elements.classes, elements.ids)
  }
})

module.exports = {
  plugins: [ purgecss ]
}
