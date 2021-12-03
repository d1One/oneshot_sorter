#!/bin/bash
clear # Clear the the cmd line from a bunch of text.
RESET="\033[0m"
BOLD="\033[1m"
YELLOW="\033[38;5;11m"
RED="\033[0;31m"
#
# Prompt for folder.
#
printf "${YELLOW}- SampleSorter v1.0 -\n\n"
printf "${YELLOW}${BOLD}Drag folder here:\n${RESET}"
read folder_path
cd "$folder_path" || {
  echo "Invalid directory"
  exit 127
}
clear
printf "${YELLOW}- SampleSorter v1.0 -\n\n${RED}${BOLD}"
pwd
#
# Confirm with user if we are at the correct folder, just in case.
#
printf "${YELLOW}${BOLD}Confirm the path above is correct (y/n):\n${RESET}"
read -p "" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  # Make a bunch of new folders for possible one shots
  mkdir _KICK
  mkdir _SNARE
  mkdir _HAT
  mkdir _CLAP
  mkdir _TOM
  mkdir _CRASH
  mkdir _CYMB_RIDE
  mkdir _PERC
  mkdir _VOX
  mkdir _FX
  # ---------------------- Search and Move ----------------------
  # -------------------------------------------------------------
  # kick bd bassdrum kick (BD watch for false positives)
  find . ! \( -path ./_KICK -prune \) -type f \( -iname "*kick*.wav" -o -iname "*bd*.wav" -o -iname "*bassdrum*.wav" -o -iname "*kik*.wav" \) -exec mv -i {} _KICK \;
  # snare sd snr rim (add SN? Can give lots of false positives)
  find . ! \( -path ./_SNARE -prune \) -type f \( -iname "*snare*.wav" -o -iname "*sd*.wav" -o -iname "*bassdrum*.wav" -o -iname "*snr*.wav" -o -iname "*rim*.wav" -o -iname "*side*.wav" -o -iname "*stick*.wav" \) -exec mv -i {} _SNARE \;
  # hat open closed HH (HH can be problematic)
  find . ! \( -path ./_HAT -prune \) -type f \( -iname "*hat*.wav" -o -iname "*open*.wav" -o -iname "*close*.wav" -o -name "*HH*.wav" \) -exec mv -i {} _HAT \;
  # clp clap hand snap (hand might move other hand percs into the clap folder)
  find . ! \( -path ./_CLAP -prune \) -type f \( -iname "*clp*.wav" -o -iname "*clap*.wav" -o -iname "*hand*.wav" -o -iname "*snap*.wav" \) -exec mv -i {} _CLAP \;
  # tom floor timb (will catch Timbaland named samples!)
  find . ! \( -path ./_TOM -prune \) -type f \( -iname "*tom*.wav" -o -iname "*floor*.wav" -o -iname "*tim*.wav" \) -exec mv -i {} _TOM \;
  # crash crsh china splash splsh
  find . ! \( -path ./_CRASH -prune \) -type f \( -iname "*crash*.wav" -o -iname "*crsh*.wav" -o -iname "*china*.wav" -o -iname "*splash*.wav" -o -iname "*splsh*.wav" \) -exec mv -i {} _CRASH \;
  # cymb ride bell (add cym?)
  find . ! \( -path ./_CYMB_RIDE -prune \) -type f \( -iname "*cymb*.wav" -o -iname "*ride*.wav" -o -iname "*bell*.wav" \) -exec mv -i {} _CYMB_RIDE \;
  # bell tri clav shaker tamb perc cabasa conga cow maraca surdo agogo bongo
  # percs are still missing some keywords as theres huge amounts of possibilities.
  find . ! \( -path ./_PERC -prune \) -type f \( -iname "*bell*.wav" -o -iname "*tri*.wav" -o -iname "*clav*.wav" -o -iname "*shak*.wav" -o -name "*tamb*" -o -iname "*perc*.wav" -o -iname "*cabasa*.wav" -o -iname "*conga*.wav" -o -iname "*cow*.wav" -o -iname "*maraca*.wav" -o -iname "*surdo*.wav" -o -iname "*agogo*.wav" -o -iname "*bongo*.wav" \) -exec mv -i {} _PERC \;
  # vox vocal chant
  find . ! \( -path ./_VOX -prune \) -type f \( -iname "*vox*.wav" -o -iname "*vocal*.wav" -o -iname "*chant*.wav" \) -exec mv -i {} _VOX \;
  # efx sfx fx impact riser (fx might give a lot of false results)
  find . ! \( -path ./_FX -prune \) -type f \( -iname "*efx*.wav" -o -iname "*sfx*.wav" -o -iname "*fx*.wav" -o -iname "*impact*.wav" -o -iname "*riser*.wav" \) -exec mv -i {} _FX \;
  # ------------------------------------------------------------------------
  # ------------- Ask if user wants move 808 named files -------------------
  # skip if you have several types of 808 one shots and not just bass/kicks!
  # ------------------------------------------------------------------------
  printf "${YELLOW}${BOLD}Also move 808 files? (y/n):\n${RESET}"
  read -p "" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir _808
    find . ! \( -path ./_808 -prune \) -type f \( -iname "*808*.wav" \) -exec mv -i {} _808 \;
  fi
  # -------------------------------------------------------------
  # ------------------ delete any empty folders -----------------
  sleep 0.5
  find . -type d -empty -delete
else
  printf "${YELLOW}${BOLD}Sorting canceled. Program closing now.\n${RESET}"
  exit
fi
