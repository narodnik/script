#!/bin/bash
shopt -s nullglob
for i in *.dbm *.mdl *.mod *.xm *.it *.s3m *.669 *.mptm *.med *.mtm *.MOD *.sid *.S3M *.XM *.ult *.psm; do
    WAV="${i%.*}.wav"
    MP3="${i%.*}.mp3"
    xmp $i -o $WAV
    ffmpeg -i $WAV -acodec mp3 -ab 128k $MP3
    rm $WAV $i
done

