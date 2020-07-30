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
alias myip='ipconfig getifaddr en0"
#
# git prompts
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

# should not need to do this for PYTHON, do this only for temporary basis
#export PYTHONPATH=./:../:src:test:../src:../test:$PYTHONLOCALPACKAGE:/Users/jason/Library/Python/3.7/bin:$PYTHONPATH
export PATH=./:../:$PYTHONLOCALPACKAGE:$PATH


#
# Kafka
#
export PATH=/usr/local/kafka_2.12-2.4.0/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home


#
# Java
#
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

# default to Java 11
java11


#
# Path
#
export PATH=$PATH:/usr/libexec
