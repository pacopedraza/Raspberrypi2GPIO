nary LED counter for Raspberry Pi 

GPIO_PINS='0 1 4 7 8 9 10 11 14 15 17 18 21 22 23 24 25' 
# Uncomment the following line for Raspberry Pi Revision 2 
# GPIO_PINS='2 3 4 7 8 9 10 11 14 15 17 18 22 23 24 25 27' 
pins=17 
delay=1 

# Include gpio script to access the gpio function directly 
source ./gpio 

# Initialize pins 
for ((pin = 0; pin < pins; pin++)); do 
    gpio mode $pin out 
    gpio write $pin 0 
done 

# Loop until CTRL-C is pressed 
while true; do 
    for ((value = 0; value < 2 ** pins; value++)); do 
        remainder=$value 
        for((pin = pins - 1; pin >= 0; pin--)); do 
            power=$((2 ** pin)) 
            digit=$((remainder / power)) 
            remainder=$((remainder % power)) 
            gpio write $pin $digit 
        done 
        sleep $delay 
    done 
done
