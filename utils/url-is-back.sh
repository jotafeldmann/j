# . url-is-back.sh google.com
# . url-is-back.sh google.com 1m

URL=$1
DELAY=${2:-"1m"}

while true; \
do clear; \
	echo URL IS BACK?; \
	echo "Last update $(date)"; \
	echo $(curl -s -o /dev/null -LI -w "%{http_code}" $URL) | \
	grep 000 && sleep $DELAY || \
	{ notify-send -u critical "URL is back $(date)"; echo URL is back $(date); break; } \
done