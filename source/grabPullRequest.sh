# Checks out a pull request from GitHub to a local branch

# Arguments:
# 1. ID number of the pull request
# 2. Name of the local branch to create

# This will fail if a local branch already exists with the given
# name, or if there is no pull request with the given ID

echo "Checking out pull request #$1 into local branch '$2'"
git fetch origin pull/$1/head:$2 && git checkout $2
