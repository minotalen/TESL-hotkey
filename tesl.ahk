#SingleInstance force ; Replace an existing script
dragSpeed = 6

#IfWinActive The Elder Scrolls: Legends ahk_class UnityWndClass ; only active inside TESL window

;toggle hotkeys on/off
+x:: ; shift + X
Suspend
return

; End turn
mbutton:: ; Middle mouse button
endturn()
return

;attack face
rbutton:: ; Right mouse button
Space:: ; Spacebar
face()
return

; mulligan selection
b:: ; mulligan selection card 1
mulligan(1)
return
n:: ; mulligan selection card 2
mulligan(2)
return
m:: ; mulligan selection card 3
mulligan(3)
return
+n:: ; finish selection
+b:: ; shift+b or shift+n or shift+m
+m::
mulligan(0)
return

Left:: ; drop in left lane
drop(1)
return

Right:: ; drop in right lane
drop(2)
return

;play again
Enter:: ; Enter Key
Click 1124, 960
return

+q:: ; concede game
concede()
return

y:: ; helper function to get mouse coordinates
MouseGetPos, StartX, StartY
clipboard = Click %StartX%, %StartY%
return


;functions
concede() {
  Click 1867, 23
  Sleep, 200
  Click 997, 387
  Sleep, 1700
  Click 1122, 806
}

; End turn
endturn() {
  MouseGetPos, StartX, StartY
  Click 1592, 932
  MouseMove, StartX, StartY
}

mulligan(number) {
  BlockInput, On
  MouseGetPos, StartX, StartY
  IfEqual, number, 1, Click 647, 401
  IfEqual, number, 2, Click 962, 458
  IfEqual, number, 3, Click 1253, 456
  IfEqual, number, 0, Click 1021, 914
  MouseMove, StartX, StartY
}

drop(lane) { ;drops card from hand in a lane
  BlockInput, On
  MouseGetPos, StartX, StartY
  Click down
  Sleep, 10
  IfEqual, lane, 1, MouseClickDrag, Left, %StartX%, %StartY%, 478, 584, %dragSpeed%
  IfEqual, lane, 2, MouseClickDrag, Left, %StartX%, %StartY%, 1397, 589, %dragSpeed%
  MouseMove, StartX, StartY
  BlockInput, Off
}

face() { ;drags from mouse position to enemy face
  BlockInput, On
  MouseGetPos, StartX, StartY
  Click down
  Sleep, 10
  MouseClickDrag, Left, %StartX%, %StartY%, 967, 155, %dragSpeed%
  MouseMove, StartX, StartY
  BlockInput, Off
}
