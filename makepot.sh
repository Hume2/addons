#!/bin/sh
xgettext --keyword='_' -C -o data/locale/messages.pot `find src -name "*.cpp"`
for LEVELSET in `ls src`; do
  find src/$LEVELSET "(" -name "*.stl" -or -name "*.stwm" -or -name "*.txt" ")" -print0 | xargs -0 xgettext --keyword='_:1' --language=Lisp --sort-by-file --output translations/$LEVELSET.pot
done
