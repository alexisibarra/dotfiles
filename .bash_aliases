alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown'

alias histg="history | grep"

alias apalog='tail /var/log/apache2/error.log'

alias hcommon=history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print
CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t |
sort -nr | nl |  head -n10

# ls better
alias la="ls -aF"
alias ld="ls -ld"
alias ll="ls -l"
alias lt='ls -At1 && echo "------Oldest--"'
alias ltr='ls -Art1 && echo "------Newest--"'

