# . check-status.sh urls_list.txt 60
URLS_FILE=$1
DELAY=${2:-"10m"}
STARTED=$(date)

error() {
	MSG=$1
	#notify-send -u low $MSG
	. color-echo.sh "RED" "$MSG"
}

success() {
	MSG=$1
	echo $MSG | grep 200
}

check_status() {
	URL=$1
	EXPECTED_STATUS=$2
	
	RESULT=$(. check-url.sh $URL $EXPECTED_STATUS CONTINUOUS ONCE | grep status)
	LAST_STATUS=$(echo "$RESULT" | grep "last status:" | cut -d' ' -f3 )
	MSG="[$URL] Expected: $EXPECTED_STATUS | Last: $LAST_STATUS"
	
	if [ "$EXPECTED_STATUS" != "$LAST_STATUS" ]; then
		. color-echo.sh "RED" "$MSG"
	else
		echo $MSG
	fi
}

while true;
do clear;

echo CHECK URL STATUS
echo Started: $STARTED
echo Last update: $(date)
echo ---

cat $URLS_FILE | while read LINE || [[ -n $LINE ]];
do \
    URL=$(echo "$LINE" | cut -d' ' -f1)
    EXPECTED_STATUS=$(echo "$LINE" | cut -d' ' -f2)
    check_status $URL $EXPECTED_STATUS
done

echo ---
echo Next update: $DELAY

sleep $DELAY
done