#include "shstr.h"

#include <cassert>
#include <cstring>
#include <new>
#include <tr1/unordered_set>

#define ONE_AT_A_TIME_HASH 1

struct shstr::container
{
  size_t length;
  size_t hash;
  char string;

  container ()
  {
  }

  container (size_t length, size_t hash)
    : length (length)
    , hash (hash)
  {
  }
};

namespace std
{
  namespace tr1
  {
    template<>
    size_t hash<shstr>::operator () (shstr str) const
    {
      return str.hash ();
    }
  }
}

struct traits
{
  // hash
  size_t operator () (char const *a, size_t length) const
  {
#if ONE_AT_A_TIME_HASH
    size_t hash, i;
    for (hash = i = 0; i < length; ++i)
      {
        hash += *a++;
        hash += (hash << 10);
        hash ^= (hash >> 6);
      }
    hash += (hash << 3);
    hash ^= (hash >> 11);
    hash += (hash << 15);
    return hash;
#else
    size_t h = 0;
    while (length--)
      h = 31 * h + *a++;
    return h;
#endif
  }

  size_t operator () (shstr::container const *a) const
  {
    return (*this) (&a->string, a->length);
  }

  // eq
  bool operator () (char const *a, char const *b, size_t length) const
  {
    return !memcmp (a, b, length);
  }

  bool operator () (shstr::container const *a, shstr::container const *b) const
  {
    return a->length == b->length && (*this) (&a->string, &b->string, a->length);
  }
};


struct string_set
{
  typedef std::tr1::unordered_set<shstr::container const *, traits, traits> set;
  typedef set::const_iterator const_iterator;

  set data;

  ~string_set ()
  {
    for (set::const_iterator it = data.begin (); it != data.end (); ++it)
      delete[] reinterpret_cast<char const *> (*it);
  }
};

static string_set strings;


shstr::shstr (char const *text, size_t length)
{
  assert (length < 1024 - sizeof (size_t) * 2);

  // store temporary string here
  char data[1024];

  // calculate hash
  size_t hash = traits () (text, length);

  // copy text data into string
  memcpy (data + 2 * sizeof (size_t),  text, length);

  string_set::const_iterator found = strings.data.find (new (data) container (length, hash));
  if (found == strings.data.end ())
    {
      size_t size = length + sizeof (size_t) * 2;
      char *heapdata = new char[size + 1];
      memcpy (heapdata, data, size);
      heapdata[size] = '\0';
      found = strings.data.insert (new (heapdata) container).first;
    }

  s = *found;
}

shstr::shstr ()
  : s (0)
{
}

size_t
shstr::length () const
{
  return s->length;
}

size_t
shstr::hash () const
{
  return s->hash;
}

char const *
shstr::c_str () const
{
  return &s->string;
}

char const *
shstr::data () const
{
  return c_str ();
}

bool
shstr::empty () const
{
  return !s || length () == 0;
}

char
shstr::operator [] (size_t index) const
{
  return data ()[index];
}
