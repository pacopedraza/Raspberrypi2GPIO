aser for Raspberry Pi

GPIO_PINS='0 1 4 7 8 9 10 11 14 15 17 18 21 22 23 24 25'
# Uncomment the following line for Raspberry Pi Revision 2
#GPIO_PINS='2 3 4 7 8 9 10 11 14 15 17 18 22 23 24 25 27'
pins=17
delay=0.025

# Include gpio script to access the gpio function directly
source ./gpio

# Initialize pins
for ((pin = 0; pin < pins; pin++)); do
    gpio mode $pin out
done

pin=1
step=1

# Loop until CTRL-C is pressed
while true; do
    gpio write $pin 1
    sleep $delay
    gpio write $pin 0
    if ((pin == 0 || pin == pins - 1)); then
        step=$((-step))
    fi
    pin=$((pin + step))
done

