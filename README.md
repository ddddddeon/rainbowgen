rainbowgen
==========

Generate MD5 &amp; SHA-1 lookup tables from a user-supplied wordlist. Outputs either to raw .txt file or as an SQL insert statement.

Usage:
------

```
./rainbowgen.sh [/path/to/wordlist.txt] [-sql]
```

Passing the ```-sql``` flag will prepare the hashed wordlist as an SQL statement for database insertion. 

If no filename argument is passed, rainbowgen will prompt for the wordlist path. 

This script requires OpenSSL.