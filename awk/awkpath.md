# awk path

```
$ export AWKPATH=/home/adrian/gits/my_templates/awk

$ man gawk | grep -C 2 -e AWKPATH
--include include-file
              Load  an  awk  source library.  This searches for the library using the AWKPATH environment variable.
```
```bash
adrian@pc:~/gits/my_templates/awk>(main) echo $AWKPATH
/home/adrian/gits/my_templates/awk
adrian@pc:~/gits/my_templates/awk>(main) awk -i date_time.awk -i num_nullpad.awk 'BEGIN {print date_time("date"); for (i=1; i<10; i++) print num_nullpad(i)}'
2022-05-30
001
002
003
004
005
006
007
008
009
adrian@pc:~/gits/my_templates/awk>(main) cd
adrian@pc:~> awk -i date_time -i num_nullpad 'BEGIN {print date_time("date"); for (i=1; i<10; i++) print num_nullpad(i)}'
2022-05-30
001
002
003
004
005
006
007
008
009
adrian@pc:~>
```

