#!/usr/bin/python
import glob, os, sys, subprocess
from pathlib import Path
from yt_dlp import YoutubeDL
from sane_name import sane_name

# YouTube begins new wave of slowdowns for users with ad blockers enabled:
# https://9to5google.com/2024/01/13/youtube-new-wave-slow-downs-ad-blocker/

OUTPATH = "/mnt/store/vid/yt"

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

existing_file = glob.glob(f"{OUTPATH}/{filename}.*")
if not existing_file:
    ydl_opts = {
        "format": "bestvideo[height<=1080]+bestaudio",
        "outtmpl": f"{OUTPATH}/{filename}.%(ext)s",
        "writesubtitles": True,
        "subtitleslangs": ["en.*"],
    }
    with YoutubeDL(ydl_opts) as ydl:
        #ydl.download([url])
        info = ydl.extract_info(url, download=True)
        print(info["requested_downloads"][0])
        saved_filename = info["requested_downloads"][0]["filename"]
        #print(json.dumps(ydl.sanitize_info(info), indent=2))
    print(f"Downloaded {saved_filename}")

    # Rename retarded subs file
    #subsfile = glob.glob(f"{OUTPATH}/{filename}.en*.vtt")
    #if subsfile:
    #    subsfile = subsfile[0]
    #    os.rename(subsfile, f"{OUTPATH}/{filename}.vtt")
else:
    saved_filename = existing_file[0]

os.system(f"mpv --sub-auto=fuzzy --sid=1 {saved_filename}")

