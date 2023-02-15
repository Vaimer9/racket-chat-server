#lang racket

(provide serve)

(define (serve pn)
    (define listener (tcp-listen pn 5 #t))
    (define (main-loop)
        (accept-and-handle listener)
        (main-loop))
    (thread main-loop))

(define (accept-and-handle listener)
    (define-values (in out) (tcp-accept listener))
    (handle in out)
    (close-input-port in)
    (close-output-port out))

(define (handle in out)
    (define (handle-loop)
        (let ([input (read in)]) (display (symbol->string input) out))
        (handle-loop))
    (handle-loop))
