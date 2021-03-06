#!/usr/bin/env bash

# rainbowgen
# C. d'Eon 2014
# generate md5 & sha1 lookup tables from a wordlist,
# as raw text or as an SQL insert statement.
# not exactly elegant with the if statements but gets the job done :)
# requires openssl

if [[ $# > 2 ]]; then 

    printf "%s\n" "Too many arguments!"
    printf "%s\n" "Usage: ./rainbowgen.sh [-S] [/path/to/wordlist.txt]"
    exit 0;

elif [[ -f $1 ]]; then 

    wordlist="$1"

elif [[ -f $2 ]]; then

    wordlist="$2"

elif ([[ $# == 1 ]] && [[ $1 == "-S" ]]) || ([[ $# == 0 ]] || [[ ! -f $@ ]]); then    
# lol ^^^

    until [[ -f $wordlist ]]; do read -p "Enter path to wordlist file: " wordlist; done

fi

outfile="${wordlist%.*}-hashed"
words=`cat $wordlist` 

printf "%s\n" "Hashing wordlist! May take a while depending on your list size. Plz wait..."

if [[ $1 == "-S" ]] || [[ $2 == "-S"  ]]; then

    printf "%s\n" 'DROP DATABASE IF NOT EXISTS rainbow;' > "${outfile}.sql" 
    printf "%s\n" 'CREATE DATABASE rainbow;' >> "${outfile}.sql"
    printf "%s\n" 'USE rainbow;' >> "${outfile}.sql"
    printf "%s\n" 'CREATE TABLE rainbow (' >> "${outfile}.sql"
    printf "%s\n" 'id INT(12) NOT NULL AUTO_INCREMENT,' >> "${outfile}.sql"
    printf "%s\n" 'word VARCHAR(64) NOT NULL,' >> "${outfile}.sql"
    printf "%s\n" 'md5hash VARCHAR(32) NOT NULL,' >> "${outfile}.sql"
    printf "%s\n" 'sha1hash VARCHAR(40) NOT NULL, PRIMARY KEY ("id") );' >> "${outfile}.sql"
    printf "%s\n" 'LOCK TABLES rainbow WRITE;' >> "${outfile}.sql"
    printf "%s\n" 'INSERT INTO rainbow (word, md5hash, sha1hash) VALUES' >> "${outfile}.sql"
    
    for i in $words; do

	      printf "%s" "('" >> "${outfile}.sql"
	      printf "%s" "$i" | sed s/"'"/"''"/g >> "${outfile}.sql"
	      printf "%s" "', '" >> "${outfile}.sql"
	      printf "%s" "$i" | openssl md5 | awk '{ printf "%s", $2 }' >> "${outfile}.sql"
	      printf "%s" "', '" >> "${outfile}.sql"
	      printf "%s" "$i" | openssl sha1 | awk '{ printf "%s", $2 }' >> "${outfile}.sql"
	      printf "%s\n" "')," >> "${outfile}.sql"

    done
    
    printf "%s\n" "('end of table!', 'insert statement automated by', 'ur boi d');" >> "${outfile}.sql"
    printf "%s" "UNLOCK TABLES;" >> "${outfile}.sql"

    printf "%s\n" "DONE! check ${outfile}.sql in current directory for the generated SQL insert statement."

else

    cat /dev/null > "${outfile}.txt"

    for i in $words; do
	    
	      printf "%s" "$i " >> "${outfile}.txt"
	      printf "%s" "$i" | openssl md5 | awk '{ printf "%s", $2 }' >> "${outfile}.txt"
	      printf "%s" " " >> "${outfile}.txt"
	      printf "%s" "$i" | openssl sha1 | awk '{ printf "%s\n", $2 }' >> "${outfile}.txt"
        
    done

    printf "%s\n" "DONE! check ${outfile}.txt in current directory for the generated list."

fi
