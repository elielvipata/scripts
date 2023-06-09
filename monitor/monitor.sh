#!/bin/bash

count=0

function check_arguments {

	if [ "$1" -lt 2 ]; then
		echo "Usage: "
		echo "$0 <time interval in secs> <percentage threshold>"
		exit
	fi

	MEMORY_THRESHOLD=$3
	TIME_INTERVAL=$1
}

function init
{
	#Remove reports directory
	rm -fr ./memory_reports
	mkdir ./memory_reports

	REPORTS_DIR=./memory_reports

	MAXIMUM_REPORTS=10
}


function generate_report {

	
	#delete oldest report to save memory if the max reports is hit
	if [ $count -eq $MAXIMUM_REPORTS ]; then
		file=`ls -t ./memory_reports/| tail -1`
		rm ./memory_reports/$file
		let count=count-1
	fi

	file_name="$(date +'%d.%m.%Y.%H.%M.%S')"

	#increment count
	let count=count+1

	echo "MEMORY THRESHOLD OF $MEMORY_THRESHOLD% EXCEEDED! CURRENT USAGE ON SERVER: $1%, DATE AND TIME: $file_name" >> ./memory_reports/$file_name
}

function fetch_memory_usage
{
		mem_usage=`sar -r 1 1 > file && head -n 4 file | tail -n 1 | awk '{print $6}'`
		echo $mem_usage
}

function notify
{

	#Check if the process has exceeded the thresholds
	#Check if process exceeded its CPU or MEM thresholds. If that is the case, send an email to $USER containing the last report
	if [ $1 -gt $MEMORY_THRESHOLD ]; then
		file=`ls -t ./memory_reports | head -1`
		export TWILIO_ACCOUNT_SID=AC9a9485c75cf776d4ce1f2138cafda0a4
		export TWILIO_AUTH_TOKEN=b6c6c27bac835b1e0b427850d35c52af
		$contents = cat < $file

		curl -X POST "https://api.twilio.com/2010-04-01/Accounts/$TWILIO_ACCOUNT_SID/Messages.json" \
		--data-urlencode "Body=$contents" \
		--data-urlencode "From=+18335791623" \
		--data-urlencode "To=$2" \
		-u $TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN
	fi
}


check_arguments $# $@

init

echo "MEMORY THRESHOLD: $MEMORY_THRESHOLD"
echo "INTERVAL: $TIME_INTERVAL"


count=0
duration=1800
#Run forever
while true;
do
	mem_usage=$(fetch_memory_usage)
	
	generate_report $mem_usage

	vipata="+17654254610"
	kegan="+13863837300"

	
	if [ $count -eq 0 ]; then
		notify $mem_usage $vipata
		$count=1
	fi

	if [ $count -eq 1 ]; then
		while [ $duration -gt 0 ]
		do
    		# Display the remaining time

		    # Sleep for 1 second
		    sleep 1

			# Decrease the duration by 1
			duration=$((duration-1))
		done
		
		$count=0
	fi
	$duration=1800
done


done


