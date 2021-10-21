;;; config.el --- Configuration of org html export

;;; Commentary:

;;; Code:

(require 'elpher)
(require 'ox-html)
(require 'ox-gemini)

(setq org-html-doctype "html5"
      org-html-preamble nil
      org-html-postamble nil
      org-html-self-link-headlines t
      org-html-head "<style> #content { max-width: 40rem; margin: auto; } </style>"
      org-export-with-section-numbers nil
      org-export-with-toc nil)

;; todo: understand how org-link works and implement this better.
(elpher-org-mode-integration)
(org-link-set-parameters
 "ipns"
 :export
 (lambda (link description format _plist)
   (let ((url (format "ipns:%s" link))
	 (desc (or description url)))
     (pcase format
       (`html (format "<a href=\"%s\">%s</a>" url desc))
       (_ (format "%s (%s)" desc url))))))

(provide 'config)

;;; config.el ends here

