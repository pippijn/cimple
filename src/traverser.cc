#include "traverser.h"
#include "node.h"

using namespace ast;

node_ptr
traverser::visit (generic_node &n)
{
  foreach (node_ptr &p, n.children)
    if (p)
      p = p->accept (*this);
  return &n;
}

node_ptr
traverser::visit (ambiguity &n)
{
  if (n.a) n.a = n.a->accept (*this);
  if (n.a) n.a = n.b->accept (*this);
  return &n;
}

node_ptr
traverser::visit (token &n)
{
  return &n;
}

bool
traverser::resume (node_ptr const &n)
{
  if (n)
    n->accept (*this);
  return n != NULL;
}
