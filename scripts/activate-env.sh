#/bin/sh

# Activate virtual environment
# example:
#     ./activate-env.sh "2021-scayle-env"
#
# If virtual environment does not exist, the project will use
# the default 2021-scayle-env

DIR=$1
if [ -d "$DIR" ]; then
    ## venv exists, using it
    source "$DIR"/bin/activate
else
    ## venv not specified. Using the default
    echo "virtual environment not specified. Using the default 2021-scayle-env..."
    source 2021-scayle-env/bin/activate
fi
