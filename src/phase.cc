#include "phase.h"
#include "ast.h"

using namespace ast;

symbol_table phase::symtab;

token_ptr
phase::find_declaring_name (node_ptr n)
{
  struct finder
    : traverser
  {
    node_ptr visit (postfix_identifier_declarator &n)
    {
      resume (n.declr ());
      return &n;
    }

    node_ptr visit (paren_identifier_declarator &n)
    {
      name = &n.id ()->as<identifier> ().token ()->as<token> ();

      return &n;
    }

    token_ptr name;
  } v;

  n->accept (v);

  return v.name;
};
