# bash check-url.sh http://localhost:8000 200
# bash check-url.sh http://localhost:8000 500 NOTIFY_CHANGE
# bash check-url.sh http://localhost:8000 500 CONTINUOUS ONCE
# bash check-url.sh http://localhost:8000 500 NOTIFY_CHANGE ONCE
# bash check-url.sh http://localhost:8000 500 ECHO REPEAT 1m
# bash check-url.sh http://localhost:8000 500 NOTIFY_CHANGE REPEAT_UNTIL_CHANGE 1m

URL=$1
HTTP_EXPECTED_STATUS=${2:-"000"}
NOTIFY_MODE=${3:-"NOTIFY_CHANGE"}
MODE=${4:-"REPEAT_UNTIL_CHANGE"}
DELAY=${5:-"10m"}
KEEP_RUNNING="TRUE"
HTTP_LAST_STATUS=""
STARTED=$(date)

check_mode(){
	ACTUAL_MODE=$1
	
	if [ "$MODE" == "REPEAT_UNTIL_CHANGE"  ] && [ "$ACTUAL_MODE" == "CHANGE" ]; then
		KEEP_RUNNING="FALSE"
	elif [[ "$MODE" != *"REPEAT"* ]]; then
		KEEP_RUNNING="FALSE"
	else
		echo Next update: $DELAY && \
		sleep $DELAY
	fi
}

check_notify_mode(){
	TITLE=${1:-""}
	MSG=$2
	
	if [ "$NOTIFY_MODE" == "NOTIFY_CHANGE" ]; then
		notify-send -u critical "$TITLE" "$MSG"
	fi
}

msg_template(){
	MSG_CHANGED="url: $URL \n\
expected status: $HTTP_EXPECTED_STATUS\n\
last status: $HTTP_LAST_STATUS\n\
started: $STARTED\n\
last update: $(date)\n\
mode: $MODE\n\
notify: $NOTIFY_MODE\n\
"; \
	echo -e "$MSG_CHANGED"; \
}

title(){
	TITLE=$1
	echo "$TITLE"
}


while [ "$KEEP_RUNNING" == "TRUE" ]; do \
	if [ "$NOTIFY_MODE" != "CONTINUOUS" ]; then
		clear;
	fi;
	HTTP_LAST_STATUS=$(curl -s -o /dev/null -LI -w "%{http_code}" $URL); \
	if [ "$HTTP_LAST_STATUS" == "$HTTP_EXPECTED_STATUS" ]; then
		title "Check: expected"
		msg_template
		check_mode
	else 
		TITLE_CHANGED="Check: changed"
		title "$TITLE_CHANGED"
		msg_template
		check_notify_mode "$TITLE_CHANGED" "$MSG_CHANGED"
		check_mode "CHANGE"
	fi
done