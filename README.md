# SampleSorter v1.0

A Bash Script to organize Audio One-Shot Samples into subfolders based on file-name.

Scenario: 
Tons of packs with ones-shots mixed together but mostly the file names are descriptive, something like bla_bla_Kick014.wav or bla_HAT234.wav.

##How the script works:
1 - Makes a bunch of subfolders for the most common one-shots (Kick, Snare, Hats, Clap, etc..)
2 - Searches in the subfolder and all other folders inside it for matching filenames, for Kicks for example it searches for Kick, BassDrum, BD or KIK, whatever text comes before or after the match string is ignored.
3 - Moves found files to their respective new subfolder.
4 - Leaves anything that does not match in place.
5 - Deletes all empty folders. 

##Notes:
- The folders the script creates start with an underscore, this is in case we already have sub-folders with names such as "Kick" or "Snare".
- It asks if we also want to move any "808" matches, this is mostly for 808 Kick/Bass but if my folder also has claps, snares, etc with the word 808 in the name it might cause issues, this is why it's optional.

##How to run it: (For MacOS only for now, haven't tested Windows yet)

1 - Download the SampleSort.command script, open the Terminal and type chmod u+x and drag and drop the script in the terminal (this makes the script executable).
/help/Make_executable.gif

2 - For the first run right-click the script and select "Open", MacOS will tell you it cannot very the Developer, thats OK becase I am not a developer ;). After the first run you're able to just double click the excript to launch it.

3 - Drag and drop the folder you want to sort into the script when asked.

4 - The script will tell yout the full path of the folder, confirm it is correct. Pay attention to this step, you really dont want the script to run in the root folder of your drive and move all *Kick* files it might find... that would be bad. If it looks good type "Y"

5 - The script will ask if you also want to move any files with 808 in their name to a the sub folder, as previously explained if this is usefull or not depends on your samples, if unsure type "N" for no.

6 - Done
