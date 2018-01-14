#!/bin/bash

set -x
set -e -u -o pipefail

readonly REPODIR=$(realpath $(dirname $0)/..)

_main() {
	local SRCDIR
	local BUILDDIR
	readonly SRCDIR=${REPODIR}
	readonly BUILDDIR=${REPODIR}/build

	cmake -GNinja -H${SRCDIR} -B${BUILDDIR} -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_EXE_LINKER_FLAGS=-static
	cmake --build ${BUILDDIR}
}

_main
