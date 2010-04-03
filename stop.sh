PID=`ps -ef | grep "ruby extractor.rb" | grep -v "grep" | awk '{print $2}'`
echo Terminating process $PID
kill -9 $PID
