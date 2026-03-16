
import ./private/percent_format

export genPercentAndExport

import std/tables; export tables.`[]`

import pkg/pyrepr

proc tpyreprImpl(s: string): string = pyrepr(s)  ## XXX: as pyrepr has a optional arg: escape127 so mismatch

genPercentAndExport string,
                    tpyreprImpl, pyasciiImpl,
                    disallowPercentb=true



