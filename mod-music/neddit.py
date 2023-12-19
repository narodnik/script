#!/usr/bin/python
import requests
import os
from datetime import datetime
from bs4 import BeautifulSoup

# Get the latest releases from modarchive

# Organized neatly into dirs corresponding to each day

url = "https://modarchive.org/rss.php?request=uploads"
rss_page = requests.get(url).content

#doc = open(rss_page, "r").read()
soup = BeautifulSoup(rss_page, 'xml')
for item in soup.find_all("item"):
    # Put songs in folders corresponding to date of MMYY/DD/
    date = item.pubDate.contents[0]
    # Remove timezone info
    date = date.rstrip(" Europe/Berlin")
    date = datetime.strptime(date, "%a, %d %b %Y %H:%M:%S")
    shortdate = date.strftime("%m%y/%d")
    # Try to create directory if it doesn't exist
    os.makedirs(shortdate, exist_ok=True)
    # get the download link
    href = item.description.contents[0].split(" ")[1]
    href = href.removeprefix('href="')
    href = href.rstrip('"')
    filename = href.split("#")[-1]
    fullpath = f"{shortdate}/{filename}"
    if not os.path.exists(fullpath):
        req = requests.get(href, allow_redirects=True)
        print(f"Downloading {filename} to {shortdate}")
        open(fullpath, "wb").write(req.content)
    else:
        print(f"Skipping {filename}...")

