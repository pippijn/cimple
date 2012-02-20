#include "symtab.h"


void
symbol_table::enter_scope (node_ptr scope)
{
  stack.push_back (&table[scope]);
}

void
symbol_table::leave_scope (node_ptr scope)
{
  assert (stack.back () == &table[scope]);
  stack.pop_back ();
}


void
symbol_table::insert (shstr id, ns_type type, node_ptr target)
{
  nspace &scope = stack.back ()->at (type);
  if (scope.find (id) != scope.end ())
    throw 0;
  scope[id] = target;
}

node_ptr
symbol_table::lookup (shstr id, ns_type *type) const
{
  for (scope_stack::const_reverse_iterator it = stack.rbegin (); it != stack.rend (); ++it)
    {
      namespaces &scopes = **it;
      for (namespaces::const_iterator it = scopes.begin (); it != scopes.end (); ++it)
        {
          nspace::const_iterator found = it->find (id);
          if (found != it->end ())
            {
              *type = ns_type (it - scopes.begin ());
              return found->second;
            }
        }
    }

  return NULL;
}


void
symbol_table::print () const
{
}
