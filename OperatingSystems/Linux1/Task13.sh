#Task13
#Spróbuj wykonac dowiazanie trwale i symboliczne do dowolnego katalogu. Jaki efekt?
ln -s \$HOME/grupa_6/kat1 $HOME/kat1_s
ln $HOME/grupa_6/kat1 $HOME/kat1_h
#ln: /root/grupa_6/kat1: hard link not allowed for directory
