#pragma once

#include "node.h"

#include <tr1/unordered_map>
#include <vector>

#include <boost/array.hpp>

enum ns_type
{
  NS_LABELS,
  NS_TAGS,
  NS_IDS,
};

struct symbol_table
{
  typedef std::tr1::unordered_map<shstr, node_ptr> nspace;
  typedef boost::array<nspace, 3> namespaces;
  typedef std::tr1::unordered_map<node_ptr, namespaces> scope_map;
  typedef std::vector<namespaces *> scope_stack;

  // one symbol table for each namespace
  scope_map table;
  scope_stack stack;

  void enter_scope (node_ptr scope);
  void leave_scope (node_ptr scope);

  void insert (shstr id, ns_type type, node_ptr target);
  node_ptr lookup (shstr id, ns_type *type) const;

  void print () const;
};
