#pragma once

#include <boost/intrusive_ptr.hpp>

using boost::dynamic_pointer_cast;

struct refcounted
{
  int refcnt;

  refcounted () : refcnt (0) { }
  virtual ~refcounted () { }

  friend void intrusive_ptr_add_ref (refcounted *n) { ++n->refcnt; }
  friend void intrusive_ptr_release (refcounted *n) { if (!--n->refcnt) delete n; }
};
