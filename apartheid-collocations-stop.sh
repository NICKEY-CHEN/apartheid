#! /bin/bash

# Maris Sander
# 02.05.2017
# In writing this scrip I have followed the principles of Kristel Uiboaed´s (2016, November 11) collocation script kollokatsioonid.sh. Retrieved from: https://github.com/kristel-/Corpus-Linguistics/blob/master/Unix/kollokatsioonid.sh.
# To give rights to use the script on a text corpus use command chmod u+x apartheid-collocations-stop.sh
# To create collocations file for file ALL.txt, use command line i.e. cat ALL.txt |./apartheid-collocations-stop.sh > ALL-apartheid-collocatuons-stop.txt
# To create frequency list for all "apartheid" lemmatised collocates and tag them as noun et. al (NN) or verb (VB) word type group, use the scrpit tag-count.sh from my repository https://github.com/marissander/apartheid

# CREATE WORD LIST FILE: put each word in corpus to one line.
# Delete lines with (grep -v) URL-marking (everything between <.*>).
# Put one sentence on one line: replace (sed) empty space ( ) marks that follow end marks ([.!?]), which comes after non-capital letters ([^A-Z]) and before capital letters or numbers ([A-Z0-9]) with end of line (\n).
# Do the same with quotation marks (in the beginning of a sentence) (["]).
# Leave only lines (grep) that include the word "apartheid".
# Translate (tr) all capital ([A-Z]) letters to small letters ([a-z]).
# Replace line endings ($) with symbol # so it is possible to find sentence endings in the analysis of word pairs.
# Delete (tr -d)  unneccecary punctuation.
# Replace (tr) empty spaces with line brakes (\n), so in each line there is one word.
# Delete (grep -v) all empty lines (^$).
# Put (sed) four spaces after each sentence end (#), so that it will become possible to copy wordlists with an interval to the original wordlist file (read.txt).

grep -v '<.*>' \
| sed 's/\([^A-Z][.!?]\) \([A-Z0-9]\)/\1\n\2/g' \
| sed 's/\([.!?]\) \([“]\)/\1\n\2/g' \
| grep 'apartheid' \
| tr '[A-Z]' '[a-z]' \
| sed 's/$/#/' \
| tr -d '\.\,\?\!\:\"\“\”\(\)\;' \
| tr ' ' '\n' \
| grep -v '^$' \
| sed 's/#/\n\n\n\n\n/' > read.txt

# CREATE NEW WORDLIST FILES: in each file there is one word less than in previous wordlist file.
# Print all lines (tail -n) starting from (+i) line (+2) (inclusive) to a new wordlist file (read-1.txt) (without the first word of read.txt).
# Print all lines (tail -n) starting from (+i) line (+3) (inclusive) to a new wordlist file (read-2.txt) (without 2 first words of read.txt).
# Print all lines (tail -n) starting from (+i) line (+4) (inclusive) to a new wordlist file (read-3.txt) (without 3 first words of read.txt).
# Print all lines (tail -n) starting from (+i) line (+5) (inclusive) to a new wordlist file (read-4.txt) (without 4 first words of read.txt).
# Print all lines (tail -n) starting from (+i) line (+6) (inclusive) to a new wordlist file (read-5.txt) (without 5 first words of read.txt).
# Print all lines (tail -n) starting from (+i) line (+7) (inclusive) to a new wordlist file (read-6.txt) (without 6 first words of read.txt).

cat read.txt | tail -n +2 > read-1.txt
cat read.txt | tail -n +3 > read-2.txt
cat read.txt | tail -n +4 > read-3.txt
cat read.txt | tail -n +5 > read-4.txt
cat read.txt | tail -n +6 > read-5.txt
cat read.txt | tail -n +7 > read-6.txt

# CREATE WORD PAIR FILE: copy all new wordlists next to original wordlist.
# Copy wordlist file without first word of original wordlist file (read-1.txt) to original wordlist file (read.txt) and create a word pairs file (paarid.txt), which begins with word pairs where there are no words between the word apartheid and its collocate word.
# Copy other wordlist files at the end of word pairs file (paarid.txt), so that in it there are all word pairs with 0-5 words between "apartheid" and its collocate word. 

paste read.txt read-1.txt > paarid.txt
paste read.txt read-2.txt >> paarid.txt
paste read.txt read-3.txt >> paarid.txt
paste read.txt read-4.txt >> paarid.txt
paste read.txt read-5.txt >> paarid.txt
paste read.txt read-6.txt >> paarid.txt


# CLEAN COLLOCATIONS FILE
# Analyse (grep) only collocations that include the word "apartheid".
# Translate (tr) the tabs (\t) to #.
# Delete unknown marks (�).
# Replace all apartheid-word-formulations (e.g. apartheidthe) that are not real compound words (but come from misspelling for example) with the word "apartheid".
# Delete lines (grep -v) with only one word on line (^# and #$).
# Delete punctuation (tr-d...) and URL-marking (sed...).
# Replace (tr) the previous tabs (marked as #) with end of line (\012), so we can get list of all collocates for the word "apartheid" (within distance of 0-5 words between "apartheid" and its collocate), where one word is on one line.
# Delete (grep -v) empty lines (^$).
# Delete stopwords (grep -vwf) from list (downloaded from .

cat paarid.txt \
| grep '[^\t]*apartheid[^\t]*' \
| tr '\t' '#'  \
| sed 's/�//g' \
| sed 's/apartheid[^-]*/apartheid/' \
| grep -v '^#' \
| grep -v '#$' \
| tr -d '\]\<\>\`\[' \
| sed 's/\<.*>//g' \
| tr '#' '\012' \
| grep -v '^$' \
| grep -vwf stop.txt \


