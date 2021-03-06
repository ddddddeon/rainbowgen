rainbowgen
==========

Generate MD5 &amp; SHA-1 lookup tables from a user-supplied wordlist. Outputs 
either to raw `.txt` file or to a `.sql` file as a MySQL insert statement.

Use the PHP scripts in the `php` folder to query the database generated by the
`.sql` file. 

Bash script usage:
------

```
./rainbowgen.sh [-S] [/path/to/wordlist.txt]
```

Use the file path of a newline-separated word list of your choosing as the 
script's argument. Passing the `-S` flag will prepare the hashed wordlist as
an SQL statement for database insertion. Otherwise, a plain text file 
is output.

If no filename argument is passed, rainbowgen will prompt for the 
wordlist path. 

See `wordlist.txt` for sample input, and `wordlist-hashed.txt` / 
`wordlist-hashed.sql` for sample output.

This script requires OpenSSL.

Creating the MySQL Database:
------

```
mysql -u user -p < yourlist-hashed.sql
```
If you're working with entries in the millions or billions++, you'll probably 
have to tweak your MySQL server settings, 
possibly increasing variables such as `max_allowed_packet`, `net_read_timeout`,
`net_write_timeout`, `wait_timeout`, and/or `interactive_timeout` as needed.

Configure user privileges as appropriate.

PHP script usage:
------

Use the `index.php` form to query the database by reverse md5 or sha1 lookup, 
or by cleartext, and see the results fetched by `rainbow.php`.