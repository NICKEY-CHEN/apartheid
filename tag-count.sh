# Maris Sander
# 02.05.2017
# I used the program TreeTagger to tag and lemmatise the corpora. The TreeTagger is downloadable from http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/.
# I first downlowded the tagger package, then tagging scripts and installation script (install-tagger.sh) and then parameter files for English language from TreeTagger webpage according to the instructions on their website. 
# To give rights to use this script tag-count.sh on a text corpus use command chmod u+x tag-count.sh.
# To tag and lemmatise collcations list of the word "apartheid" in a corpus and create a new file, use command i.e. cat ALL-apartheid-collocations.txt |./tag-count.sh > ALL-tagged-counted.txt (The collocations script is in this Github repository: apartheid-collocations-stop.sh). 

# Tag (cmd) the selected file with word types.
# Replace all words that the tagger marked as unknown with its original token, e.g. sed 's/africa#NN#<unknown>/africa#NN#Africa/'.
# Replace all verb types with tag #VB# and all other word types with #NN#. 
# Delete (tr -d/grep -v) unwanted symbols (�,@,POS,: etc).
# Delete original token before first # (sed 's/^[a-z]*[^#]*//g') and leave only lemmas for analysis.
# Take into analysis only lines with capital letter tags (grep '[A-Z]').
# Delete unknown words to tagger (grep -v '<unknown>'). 
# Translate capital letters to small letters (tr '[A-Z]' '[a-z]')
# Sort the results by unique appearances and starting from the most frequent collocate.

cmd/tree-tagger-english \
| tr '\t' '#' \
| sed 's/apartheid-style#NN#<unknown>/apartheid-style#NN#apartheid-style/' \
| sed 's/apartheid-era#NN#<unknown>/apartheid-era#NN#apartheid-era/' \
| sed 's/netanyahu#NN#<unknown>/netanyahu#NN#netanyahu/' \
| sed 's/africa#NN#<unknown>/africa#NN#Africa/' \
| tr -d '�' \
| sed 's/african#NN#<unknown>/african#NN#african/' \
| sed 's/apartheid�#NN#<unknown>/apartheid#NN#apartheid/' \
| sed 's/�apartheid�#NN#<unknown>/apartheid#NN#apartheid/' \
| sed 's/�apartheid#NN#<unknown>/apartheid#NN#apartheid/' \
| grep -v '�#NN#<unknown>' \
| sed 's/apartheid-state#NN#<unknown>/apartheid-state#NN#apartheid-state/' \
| sed 's/apartheid�t#NN#<unknown>/apartheid#NN#apartheid/' \
| sed 's/palestine#NN#<unknown>/palestine#NN#palestine/' \
| sed 's/bds#NNS#<unknown>/bds#NN#BDS/' \
| sed 's/israel-apartheid#NN#<unknown>/israel-apartheid#NN#israel-apartheid/' \
| sed 's/israelis#NP#<unknown>/israelis#NN#israeli/' \
| sed 's/apartheid-style#JJ#<unknown>/apartheid-style#NN#apartheid-style/' \
| sed 's/herzliya�apartheid�#NN#<unknown>/herzliya-apartheid#NN#herzliya-apartheid/' \
| sed 's/haifa�apartheid�#NN#<unknown>/haifa-apartheid#NN#haifa-apartheid/' \
| sed 's/error-prone�apartheid�#NN#<unknown>/error-prone-apartheid#NN#error-prone-apartheid/' \
| sed 's/apartheid-slogans#NNS#<unknown>/apartheid-slogans#NN#apartheid-slogan/' \
| sed 's/apartheid-numbers#NNS#<unknown>/apartheid-numbers#NN#apartheid-number/' \
| sed 's/apartheid-free#JJ#<unknown>/apartheid-free#NN#apartheid-free/' \
| sed 's/apartheid-complicit#JJ#<unknown>/apartheid-complicit#NN#apartheid-complicit/' \
| sed 's/anti-israel#NP#<unknown>/anti-israel#NN#anti-israel/' \
| sed 's/apartheid�#JJ#<unknown>/apartheid#NN#apartheid/' \
| sed 's/ieapartheid#NN#<unknown>/ieapartheid#NN#apartheid/' \
| sed 's/dugard#NN#<unknown>/dugard#NN#Dugard/' \
| sed 's/apartheid-ridden#JJ#<unknown>/apartheid-ridden#NN#apartheid-ridden/' \
| sed 's/apartheid�#JJ#<unknown>/apartheid�#NN#apartheid/' \
| sed 's/�apartheid#JJ#<unknown>/apartheid#NN#apartheid/' \
| sed 's/mandela#NN#<unknown>/mandela#NN#Mandela/' \
| sed 's/israel=apartheid#NN#<unknown>/israel=apartheid#NN#israel=apartheid/' \
| sed 's/nationalityapartheid#NN#<unknown>/nationalityapartheid#NN#nationalityapartheid/' \
| sed 's/apartheid-loving#NN#<unknown>/apartheid-loving#NN#apartheid-loving/' \
| sed 's/apartheid-israel#NN#<unknown>/apartheid-israel#NN#israel-apartheid/' \
| sed 's/proapartheid#NN#<unknown>/pro-apartheid#NN#pro-apartheid/' \
| sed 's/postapartheid#NN#<unknown>/postapartheid#NN#postapartheid/' \
| sed 's/^[a-z]*[^#]*//g' \
| sed 's/#JJ#anti-apartheid/#NN#anti-apartheid/' \
| sed 's/#JJ#antiapartheid/#NN#anti-apartheid/' \
| sed 's/#NN#antiapartheid/#NN#anti-apartheid/' \
| sed 's/#JJ#Palestinian/#NN#Palestinian/' \
| sed 's/#N[PN]S#/#NN#/' \
| sed 's/#JJ#east/#NN#east/' \
| sed 's/#NP#/#NN#/' \
| grep '[A-Z]' \
| sed 's/#JJ[RS]#/#NN#/' \
| sed 's/VBD/VB/' \
| sed 's/#V.*#/#VB#/' \
| grep -v '@' \
| grep -v 'POS' \
| sed 's/#JJ#south/#NN#south/' \
| sed 's/#JJ#African/#NN#african/' \
| sed 's/#NN#claim/#VB#claim/' \
| sed 's/#NN#black/#NN#black/' \
| sed 's/#NN#charge/#VB#charge/' \
| sed 's/#NN#pro-apartheid/#NN#pro-apartheid/' \
| sed 's/#NN#call/#VB#call/' \
| sed 's/#JJ#/#NN#/' \
| sed 's/#NN#racist/#NN#racism/' \
| sed 's/#RB#/#NN#/' \
| sed 's/#IN#/#NN#/' \
| grep -v '<unknown>' \
| tr '[A-Z]' '[a-z]' \
| grep -v '\:' \
| sort | uniq -c | sort -nr
