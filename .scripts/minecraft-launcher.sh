#!/bin/bash


BIG_BOI="/mnt/Big_boi/Games/Cracked/Minecraft"

if [ -d "$BIG_BOI" ]; then
  echo "File '$BIG_BOI' exists."
  BIG_BOI_argument=(1 "Big BOi" off 2 "  Crack" on 3 "  Original" off)
else
  echo "File '$BIG_BOI' does not exist."
fi

COMMON_GROUND="/mnt/Common_ground/Games/Craked/Minecraft"

if [ -d "$COMMON_GROUND" ]; then
  echo "File '$COMMON_GROUND' exists."
  COMMON_GROUND_argument=(4 "Common Ground" off 5 "    Crack" on 6 "    Original" off)
else
  echo "File '$COMMON_GROUND' does not exist."
fi

response=$(kdialog --title 'Select Your Minecraft Launcher Location' --geometry 240x180 --radiolist 'Select a Mincraft start location:' "${BIG_BOI_argument[@]}" "${COMMON_GROUND_argument[@]}")
echo "the response is $response"

case "$response" in
    "2")
        cd $BIG_BOI && ./scrack.sh
        ;;
    "3")
        cd $BIG_BOI && ./soriginal.sh
        ;;
    "5")
        cd $COMMON_GROUND && ./scrack.sh
        ;;
    "6")
        cd $COMMON_GROUND && ./soriginal.sh
        ;;
esac
