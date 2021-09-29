(TeX-add-style-hook
 "bioinf_introduccion"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape")
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:orgbcf3134"
    "sec:org7f00cea"
    "sec:orgfe1cc9d"
    "sec:org21a0cd5"
    "sec:org7d1901d"
    "sec:orge0d998a"
    "sec:orgc913756"
    "sec:org7f0909c"
    "sec:org9a2964f"
    "sec:org3a310d5"
    "sec:org2463bfa"
    "sec:org031c997"
    "sec:org83cc230"
    "sec:org533af1d"
    "sec:orga5f9070"
    "sec:org6b66d13"
    "sec:org193b85a"
    "sec:orgc59bcf2"
    "sec:org93b1230"))
 :latex)

