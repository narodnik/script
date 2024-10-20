#!/usr/bin/python
import sys
import re
from unidecode import unidecode

def split_suffix(name):
    splits = name.rsplit(".", 1)
    if len(splits) == 1:
        return name, ""
    assert len(splits) == 2
    name, suffix = splits
    return name, suffix

def replace_nonascii(name, replacement_char):
    def is_latin(c):
        return (
            # 0 - 9
            ord("0") <= ord(c) <= ord("9")
            # A - Z
            or ord("A") <= ord(c) <= ord("Z")
            # a - z
            or ord("a") <= ord(c) <= ord("z")
            or ord(c) in [ord(a) for a in ["-", "_"]]
        )
    return ''.join([c if is_latin(c) else replacement_char for c in name])

def sane_name(name):
    name, suffix = split_suffix(name)

    name = unidecode(name)
    name = name.lower()
    # delete double spaces
    name = " ".join(name.split(" "))
    name = re.sub("[\\(\\[].*?[\\)\\]]", "", name)

    name = name.rstrip()
    name = name.replace(" ", "-")
    name = replace_nonascii(name, "_")
    name = name.replace(":", "_")
    name = name.replace("_-", "_")
    name = name.replace("-_", "_")
    while "--" in name:
        name = name.replace("--", "-")
    name = name.lstrip("-_")

    if suffix:
        name += "." + suffix
    return name

if __name__ == "__main__":
    if len(sys.argv) < 2:
        name = sys.stdin.read()
    else:
        name = sys.argv[1]
    name = sane_name(name)
    print(name)

