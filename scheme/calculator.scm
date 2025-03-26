(define (tokenize str)
  (let loop ((chars (string->list str)) (token "") (tokens '()))
    (cond
      ((null? chars)
       (reverse (if (string=? token "") tokens (cons token tokens))))
      ((char-whitespace? (car chars))
       (loop (cdr chars) "" tokens))
      ((or (char-numeric? (car chars)) (char=? (car chars) #\.))
       (loop (cdr chars) (string-append token (string (car chars))) tokens))
      ((member (car chars) '(#\+ #\- #\* #\/ #\( #\)))
       (loop (cdr chars) "" 
             (if (string=? token "") 
                 (cons (string (car chars)) tokens)
                 (cons (string (car chars)) (cons token tokens)))))
      (else (error "Geçersiz karakter!")))))

(define (parse-expression tokens)
  (define (parse-factor tokens)
    (let ((token (car tokens)))
      (cond ((string=? token "(")
             (let-values (((expr rest-tokens) (parse-expression (cdr tokens))))
               (if (and (not (null? rest-tokens)) (string=? (car rest-tokens) ")"))
                   (values expr (cdr rest-tokens))
                   (error "Eksik ')'"))))
            (else 
             (let ((num (string->number token)))
               (if num
                   (values num (cdr tokens))
                   (error "Geçersiz sayı" token)))))))

  (define (parse-term tokens)
    (let-values (((factor tokens) (parse-factor tokens)))
      (let loop ((accum factor) (tokens tokens))
        (if (and (not (null? tokens)) (member (car tokens) '("*" "/")))
            (let-values (((next-factor rest-tokens) (parse-factor (cdr tokens))))
              (loop (if (string=? (car tokens) "*") (* accum next-factor) (/ accum next-factor)) rest-tokens))
            (values accum tokens)))))

  (let-values (((term tokens) (parse-term tokens)))
    (let loop ((accum term) (tokens tokens))
      (if (and (not (null? tokens)) (member (car tokens) '("+" "-")))
          (let-values (((next-term rest-tokens) (parse-term (cdr tokens))))
            (loop (if (string=? (car tokens) "+") (+ accum next-term) (- accum next-term)) rest-tokens))
          (values accum tokens)))))

(define (hesapla ifade)
  (let-values (((result rest-tokens) (parse-expression (tokenize ifade))))
    (if (null? rest-tokens)
        result
        (error "Beklenmeyen tokenlar kaldı: ~a" rest-tokens))))

(define (baslat)
  (display "Lütfen matematiksel bir ifade giriniz (ör: 2+(3*4)): ")
  (let ((ifade (read-line)))
    (guard (exc
            ((error? exc)
             (display "Hata: ")
             (display (condition-message exc))
             (newline)))
      (display "Sonuç: ")
      (display (hesapla ifade))
      (newline)))
	(baslat))

;; Programı çalıştırmak için (baslat) fonksiyonunu çağırın
(baslat) 