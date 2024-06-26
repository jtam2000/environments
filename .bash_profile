# GIT 
source ~/.git-completion.bash
source ~/.git-prompt.sh


#
# alises
#
LEARNING_PATH=~/Development/Learning
LEARNING="$LEARNING_PATH"
alias learning='cd $LEARNING_PATH'
alias ne='emacs -nw'
alias la='ls -a'
alias py='python3'
alias ipy='ipython'
alias pip='pip3'
alias jupy='jupyter-notebook'
alias jupyter='jupyter-notebook'
alias jpy='jupyter-notebook'
alias myip='ipconfig getifaddr en0; ipconfig getifaddr ne1'

#
# git
#
DEFAULT="\[\033[0;00m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
CYAN="\[\033[0;36m\]"
PS1=$GREEN"[\@]/\W"$YELLOW'$(__git_ps1 "(%s)")'"=>"$DEFAULT
alias gitproject='source  ~/Development/environments/gitproject.ksh'

#
# Python
#
#export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

#export PYTHONLOCALPACKAGE=/Library/Frameworks/Python.framework/Versions/3.7/bin
export PYTHONLOCALPACKAGE=/usr/local/bin
#source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh
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
# Hadoop
#
export HADOOP_INSTALL=/usr/local/Cellar/hadoop/3.3.0
export PATH=$HADOOP_INSTALL/sbin:$PATH

#
# Hadoop
#
export HADOOP_HOME=/usr/local/Cellar/hadoop/3.3.0/libexec

#
# pyspark
#
export SPARK_HOME=/usr/local/Cellar/apache-spark/3.0.1/libexec
export PYSPARK_PYTHON=python3
export SPARK_LOCAL_IP=localhost
export PATH=$SPARK_HOME/sbin:$SPARK_HOME/bin:$PATH
export PYSPARK_SUBMIT_ARGS="pyspark-shell"
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook' pyspark

#
# Java
# install new version by >brew install openjdk@17
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'

# default to Java 11
java11

#
# Path
#
export PATH=~/bin:$PATH:/usr/libexec

# silence message to change bash to zsh
export BASH_SILENCE_DEPRECATION_WARNING=1