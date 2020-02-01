
# GIT 
source ~/.git-completion.bash
source ~/.git-prompt.sh


#
# alises
#
LEARNING_PATH=~/Development/Learning
alias learning='cd $LEARNING_PATH'
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
export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
export PYTHONLOCALPACKAGE=/Library/Frameworks/Python.framework/Versions/3.7/bin
source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
export PROJECT_HOME=$LEARNING_PATH

#export PYTHONPATH=./:../:src:test:../src:../test:$PYTHONLOCALPACKAGE:/Users/jason/Library/Python/3.7/bin:$PYTHONPATH
#export PATH=$PYTHONLOCALPACKAGE:$PATH


#
# Kafka
#
export PATH=/usr/local/kafka_2.12-2.4.0/bin:$PATH
