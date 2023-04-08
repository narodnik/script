Install:

* pandoc
* texlive-most

Create a symlink in `~/.local/bin/` to both `md2pdf` and `mdview`:

```bash
mkdir -p ~/.local/bin/
mkdir -p ~/.local/src/
cd ~/.local/src/
git clone https://github.com/narodnik/md2pdf
cd ~/.local/bin/
ln -s ~/.local/src/md2pdf/md2pdf.sh md2pdf
ln -s ~/.local/src/md2pdf/mdview.sh mdview
ln -s ~/.local/src/md2pdf/mdauto.sh mdauto
```

```bash
$ ls -l ~/.local/bin/md2pdf 
lrwxrwxrwx 1 xxx xxx 5 May 17 10:00 /home/xxx/.local/bin/md2pdf -> /home/xxx/src/md2pdf/md2pdf.sh
$ ls -l ~/.local/bin/mdview 
lrwxrwxrwx 1 xxx xxx 5 May 17 10:00 /home/xxx/.local/bin/mdview -> /home/xxx/src/md2pdf/mdview.sh
```

# Mac

* basictex

Run these commands:

```bash
$ tlmgr install sectsty
$ tlmgr install enumitem
$ texhash
```

