#! /usr/bin/env bash

# bad: the first line "{1}{1}25" is missing
cat >bad.sub <<EOF
{4}{6}hello world
EOF

cat >good.sub <<EOF
{1}{1}25
{4}{6}hello world
EOF

cat >good.srt <<EOF
1
00:00:04,0 --> 00:00:06,000
hello world
EOF
