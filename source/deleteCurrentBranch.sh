# Deletes the current Git branch and checks out master

# Arguments:
# None

# Obviously, this won't work if the working directory isn't a git repo

BRANCH="$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)"

if [ "$BRANCH" == "master" ]
then
	echo "Cannot delete master branch"
	exit 1
fi

echo "Deleting branch '${BRANCH}'"
git checkout master && git branch -D "${BRANCH}"
