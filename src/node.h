#pragma once

#include <string>
#include <vector>

#include "foreach.h"
#include "location.h"
#include "forward.h"
#include "struct/shstr.h"

enum node_kind
{
#include "node_kind.h"
  NODE_AMBIGUITY,
  NODE_TOKEN
};

char const *node_kind_name (node_kind kind);
char const *node_member_name (node_kind kind, size_t index);

node_ptr ast_of_sexpr (char const *file);

namespace ast
{
  struct visitor;
}

struct node
  : refcounted
{
  static size_t node_count;

  virtual node_ptr accept (ast::visitor &n) = 0;
  virtual node_kind kind () const = 0;

  node (location const &loc)
    : loc (loc)
    , index (node_count++)
  {
  }

  template<typename T> T const &as () const { return dynamic_cast<T const &> (*this); }
  template<typename T> T       &as ()       { return dynamic_cast<T       &> (*this); }
  template<typename T> boost::intrusive_ptr<T> is () { return dynamic_cast<T *> (this); }

  location const loc;
  size_t index;
};


struct ambiguity
  : node
{
  virtual node_ptr accept (ast::visitor &v);
  virtual node_kind kind () const;

  ambiguity (location const &loc, node_ptr a, node_ptr b)
    : node (loc)
    , a (a)
    , b (b)
  {
  }

  node_ptr a;
  node_ptr b;
};

node *node_merge (node *a, node *b);


#include "parser.h"

/**
 * token
 */
struct token
  : node
{
  virtual node_ptr accept (ast::visitor &n);
  virtual node_kind kind () const;
  token (location const &loc, yytokentype tok, char const *text, size_t leng)
    : node (loc)
    , tok (tok)
    , lexeme (text, leng)
  {
  }

  token (location const &loc, yytokentype tok, shstr lexeme)
    : node (loc)
    , tok (tok)
    , lexeme (lexeme)
  {
  }

  yytokentype const tok;
  shstr const lexeme;
};

char const *token_name (yytokentype token);

typedef boost::intrusive_ptr<token> token_ptr;
typedef std::vector<node_ptr> node_vec;

namespace ast
{
  struct generic_node
    : node
  {
    generic_node (location const &loc)
      : node (loc)
    {
    }

    generic_node (location const &loc, size_t member_count)
      : node (loc)
    {
      children.reserve (member_count);
    }

    void push (node_ptr node)
    {
      children.push_back (node);
    }

    node_ptr const &operator [] (size_t index) const;
    node_ptr       &operator [] (size_t index);

    node_vec children;
  };

  typedef boost::intrusive_ptr<generic_node> generic_node_ptr;
}
