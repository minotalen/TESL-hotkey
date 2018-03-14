# TESL hotkeys

AutoHotkey script providing hotkeys / shortcuts for Bethesda's CCG [The Elder Scrolls: Legends][1]

It allows performing some common actions, attacking, playing creatures and ending the turn with a single hotkey.

## Usage

1. [Download][2] and run the compiled executable "TESL_hotkeys.exe" (if you trust me)

    __or__

2. * Clone the repository or download the file [TESL_hotkeys.ahk][3] ("save as...")
   * Install [AutoHotkey][4]
   * Run the .ahk file (double click on it / drag it onto the Autohotkey executable)

A message will pop up, that TESL Hotkeys is running.
The script lives in the taskbar and can be quit from there.

##  Hotkeys

Key | Function
--- | ---
Middle Mouse, Spacebar | end turn  
Right Mouse Button | attack face with what is under cursor    
Enter | hit play button on deck selection  
Left Arrow Key | drop selected card in left lane
Right Arrow Key | drop selected card in right lane  
i,o | scroll through opponent lane (saves position)
k,l | scroll through own lane (saves position)
p | attack from own lane to opp lane (select with i,o,k,l)
r, PgDn | activate the magicka ring
b,n,m | mulligan left, middle, right  
Shift B, N, M | mulligan finish
Shift Q | concede game  
d, Shift D (PgUp, Shift PgUp) | view own/opponent deck (remaining cards)
Shift X | toggle hotkeys on/off   

## If it doesnt work, adapt your coordinates!

The script itself is currently very rudimentary, it has only been tested with my screen resolution. It might be that you have to adapt the coordinates to your resolution.

I have mapped the y key so it copies the x and y coordinates of the mouse position. These coordinates can be used to edit the script to fit your resolution.

You could also contribute to this script by [adding absolute coordinate support][5]

## Roadmap

- global variables for all coordinates to allow configuration to different resolutions
- select cards in hand (moving through them with A and D for example)
- select creatures on board (both own and enemy creatures)
- attack selected enemy creature with selected own creature
- buttons to view own/opp deck and discard pile
- attack all key for each lane

## Contribute
If you have any remarks, improvements or have found bugs, please don't hesitate to issue a pull request or [open an issue][6].

[1]: https://legends.bethesda.net/
[2]: https://github.com/minotalen/TESL-hotkey/raw/master/TESL_hotkeys.exe
[3]: https://raw.githubusercontent.com/minotalen/TESL-hotkey/master/TESL_hotkeys.ahk
[4]: http://ahkscript.org/download/
[5]: https://github.com/minotalen/TESL-hotkey/issues/2
[6]: https://github.com/minotalen/TESL-hotkey/issues/new
