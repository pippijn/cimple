struct insert_syms
  : phase
{
  node_ptr visit (translation_unit &n)
  {
    symtab.enter_scope (&n);
    phase::visit (n);
    symtab.leave_scope (&n);
    return &n;
  }

  node_ptr visit (function_declaration &n)
  {
    token_ptr name = find_declaring_name (n.id ());
    if (name)
      {
        printf ("function declaration: %s\n", name->lexeme.c_str ());
        symtab.insert (name->lexeme, NS_IDS, &n);
      }

    return &n;
  }
};
