
import std/unittest
import std/tables

import pyformats/percent
import pyformats/curly
test "percent":
  # Test cases
  check "Hello, %s! Hello %c" % ("World", 86) == "Hello, World! Hello V"
  check "Number: %d" % (42,) == "Number: 42"
  check "Hex: %#x" % 255 == "Hex: 0xff"
  check "Float: %.2f" % (3.14159,) == "Float: 3.14"
  check "Char: %c" % ('A',) == "Char: A"
  check "Dict: %(key)s" % {"key": "value", "k2": 1} == "Dict: value"
  check "Multiple: %s, %d" % ("test", 123) == "Multiple: test, 123"

test "curly":
  check "ad 3 e" == "ad {} e".pyformat("3")
  check "ad 3 e 3" == "ad {0} e {0}".pyformat(3)
  check "ad 3 e 5 3" == "ad {0} e {a} {0}".pyformat(3, a=5)
  check "5,a" ==  "{},{}".pyformat(3+2,'a')
  let aa = 'c'
  check "5,c" == "{},{}".pyformat(3+2, aa)

  var vs = "{},"
  check "5,c" == (vs & "{}").pyformat(3+2, aa)
  vs.add "}}"
  check "5,}}c" == (vs & "{}").pyformat(5, aa)
  check "5,}}4" == (vs & "{aa}").pyformat(5, aa=4)

  let tab = {"a": 12}.toTable
  check "^12$" == "^{a}$".pyformatMap(tab)

