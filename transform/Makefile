../xform: transform.native
	cp $< $@

transform.native: $(wildcard *.ml *.mli)
	ocamlbuild -pkg sexplib $@
