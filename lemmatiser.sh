grep -v '<.*>' \
| sed 's/\([^A-Z][.!?]\) \([A-Z0-9]\)/\1\n\2/g' \
| sed 's/\([.!?]\) \([“]\)/\1\n\2/g' \
| tr '[A-Z]' '[a-z]' \
| sed 's/$/#/' \
| tr -d '\.\,\?\!\#\:\"\“\”\(\)\;' \
| tr ' ' '\n' \
| grep -v '^$' \
| grep -vwf stop.txt \
| cmd/tree-tagger-english \
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
| sed 's/israelis#NP#<unknown>/israelis#NN#israel/' \
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
| sed 's/^\([^#]*\)#\([A-Z]*\)#<unknown>/\1#\2#\1/g' \
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
| grep -v '#RB#' \
| sed 's/#IN#/#NN#/' \
| grep -v '<unknown>' \
| tr '[A-Z]' '[a-z]' \
| grep -v '\:' \
| sed 's/#.*#//' \
