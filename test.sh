#!/bin/sh
files=$(git diff cached name-only diff-filter=ACM | grep .go$)
if [ -z files ]; then
exit 0
fi
unfmtd=$(gofmt -l $files)
if [ -z unfmtd ]; then
exit 0
fi
echo Some .go files are not fmtd
exit 1
