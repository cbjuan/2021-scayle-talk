#/bin/sh

# Setup virtual environment
# example:
#     ./setup-local-env.sh "2021-scayle-env"

DIR=$1
echo "${DIR}"

get_arguments(){
    if [ -z "${DIR}" ]
    then
        echo "No arguments supplied. Please, enter the name of the env to create"
        exit 1
    fi
}

get_system () {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=Linux;;
        Darwin*)    machine=Mac;;
        CYGWIN*)    machine=Cygwin;;
        MINGW*)     machine=MinGw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
}

setup_environment () {
    if [ -d "$DIR" ]; then
        ## venv exists, update it
        echo "$DIR virtual environment already exists. Updating it..."
    else
        ## venv does not exist. Create it
        echo "$DIR virtual environment does not exist. Creating it..."
        python3 -m venv "$DIR"
    fi
    source "$DIR"/bin/activate
}

manage_dependencies () {
    # Update PIP
    pip install -U pip

    # Install/update dependencies according the system
    echo "Installing on a ${machine} machine."

    pip install -U -r requirements.txt
    pip install -U -r requirements-dev.txt
}


#
# ::main::
#

get_arguments
get_system
setup_environment
manage_dependencies
