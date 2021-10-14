;;; config.el --- Configuration of org html export

;;; Commentary:

;;; Code:

(require 'ox-html)
(require 'ox-gemini)

(setq org-html-doctype "html5"
      org-html-preamble nil
      org-html-postamble nil
      org-html-self-link-headlines t
      org-html-style "<style> #content { max-width: 40rem; } </style>"
      org-export-with-section-numbers nil
      org-export-with-toc nil)

(provide 'config)

;;; config.el ends here

