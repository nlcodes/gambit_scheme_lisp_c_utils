; Utilities for gambit scheme lisp to c programming
(define-library (c_utils)
  (export #i struct)
  (begin

    ; Improved gambit include syntax
    ; Use #i to include c libraries instead of c-declare or #include
    (define-macro (#i header)
     (let ((header-str (symbol->string header)))
       `(c-declare
          ,(string-append
            "#include "   
           (if (or (string-contains header-str "./")
                   (string-contains header-str "../")
                   (string-contains header-str ".h/"))
               "\""
               "<")
           header-str
           (if (or (string-contains header-str "./")
                   (string-contains header-str "../")
                   (string-contains header-str ".h/"))
               "\""
               ">")))))))
