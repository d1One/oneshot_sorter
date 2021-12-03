# SampleSorter v1.0

A Bash Script to organize Audio One-Shot Samples into subfolders based on file-name, or merge several sample packs into one.

Scenario: 
You have tons of ones-shot samples mixed together but the file names are somewhat descriptive, something like bla_bla_Kick014.wav or bla_HAT234.wav.

## How the script works:
1. Makes a bunch of subfolders for the most common one-shots (Kick, Snare, Hats, Clap, etc..)

2. Searches in the folder and recursively in all other sub-folders inside it for matching filenames, for Kicks for example it searches for Kick, BassDrum, BD or KIK, whatever text comes before or after the match string is ignored.

3. Moves found files to their respective new subfolder.

4. Leaves anything that does not match in place.

5. Deletes all empty folders (including the ones created in step-1 if no matches are found)

# Simple example:
![This is an image](/help/SampleSort_example.gif)



## Notes:
- The folders the script creates start with an underscore, this is in case we already have sub-folders with typical names such as "Kick" or "Snare".
- It asks if we also want to move any "808" matches, this is mostly for 808 Kick/Bass but if your main folder also has claps, snares, etc with the word 808 in the file-name it might cause issues, this is why it's optional, most modern kit's only have kicks and bass with 808 in the name, older kits not really, it depends.



## How to use it: (For MacOS only for now, haven't tested Windows yet)

1. Download the SampleSort.command script, open the Terminal and type `chmod u+x ` (including a space) then drag and drop the script into the terminal (this makes the script executable).

![This is an image](/help/Make_executable.gif)

2. For the first run right-click the script and select "Open", MacOS will tell you it cannot veryfy the Developer, thats OK becase I am not a developer 😜. After the first run you're able to just double click the excript to launch it.

3. Drag and drop the folder you want to sort into the script when asked.

4. The script will tell yout the full path of the folder, **confirm it is indeed correct**. ⚠ Pay attention to this step, you really dont to accidentally run the script in the root folder of your drive and move all *Kick* named files... that could be a disaster:heavy_exclamation_mark:⚠ If it looks good type "y" for yes. ---- I advise copying a few samples to a temporary folder and testing it out first.

5. The script will also ask if you also want to move any files with 808 in their name to a the sub folder, as previously explained if this is usefull or not depends on your samples, if unsure type "n" for no.

6. Done

.
.
.

Extra Notes:

If having underscores before the sub folder names bothers you remmeber it's super fast and easy to batch rename in MacOS, as such:

![This is an image](/help/Rename_folders.gif)
