../xform: transform.native
	cp $< $@

transform.native: $(wildcard *.ml *.mli)
	ocamlbuild -use-ocamlfind -pkg sexplib $@
