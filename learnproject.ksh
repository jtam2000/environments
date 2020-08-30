
USER=`whoami`
export PROJECT_ROOT="/Users/${USER}/Development/Learning"
export PROJECT_NAME=$1

function usage() {

    echo -e 'Usage: source '$(basename $BASH_SOURCE) '<project_name>'
    echo -e 'script executes:'
    echo -e '\t 1. mkdir <project_name> in project folder => ' ${PROJECT_ROOT}
    echo -e '\t 2. git init <project_name>'
    echo -e '\t 3. create <project_name> in github'
    echo -e '\t 4. cd <project_name>'
}

function start_project() {

    cd $PROJECT_ROOT
    git init $PROJECT_NAME

    cd $PROJECT_NAME
    # -p for private repository
    hub create -p $PROJECT_NAME
    # show that the remote was created successfully
    git remote -v
}

if [ $# -eq 0 ]; then
    usage
fi

if [ $# -eq 1 ]; then
    start_project $1;
fi