# Character Decoder

all u need to do is put ur stupid files and go for a coffee.

## dir
  - file/raw: raw files
  - file/origin: output files

## cmd
  - mode:
    - 0: use iconv (shell, libiconv)
    - 1: use iconv-lite (nodejs, vscode lib)
  - dirname: rename target dir
  - ignores: files ignored, separator is '|'

```shell
$ sh ins-char.sh {mode} {dirname} {ignores}
```