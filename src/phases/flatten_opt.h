struct flatten_opt
  : phase
{
  node_ptr visit (node_opt &n)
  {
    phase::visit (n);
    return n.node ();
  }
};
