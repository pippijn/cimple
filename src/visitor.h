#pragma once

#include "forward.h"

struct ambiguity;
struct token;

namespace ast
{
  struct generic_node;

  struct visitor
  {
    virtual node_ptr visit (generic_node &n) = 0;

    virtual node_ptr visit (ambiguity &n) = 0;
    virtual node_ptr visit (token &n) = 0;

#define PURE = 0
#include "visitor_methods.h"
#undef PURE
  };
}
