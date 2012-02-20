(module flatten-opt racket/base
  (require racket/match)

  (define (flatten-opt l)
    (match l
      [(list 'node_opt loc node) (flatten-opt node)]
      [(list type loc nodes ...) (append (list type loc) (map flatten-opt nodes))]
      [node node]))

  (provide flatten-opt))
