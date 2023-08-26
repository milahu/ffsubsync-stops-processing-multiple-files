#! /usr/bin/env bash

#set -x

# pysubs2.exceptions.UnknownFPSError: Framerate was not specified and cannot be read from the MicroDVD file.
sub_files=(bad.sub good.srt)

# pysubs2.exceptions.UnknownFPSError: Framerate was not specified and cannot be read from the MicroDVD file.
#sub_files=(bad.sub good.sub)

# NotImplementedError: unsupported output format: sub
# fixme: the input file should not be processed at all
#sub_files=(good.sub)

# ok
#sub_files=(good.srt)

sub_hashes_a="$(md5sum ${sub_files[@]})"
echo "$sub_hashes_a"

ffs --overwrite-input video.mp4 -i ${sub_files[@]}

sub_hashes_b="$(md5sum ${sub_files[@]})"
echo "$sub_hashes_b"

if [[ "$sub_hashes_a" == "$sub_hashes_b" ]]; then
  echo "fail: some sub files were not modified"
  diff -s -u --label sub_hashes_a <(echo "$sub_hashes_a") --label sub_hashes_b <(echo "$sub_hashes_b")
else
  echo "ok: all sub files were modified"
fi

# restore the original files
./make-test-subs.sh
