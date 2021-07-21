function run() {
	local DIR=$1
	local VERSION=$2
	local ACTION=$3

	source $(dirname $BASH_SOURCE)/$ACTION.$VERSION.bash $DIR
}

run $1 $2 $3
