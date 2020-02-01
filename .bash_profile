
# GIT 
source ~/.git-completion.bash
source ~/.git-prompt.sh


#
# alises
#
alias learning='cd ~/Development/Learning'
alias ne='emacs -nw'
alias la='ls -a'
alias py='python3'
alias ipy='ipython'
alias pip='pip3'
alias jupy='jupyter-notebook'
alias jupyter='jupyter-notebook'
alias jpy='jupyter-notebook'
#
# prompts
#
DEFAULT="\[\033[0;00m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
CYAN="\[\033[0;36m\]"
PS1=$GREEN"[\@]/\W"$YELLOW'$(__git_ps1 "(%s)")'"=>"$DEFAULT

#
# Python
#
export PYTHONLOCALPACKAGE=/usr/local/lib/python3.7/site-packages
export PYTHONPATH=./:../:src:test:../src:../test:$PYTHONLOCALPACKAGE:/Users/jason/Library/Python/3.7/bin:$PYTHONPATH
export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH

#
# Kafka
#
export PATH=/usr/local/kafka_2.12-2.4.0/bin:$PATH
