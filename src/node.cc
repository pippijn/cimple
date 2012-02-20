#include "node.h"
#include "visitor.h"

using namespace ast;

size_t node::node_count = 0;

node_ptr token::accept (visitor &v) { return v.visit (*this); }
node_kind token::kind () const { return NODE_TOKEN; }

node_ptr ambiguity::accept (visitor &v) { return v.visit (*this); }
node_kind ambiguity::kind () const { return NODE_AMBIGUITY; }

node_ptr const &generic_node::operator [] (size_t index) const { return children.at (index); }
node_ptr       &generic_node::operator [] (size_t index)       { return children.at (index); }

node *
node_merge (node *a, node *b)
{
  return new ambiguity (a->loc, a, b);
}

#include <tr1/unordered_map>

namespace std
{
  namespace tr1
  {
    template<>
    size_t hash<node_ptr>::operator () (node_ptr n) const
    {
      return n->index;
    }
  }
}
