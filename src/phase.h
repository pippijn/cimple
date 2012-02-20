#pragma once

#include "struct/symtab.h"
#include "traverser.h"

struct phase
  : ast::traverser
{
  static symbol_table symtab;

  static char const *type (node &n)
  {
    return node_kind_name (n.kind ());
  }

  template<typename T>
  boost::intrusive_ptr<T> is (node_ptr n)
  {
    return n ? n->is<T> () : 0;
  }

  token_ptr find_declaring_name (node_ptr n);
};
