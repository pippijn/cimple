#pragma once

#include <cstddef>

struct shstr
{
  struct container;

  shstr (char const *text, size_t length);

  size_t length () const;
  size_t hash () const;
  char const *c_str () const;
  char const *data () const;

  char operator [] (size_t index) const;

  bool empty () const;

  bool operator == (shstr rhs) const { return s == rhs.s; }

  static void init_shstrs ();

private:
  container const *s;

  shstr ();
};
