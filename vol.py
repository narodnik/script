#!/usr/bin/python
import os, sys
from subprocess import run

def get_volume():
    out = run(["wpctl", "get-volume", "@DEFAULT_SINK@"],
              capture_output=True).stdout
    vol = out.decode("ascii").split(" ")[1]
    try:
        return float(vol)
    except ValueError:
        return None

def dec_round(vol):
    return round(2*vol*10) / (2*10)

def set_volume(vol):
    os.system(f"wpctl set-volume @DEFAULT_SINK@ {vol}")

def main(argv):
    if len(argv) != 2:
        print("missing arg", file=sys.stderr)
        return -1

    cmd = argv[1]
    vol = get_volume()

    for c in cmd:
        if c == "+":
            vol += 0.05
        elif c == "-":
            vol -= 0.05
        else:
            print("wrong command", file=sys.stderr)
            return -1

    set_volume(dec_round(vol))
    print(get_volume())

    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv))

