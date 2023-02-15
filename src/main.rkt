#lang racket

(require "server.rkt")

(define (main)
    (serve 8080)
    (read-line (current-input-port) 'any)
    (void))

(main)
