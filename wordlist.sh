# wordlist.sh
# Maris Sander
# 02.05.2017

# T-score formula is: t-score = (O-E)/√O, where E=(f1*f2)/N. The sample size/total number of tokens in the texts is N.
# Their collocational appearances: O is observed frequency of a word pair and E is their expected frequency.
# f1 is the mrginal appearance of the research word "apartheid" (f1 is first operationalized with | grep 'apartheid' \ line in apartheid-collocates-stop.sh script).
# f2 is the second component of the word pair (i.e. | grep 'israel').

# This script puts each word on a separate line so I could calculate the number of specific words in each text.

# Script for wordlist.sh

grep -v '<.*>' \
| sed 's/\([^A-Z][.!?]\) \([A-Z0-9]\)/\1\n\2/g' \
| sed 's/\([.!?]\) \([“]\)/\1\n\2/g' \
| tr '[A-Z]' '[a-z]' \
| sed 's/$/#/' \
| tr -d '\.\,\?\!\#\:\"\“\”\(\)\;' \
| tr ' ' '\n' \
| grep -v '^$' \

# T-SCORE CALCULATION

# N
# I first calculated all the words (N) in the text, with the command for example for file ALL.txt: cat ALL.txt |./wordlist.sh | wc -w
# Result 2 052 967 words

# f1
# I then counted all the marginal appearances (wc -w) of variations (including compound words) of "apartheid" (f1) by using the following command: cat ALL.txt |./wordlist.sh | grep 'apartheid' | wc -w

# f2
# To calculate marginal word (f2) appearances for example the word "israel", I used the following command: cat ALL.txt |./wordlist.sh | grep "israel" | wc -w
# Result 33755 words

# I pasted the results to an Excel file and calculated the t-scores for main collocates, measuring the strength of association between the research word "apartheid" and its collocate words. 

