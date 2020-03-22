#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

TESTCOIND=${TESTCOIND:-$SRCDIR/testcoind}
TESTCOINCLI=${TESTCOINCLI:-$SRCDIR/testcoin-cli}
TESTCOINTX=${TESTCOINTX:-$SRCDIR/testcoin-tx}
TESTCOINQT=${TESTCOINQT:-$SRCDIR/qt/testcoin-qt}

[ ! -x $TESTCOIND ] && echo "$TESTCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
TTCVER=($($TESTCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for testcoind if --version-string is not set,
# but has different outcomes for testcoin-qt and testcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$TESTCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $TESTCOIND $TESTCOINCLI $TESTCOINTX $TESTCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${TTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${TTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
