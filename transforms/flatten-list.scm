(module flatten-list racket/base
  (require racket/match)

  (define (flatten-list l)
    (match l
	   ; Match node_lists with the same separator token.
	   [(list 'node_list
		  _ ;loc
		  (list 'node_list prev-loc prev-prev
			(list 'token sep-tok sep-lexeme sep-loc)
			prev-nodes ..1) ;prev
		  (list 'token sep-tok _ _) ;sep
		  nodes ..1) ;node
	    (flatten-list
	      (append
		(list 'node_list prev-loc
		      prev-prev
		      (list 'token sep-tok sep-lexeme sep-loc))
		(map flatten-list prev-nodes)
		(map flatten-list nodes)))]

	   ; Match node_lists without separator token.
	   [(list 'node_list
		  _ ;loc
		  (list 'node_list prev-loc prev-prev
			'NIL
			prev-nodes ..1) ;prev
		  'NIL ;sep
		  nodes ..1) ;node
	    (flatten-list
	      (append
		(list 'node_list prev-loc
		      prev-prev
		      'NIL)
		(map flatten-list prev-nodes)
		(map flatten-list nodes)))]

	   ; Match plain tokens, no flattening needed here.
	   [(list 'token a ...) (cons 'token a)]

	   ; Match any other kind of node and flatten its body.
	   [(list type loc a ...) (append (list type loc) (map flatten-list a))]
	   ['NIL 'NIL]))

  (provide flatten-list))
