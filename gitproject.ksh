
USER=`whoami`
export PROJECT_ROOT="/Users/${USER}/Development/Learning"
export PROJECT_NAME=$1

function usage() {

    echo -e 'Usage: source '$(basename $BASH_SOURCE) '<project_name>'
    echo -e 'script executes:'
    echo -e '\t 1. mkdir <project_name> in project folder => ' ${PROJECT_ROOT}
    echo -e '\t 2. git init <project_name>'
    echo -e '\t 3. create <project_name> in github'
    echo -e '\t 4. git push main'
    echo -e '\t 5. cd <project_name>'
}

function start_project() {
    clear
    cd $PROJECT_ROOT
    git init $PROJECT_NAME

    cd $PROJECT_NAME

    # Set up README.me as first commit
    echo -e "# "${PROJECT_NAME} > README.md
    git add README.md
    git commit -m "first commit - set up README.md"

    # create main branch
    git branch -M main

    # create PRIVATE repository on github, -p for private repository
    hub create -p $PROJECT_NAME

    # push the first commit to github
    # and show that the remote was created successfully
    git push --set-upstream origin main
    git remote -v
    git log -1
    echo -e "\n\nYou are on branch:"
    git branch
}

#



# git branch -M main
# git remote add origin https://github.com/jtam2000/learn_jdbc.git
# git push -u origin master


if [ $# -eq 0 ]; then
    usage
fi

if [ $# -eq 1 ]; then
    start_project $1;
fi