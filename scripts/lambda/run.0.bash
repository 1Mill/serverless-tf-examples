function run() {
	local DIR=$1
	local VERSION=$2
	local ACTION=$3
	local PAYLOAD="$4"

	source $(dirname $BASH_SOURCE)/$ACTION.$VERSION.bash $DIR "$PAYLOAD"
}

run $1 $2 $3 "$4"
