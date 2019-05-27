# permanent_auth_lxplus

ref:http://lhcb.github.io/analysis-essentials/shell-extras/persistent-screen.html




create_key.sh : store passwd info.

kini_k.sh : authorize existing key(?)



(1) Generate your key
> source create_key.sh

(2) Enter following command. PLEASE NOTE THAT <USERNAME>@CERN.CH is not capital letters!
  (e.g.) jhchoi@CERN.CH

add_entry -password -p <USERNAME>@CERN.CH -k 1 -e arcfour-hmac-md5
==>your CERN account passwd

add_entry -password -p <USERNAME>@CERN.CH -k 1 -e aes256-cts
==>your CERN account passwd

wkt <USERNAME>.keytab
===>then, ctrl + D

(3) Then,

> kinit -k -t <USERNAME>.keytab <USERNAME>@CERN.CH



(4) copy following lines to ~/.bashrc (Don't forget to change "/path/to/USERNAME.keytab " to proper path to your keytab

ktmux(){
    if [[ -z "$1" ]]; then #if no argument passed
        k5reauth -f -i 3600 -p USERNAME -k /path/to/USERNAME.keytab -- tmux new-session
    else #pass the argument as the tmux session name
        k5reauth -f -i 3600 -p USERNAME -k /path/to/USERNAME.keytab -- tmux new-session -s $1
    fi
}

(5) Run permanent tmux session
> ktmux <session_name>
