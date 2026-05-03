## Pure Implemenation of [Python's printf style formatting](https://docs.python.org/3/library/stdtypes.html#printf-style-string-formatting) for Nim

import ./private/percent_format

export genPercentAndExport

import std/tables; export tables.`[]`

import pkg/pyrepr

proc tpyreprImpl(s: string): string = pyrepr(s)  ## XXX: as pyrepr has a optional arg: escape127 so mismatch

genPercentAndExport string,
                    tpyreprImpl, pyasciiImpl,
                    disallowPercentb=true

type Getitemable*[K, V] = concept self
  self[K] is V

proc Py_FormatEx*[T
    ](
    format: string, arg: Getitemable[string, T],
    reprCb: proc (x: string): string = tpyreprImpl,
    asciiCb: proc (x: string): string = tpyreprImpl,
    `disallow%b` = true
    ): string =
  ##[ underlying function for percent_format.

export for implementing custom runtime formating.

where `T` is `Any|string|SomeNumber|char|<string-convertable>` ]##
  Py_FormatEx true, format, arg, reprCb, asciiCb, `disallow%b`=`disallow%b`

proc Py_FormatEx*[T
    ](
    format: string, args: openArray[T],
    reprCb: proc (x: string): string = tpyreprImpl,
    asciiCb: proc (x: string): string = tpyreprImpl,
    `disallow%b` = true
    ): string =
  ##[ underlying function for percent_format.

export for implementing custom runtime formating.

where `T` is `Any|string|SomeNumber|char|<string-convertable>` ]##
  Py_FormatEx false, format, args, reprCb, asciiCb, `disallow%b`=`disallow%b`


