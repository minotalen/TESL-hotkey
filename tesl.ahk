#SingleInstance force ; Replace an existing script

+x::
Suspend
return

Enter:: ;play again
Click 1124, 960
return

mbutton:: ; End turn
MouseGetPos, StartX, StartY
Click 1592, 932
MouseMove, StartX, StartY
return

rbutton:: ;attack face
MouseGetPos, StartX, StartY
Click down
Sleep, 10
MouseClickDrag, Left, %StartX%, %StartY%, 967, 155, 10
MouseMove, StartX, StartY
return

; starting selection
b:: ; Starting selection card 1
MouseGetPos, StartX, StartY
Click 647, 401
MouseMove, StartX, StartY
return
n:: ; Starting selection card 2
MouseGetPos, StartX, StartY
Click 962, 458
MouseMove, StartX, StartY
return
m:: ; Starting selection card 3
MouseGetPos, StartX, StartY
Click 1253, 456
MouseMove, StartX, StartY
return
+n:: ; finish selection
Click 1021, 914
return

+q:: ; concede game
Click 1867, 23
Sleep, 200
Click 997, 387
Sleep, 1700
Click 1122, 806i



Left:: ; drop in left lane
MouseGetPos, StartX, StartY
Click down
Sleep, 10
MouseClickDrag, Left, %StartX%, %StartY%, 478, 584, 10 
MouseMove, StartX, StartY
return

Right:: ; drop in right lane
MouseGetPos, StartX, StartY
Click down
Sleep, 10
MouseClickDrag, Left, %StartX%, %StartY%, 1397, 589, 10
MouseMove, StartX, StartY
return

y::
MouseGetPos, StartX, StartY
clipboard = Click %StartX%, %StartY%
return
