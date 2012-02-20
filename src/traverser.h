#pragma once

#include "visitor.h"

namespace ast
{
  struct traverser
    : visitor
  {
    virtual node_ptr visit (generic_node &n);

    virtual node_ptr visit (ambiguity &n);
    virtual node_ptr visit (token &n);

    bool resume (node_ptr const &n);

#define PURE
#include "visitor_methods.h"
#undef PURE
  };
}
