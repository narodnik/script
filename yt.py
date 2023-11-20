#!/usr/bin/python
import sys, subprocess
from pathlib import Path
from yt_dlp import YoutubeDL

if len(sys.argv) != 2:
    print("error: missing video", file=sys.stderr)
    sys.exit(-1)
url = sys.argv[1]

with YoutubeDL() as ydl:
    info = ydl.extract_info(url, download=False)
    path = ydl.prepare_filename(info)
    print(path)

    filename = subprocess.run(["sane-name", path], capture_output=True)
    filename = filename.stdout.decode().strip()
    filename = str(Path(filename).with_suffix(""))

    #info["outtmpl"] = f"{filename}.%(ext)s"
    #ydl.process_info(info)
print(filename)

ydl_opts = {
    "format": "bestvideo+bestaudio",
    "outtmpl": f"{filename}.%(ext)s",
    #"writesubtitles": True,
    #"subtitleslangs": ["en"],
}
with YoutubeDL(ydl_opts) as ydl:
    ydl.download([url])
print(f"Downloaded {filename}.webm")

