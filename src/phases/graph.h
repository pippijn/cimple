struct graph
  : phase
{
  FILE *fh;

  graph ()
    : fh (fopen ("graph.dot", "w"))
  {
    fprintf (fh, "digraph G {\n");
  }

  ~graph ()
  {
    fprintf (fh, "}\n");
    fclose (fh);
    system ("dot -Tpng -o graph.png graph.dot");
  }

  static bool empty (node &a)
  {
    node_opt_ptr o = a.is<node_opt> ();
    return o && !o->node ();
  }

  void edge (node &a, node &b, size_t i)
  {
    if (empty (a) || empty (b))
      return;

    fprintf (fh, "\t\"%s #%lu\" -> \"%s #%lu",
            type (a), a.index,
            type (b), b.index);
    if (b.kind () == NODE_TOKEN)
      fprintf (fh, "\\n`%s´",
              static_cast<token &> (b).lexeme.c_str ());
    fprintf (fh, "\" [ label = \"%s\"];\n", node_member_name (a.kind (), i));
  }

  node_ptr visit (generic_node &n)
  {
    size_t i = 0;
    foreach (node_ptr const &p, n.children)
      {
        if (p)
          {
            edge (n, *p, i);
            resume (p);
          }
        ++i;
      }
    return &n;
  }

  node_ptr visit (ambiguity &n)
  {
    if (n.a)
      edge (n, *n.a, 0);
    resume (n.a);

    if (n.b)
      edge (n, *n.b, 1);
    resume (n.b);

    return &n;
  }

  node_ptr visit (token &n)
  {
    return &n;
  }
};
