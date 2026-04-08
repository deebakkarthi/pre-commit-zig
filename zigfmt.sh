#!/usr/bin/env bash

# No files
# pre-commit will skip it if no files are matched
# Just having this anyways as it doesn't hurt
if [[ "$#" -eq 0 ]]; then
	return 0
fi

# Exit on first error. You are not gonna commit anyways
# You will run zig fmt after fixing the error anyways
for file in "$@"; do
	echo -ne "Formatting $file\n"
	if ! zig fmt "$file"; then
		exit 1
	fi
done

exit 0
