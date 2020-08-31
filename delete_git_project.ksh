USER=`whoami`
export PROJECT_ROOT="/Users/${USER}/Development/Learning"

hub delete $1
cd $PROJECT_ROOT && rm -rf $1