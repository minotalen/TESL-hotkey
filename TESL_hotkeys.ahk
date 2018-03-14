#SingleInstance force ; Replace an existing script

; Changes the tray icon's tooltip (displayed when mouse hovers over it)
Menu, tray, Tip, TESL Hotkeys
; Show Tooltip in the tray that the script is active
TrayTip, TESL Hotkeys, running...,,16
; Makes subsequent hotkeys only function if specified window is active
IfWinActive The Elder Scrolls: Legends ahk_class UnityWndClass

dragSpeed = 6
pileOpen = 0



;toggle hotkeys on/off
+x:: ; shift + X
toggle()
return

; End turn
mbutton:: ; Middle mouse button
Space:: ; Spacebar
endturn()
return

;attack face
rbutton:: ; Right mouse button
face()
return

; mulligan selection
b:: ; mulligan selection card 1
mulligan(1)
return
n:: ; mulligan selection card 2ownPos = 1
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

; ring for magicka
r:: ; r or page down
PgDn::
ring()
return

Left:: ; drop in left lane
drop(1)
return
Right:: ; drop in right lanej
drop(2)
return

; scroll through creatures on board
l::
laneScroll(1,1,0) ;own lane forward
return
k::
laneScroll(1,0,0) ;         backward
return

o::
laneScroll(0,1,0) ;opponent lane forward
return
i::
laneScroll(0,0,0) ;              backward
return

p::
laneScroll(0,0,1)
return


;see remaining cards
d:: ;see own deck
PgUp::
deck(1)
return
+d:: ;see opponent deck
+PgUp::
deck(0)
return

;see discard pile
s::
pile()
return

;play again
Enter:: ;Enter Key
Click 1124, 960
return

+q:: ;concede game
concede()
returnX := 1300 Y:= 582

y:: ;helper function to get mouse coordinates
MouseGetPos, StartX, StartY
clipboard = %StartX%, %StartY%
return


;functions

; Convert relative positions of buttons on screen into absolute
; pixels for AHK commands. Allows for different resolutions.
GetAbsolutePixels(RatioX, RatioY) {
WinGetPos,,, Width, Height
AbsoluteX := Round(Width * RatioX)
AbsoluteY := Round(Height * RatioY)
return [AbsoluteX, AbsoluteY]
}

GetRelativePixels(AbsoluteX, AbsoluteY) {
WinGetPos,,, Width, Height
 RatioX := AbsoluteX / Width
 RatioY := AbsoluteY / Height
return [RatioX, RatioY]
}


toggle() {
  Suspend ;maybe tooltip for on/off?
}

;Concede the game
concede() {
  MenuX = 1867
  MenuY = 23
  Click %MenuX%, %MenuY% ;open the menu
  Sleep, 200
  Click 997, 387 ;click concede (hits retry in AI matches)
  Sleep, 1700
  Click 1122, 806 ;confirm
}

; End turn
endturn() {
  static EndTurnX := 1592
  static EndTurnY := 932
  MouseGetPos, StartX, StartY
  Click %EndTurnX%, %EndTurnY%
  Sleep, 10
  MouseMove, StartX, StartY
}

; Mulligan helper
mulligan(number) {
  BlockInput, On
  MouseGetPos, StartX, StartY
  IfEqual, number, 1, Click 647, 401 ;left card
  IfEqual, number, 2, Click 962, 458 ;middle card
  IfEqual, number, 3, Click 1253, 456 ;right card
  IfEqual, number, 0, Click 1021, 914 ;confirm selection
  Sleep, 20
  MouseMove, StartX, StartY
  BlockInput, Off
}

;drops card from hand in a lane
drop(lane) {
  leftLaneX = 478
  leftLaneY = 684
  rightLaneX = 1397
  rightLaneY = 589
  BlockInput, On
  MouseGetPos, StartX, StartY
  Click down
  Sleep, 10
  IfEqual, lane, 1, MouseClickDrag, Left, %StartX%, %StartY%, %leftLaneX%, %leftLaneY%, %dragSpeed%
  IfEqual, lane, 2, MouseClickDrag, Left, %StartX%, %StartY%,  %rightLaneX%, %rightLaneY%, %dragSpeed%
  MouseMove, StartX, StartY
  BlockInput, Off
}

;drags from mouse position to enemy face
face() {
  faceX = 967
  faceY = 155
  BlockInput, On
  MouseGetPos, StartX, StartY
  Click down
  Sleep, 10
  MouseClickDrag, Left, %StartX%, %StartY%, %faceX%, %faceY%, %dragSpeed%
  MouseMove, StartX, StartY
  BlockInput, Off
}

;scrolls through the lanes and remembers coordinates
laneScroll(own, dir, attack) {
   ownlaneY = 600
   opplaneY = 320
   leftstart = 400
   leftstop = 900
   rightstart = 1040
   rightstop = 1860
   static ownPos = 1
   static oppPos = 1
   numPos = 14 ;number of positions laneScroll scrolls through
   if(attack=false){
   if(own=1) {
     if (dir=1){ ;direction of scroll
       ownPos += 1
     } else {
       ownPos -= 1
     }
     if(ownPos <= numPos) {
       ownlaneX := leftstart+((rightstop-leftstart)/ numPos*(ownPos-1)) ;left border + distance between borders
     }
     MouseMove, ownlaneX, ownlaneY
   } else {
     if (dir=1){ ;direction of scroll
       oppPos += 1
     } else {
       oppPos -= 1
     }
     if(oppPos <= numPos) {
       opplaneX := leftstart+((rightstop-leftstart)/ numPos*(oppPos-1))
     }
     MouseMove, opplaneX, opplaneY
   }
} else {
  MouseMove, ownlaneX, ownlaneY
  clipboard = huhuhuhu
  ownlaneX := leftstart+((rightstop-leftstart)/ numPos*(ownPos-1)) ;left border + distance between borders
  opplaneX := leftstart+((rightstop-leftstart)/ numPos*(oppPos-1))
  MouseClickDrag, Left, %ownlaneX%, %ownlaneY%, %opplaneX%, %opplaneY%, %dragSpeed%
}}



ring() {
  ringX = 1390
  ringY = 830
  MouseGetPos, StartX, StartY
  Click %ringX%, %ringY% ;click ring
  MouseMove, StartX, StartY
}

;moves mouse over deck to see remaining cards
deck(own) {
  BlockInput, On
  ownDeckX = 1416
  ownDeckY = 953
  MouseGetPos, StartX, StartY
  IfEqual, own, 1, MouseMove 1416, 953 ;hover own deck
  IfEqual, own, 0, MouseMove 1416, 953 ;hover opponent deck (currently bad coord)
  Sleep, 1000 waits 1 second then returns
  MouseMove, StartX, StartY
  BlockInput, Off
}

;placeholder
pile() {
  if (pileOpen = 0) {
    ; open pile
    pileOpen := 1
    } else {
    ;close pile
    pileOpen := 0
  }
}
