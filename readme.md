# TESL hotkeys

AutoHotkey script providing hotkeys / shortcuts for Bethesda's CCG [The Elder Scrolls: Legends][1]

It allows performing some common actions, attacking, playing creatures and ending the turn with a single hotkey.

## Usage

1. [Download][2] and run the compiled executable "TESL_hotkeys.exe" (if you trust me)

    __or__

2. * Clone the repository or download the file [TESL_hotkeys.ahk][5] ("save as...")
   * Install [AutoHotkey][3]
   * Run the .ahk file (double click on it / drag it onto the Autohotkey executable)

A message will pop up, that TESL Hotkeys is running.
The script lives in the taskbar and can be quit from there.

## adapt coordinates

The script itself is currently very rudimentary, it has only been tested with my screen resolution.

I have mapped the y key so it copies the x and y coordinates of the mouse position. These coordinates can be used to edit the script to fit your resolution. To do so find the corresponding button, hover over it with your mouse and paste the coordinates into the script.

##  Hotkeys

Key | Function
--- | ---
Enter | hit play button on deck selection
Shift Q | concede game  
Middle Mouse, Shift+Space | end turn    
Right Mouse, Spacebar  | attack face with what is under cursor  
Left Arrow Key | drop selected card in left lane  
Right Arrow Key | drop selected card in right lane  
b,n,m | mulligan left, middle, right  
Shift B or N or M | mulligan pick  
Shift X | toggle hotkeys on/off   

## Roadmap

- global variables for all coordinates to allow configuration to different resolutions
- a way to select cards in hand (moving through them with A and D for example)
- a way to select creatures on board (both own and enemy creatures)
- buttons to view own/opp deck and discard

## Contribute
If you have any remarks, improvements or have found bugs, please don't hesitate to issue a pull request or [open an issue][4].

[1]: https://legends.bethesda.net/
[2]: https://github.com/minotalen/TESL-hotkey/raw/master/TESL_hotkeys.exe
[3]: http://ahkscript.org/download/
[4]: https://github.com/minotalen/TESL-hotkey/issues/new
[5]: https://raw.githubusercontent.com/minotalen/TESL-hotkey/master/TESL_hotkeys.ahk
