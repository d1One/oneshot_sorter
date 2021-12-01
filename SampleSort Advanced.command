#!/bin/bash
clear
cd "$(dirname "$0")"
# --- Ask if user wants to create sub-folders ---
read -p "Make folders? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
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
fi
# ---------------------- Search and Move ----------------------
# -------------------------------------------------------------
# kick bd bassdrum kick
find . ! \( -path ./_KICK -prune \) -type f \( -iname "*kick*" -o -iname "*bd*" -o -iname "*bassdrum*" -o -iname "*kik*" \) -exec mv -i {} _KICK \;
# snare sd snr rim (add SN? Can give lots of false positives)
find . ! \( -path ./_SNARE -prune \) -type f \( -iname "*snare*" -o -iname "*sd*" -o -iname "*bassdrum*" -o -iname "*snr*" -o -iname "*rim*" -o -iname "*side*" -o -iname "*stick*" \) -exec mv -i {} _SNARE \;
# hat open closed HH (HH can be problematic)
find . ! \( -path ./_HAT -prune \) -type f \( -iname "*hat*" -o -iname "*open*" -o -iname "*close*" -o -name "*HH*" \) -exec mv -i {} _HAT \;
# clp clap hand snap (hand might move other hand percs into the clap folder)
find . ! \( -path ./_CLAP -prune \) -type f \( -iname "*clp*" -o -iname "*clap*" -o -iname "*hand*" -o -iname "*snap*" \) -exec mv -i {} _CLAP \;
# tom floor timb (will catch Timbaland named samples!)
find . ! \( -path ./_TOM -prune \) -type f \( -iname "*tom*" -o -iname "*floor*" -o -iname "*tim*" \) -exec mv -i {} _TOM \;
# crash crsh china splash splsh
find . ! \( -path ./_CRASH -prune \) -type f \( -iname "*crash*" -o -iname "*crsh*" -o -iname "*china*" -o -iname "*splash*" -o -iname "*splsh*" \) -exec mv -i {} _CRASH \;
# cymb ride bell (add cym?)
find . ! \( -path ./_CYMB_RIDE -prune \) -type f \( -iname "*cymb*" -o -iname "*ride*" -o -iname "*bell*" \) -exec mv -i {} _CYMB_RIDE \;
# bell tri clav shaker tamb perc cabasa conga cow maraca surdo - agogo
find . ! \( -path ./_PERC -prune \) -type f \( -iname "*bell*" -o -iname "*tri*" -o -iname "*clav*" -o -iname "*shak*" -o -name "*tamb*" -o -iname "*perc*" -o -iname "*cabasa*" -o -iname "*conga*" -o -iname "*cow*" -o -iname "*maraca*" -o -iname "*surdo*" -o -iname "*agogo*" \) -exec mv -i {} _PERC \;
# vox vocal chant
find . ! \( -path ./_VOX -prune \) -type f \( -iname "*vox*" -o -iname "*vocal*" -o -iname "*chant*" \) -exec mv -i {} _VOX \;
# efx sfx fx impact riser (fx might give a lot of false results)
find . ! \( -path ./_FX -prune \) -type f \( -iname "*efx*" -o -iname "*sfx*" -o -iname "*fx*" -o -iname "*impact*" -o -iname "*riser*"\) -exec mv -i {} _FX \;
# ------------------------------------------------------------------------
# ------------- Ask if user wants move 808 named files -------------------
# skip if you have several types of 808 one shots and not just bass/kicks!
# ------------------------------------------------------------------------
read -p "Move files with 808 in the name to _808? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
 mkdir _808
find . ! \( -path ./_808 -prune \) -type f \( -iname "*808*" -o \) -exec mv -i {} _808 \;
fi
# -------------------------------------------------------------
# ------------------ delete any empty folders -----------------
find . -empty -type d -delete
