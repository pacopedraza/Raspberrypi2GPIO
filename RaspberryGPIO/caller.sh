f [ “${user}” = “root”]; then
COUNTER=0
./gpio write $1 0
./gpio write $2 0
while [ $COUNTER -lt 10];do
#Execute GPIO code.
./gpio mode $1 out
./gpio write $1 1
sleep 5
./gpio write $1 0
./gpio mode $2 out
./gpio write $2 1
sleep 5
./gpio write $2 0
let COUNTER=COUNTER+1
done
fi
exit 0
