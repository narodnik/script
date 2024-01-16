#!/usr/bin/python
import os, sys, subprocess
from pathlib import Path
from yt_dlp import YoutubeDL
from sane_name import sane_name

# YouTube begins new wave of slowdowns for users with ad blockers enabled:
# https://9to5google.com/2024/01/13/youtube-new-wave-slow-downs-ad-blocker/

OUTPATH = "/mnt/store/vid/yt/"

if len(sys.argv) != 2:
    print("error: missing video", file=sys.stderr)
    sys.exit(-1)
url = sys.argv[1]

with YoutubeDL() as ydl:
    info = ydl.extract_info(url, download=False)
    path = ydl.prepare_filename(info)
    print(path)

    filename = sane_name(path)
    filename = str(Path(filename).with_suffix(""))

    #info["outtmpl"] = f"{filename}.%(ext)s"
    #ydl.process_info(info)
print(filename)

ydl_opts = {
    "format": "bestvideo+bestaudio",
    "outtmpl": f"{OUTPATH}/{filename}.%(ext)s",
    "writesubtitles": True,
    "subtitleslangs": ["en"],
}
with YoutubeDL(ydl_opts) as ydl:
    #ydl.download([url])
    info = ydl.extract_info(url, download=True)
    filename = info["requested_downloads"][0]["filename"]
    #print(json.dumps(ydl.sanitize_info(info), indent=2))
print(f"Downloaded {filename}")
os.system(f"mpv {filename}")

