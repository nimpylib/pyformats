## Pure Implemenation of [Python's printf style formatting](https://docs.python.org/3/library/stdtypes.html#printf-style-string-formatting) for Nim

import ./private/percent_format

export genPercentAndExport

import std/tables; export tables.`[]`

import pkg/pyrepr

proc tpyreprImpl(s: string): string = pyrepr(s)  ## XXX: as pyrepr has a optional arg: escape127 so mismatch

genPercentAndExport string,
                    tpyreprImpl, pyasciiImpl,
                    disallowPercentb=true



