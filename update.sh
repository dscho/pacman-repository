#!/bin/sh

die () {
	echo "$*" >&2
	exit 1
}

cd "$(dirname "$0")" || die "Could not change directory"

for arch in i686 x86_64
do
	(
		cd $arch &&
		repo-add git-for-windows.db.tar.xz *-$arch.pkg.tar.xz &&
		repo-add -f git-for-windows.files.tar.xz *-$arch.pkg.tar.xz
	)
done
