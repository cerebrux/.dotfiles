alias dotfile="git --git-dir=/home/$USER/.dotfiles --work-tree=/home/$USER"

source "/home/$USER/.slimzsh/slim.zsh"


#grep's -c option returns a count of matching lines, which will be 0 in case MuQSS is not printed by dmesg. In turn, test's -z option tests whether the length of the string is zero, so this will always print "MuQSS", since '0' is a non-zero-length string.
#instead of test -z $(dmesg | grep -ic muqss) && echo CFS || echo MuQSS use:
# test $(dmesg | grep -ic muqss) -eq 0 && echo CFS || echo MuQSS or:
alias MyCPUscheduler="test -z $(dmesg | grep -i muqss) && echo CFS || echo MuQSS"
alias MyDiskscheduler="cat /sys/block/sd*/queue/scheduler"
