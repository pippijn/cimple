(module load-code racket/base
  (require racket/match)

  (define (load-code file)
    (load file))

  (provide load-code))
