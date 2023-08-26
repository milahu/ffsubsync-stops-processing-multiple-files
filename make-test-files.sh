#! /usr/bin/env bash

./make-test-subs.sh

# generate audio
espeak -s 120 -g 1 -v mb/mb-en1 -w audio.wav "hello world"
ffmpeg -i audio.wav -c flac -y audio.wav.flac
rm audio.wav

# generate empty video, mux with audio
ffmpeg -t 6 -s 640x480 -f rawvideo -pix_fmt rgb24 -r 25 -i /dev/zero -i audio.wav.flac -af "adelay=2000|2000" -y video.mp4

# audio position: 2 seconds
# sub positions: 4 seconds

# expected result: ffs should move the subs from 4 to 2 seconds
