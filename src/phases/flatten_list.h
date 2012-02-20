struct flatten_list
  : phase
{
  node_ptr visit (node_list &n)
  {
    phase::visit (n);
    if (node_list_ptr prev = is<node_list> (n.prev ()))
      {
        node_ptr sep1 = n.sep ();
        node_ptr sep2 = prev->sep ();
        if (!sep1 != !sep2)
          return &n;
        if (sep1 == sep2 || sep1->as<token> ().tok == sep2->as<token> ().tok)
          {
            prev->push (n.sep ());
            prev->push (n.node ());
            return prev;
          }
      }
    return &n;
  }
};
