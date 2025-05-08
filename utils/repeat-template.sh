# sh repeat-template.sh date 10m

COMMAND=$1
DELAY=${2:-"1m"}
STARTED=$(date)

while true;
do clear;
	echo [$COMMAND];
    echo "Started: $STARTED";
	echo "Last update: $(date)";
    echo "Next update: $DELAY";
	$COMMAND;
    sleep $DELAY;
done