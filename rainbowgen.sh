#!/usr/bin/env bash

# rainbowgen
# C. d'Eon 2014
# generate md5 & sha1 lookup tables from a wordlist,
# as raw text or as an SQL insert statement.
# not exactly elegant with the if statements but gets the job done :)
# requires openssl

if [[ -f $1 ]]; then 
    wordlist="$1"
elif [[ -f $2 ]]; then
    wordlist="$2"
elif [[ $# == 1 ]] && [[ $1 == "-sql" ]]; then
    read -p "Enter path to wordlist file: " wordlist    
elif [[ $# == 0 ]] || [[ ! -f $@ ]]; then
    read -p "Enter path to wordlist file: " wordlist
elif [[ $# > 2 ]]; then 
    printf "%s\n" "Only one argument allowed!"
    printf "%s\n" "Usage: ./rainbowgen.sh [/path/to/wordlist.txt] [-sql]"
    exit 0;
fi

outfile="${wordlist%.*}-hashed"
words=`cat $wordlist` 

printf "%s\n" "Hashing wordlist! May take a while depending on your list size. Plz wait..."

if [[ $2 == "-sql" ]] || [[ $1 == "-sql"  ]]; then

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
	    printf "%s" "$1" | sed s/"'"/"''"/g >> "${outfile}.sql"
	    printf "%s" "', '" >> "${outfile}.sql"
	    printf "%s" "$1" | openssl md5 | awk '{ printf "%s", $2 }' >> "${outfile}.sql"
	    printf "%s" "', '" >> "${outfile}.sql"
	    printf "%s" "$1" | openssl sha1 | awk '{ printf "%s", $2 }' >> "${outfile}.sql"
	    printf "%s" "')," >> "${outfile}.sql"
	    printf "\n" >> "${outfile}.sql"
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
	    printf "%s" "$i" | openssl sha1 | awk '{ print $2 }' >> "${outfile}.txt"
    done

    printf "%s\n" "DONE! check ${outfile}.txt in current directory for the generated list."

fi
