;;; config.el --- Configuration of org publication

;;; Commentary:

;;; Code:

(require 'elpher)
(require 'ox-html)
(require 'ox-gemini)

(defun preparation-function (_)
  "Prepare to publish."
  (elpher-org-mode-integration))

(setq org-publish-timestamp-directory "build/"
      org-publish-project-alist
      '(("dhruvin.dev" :components ("site" "capsule"))
	("site"
	 :base-directory "src"
	 :preparation-function preparation-function
	 :publishing-directory "build/site"
	 :publishing-function org-html-publish-to-html
	 :with-section-numbers nil
	 :with-toc nil
	 :html-doctype "html5"
	 :html-preamble nil
	 :html-postamble nil
	 :html-self-link-headlines t
	 :html-head "<style> #content { max-width: 40rem; margin: auto; } </style>")
	("capsule"
	 :base-directory "src"
	 :publishing-directory "build/capsule"
	 :preparation-function preparation-function
	 :publishing-function org-gemini-publish-to-gemini
	 :with-section-numbers nil
	 :with-toc nil)))

;;; config.el ends here
