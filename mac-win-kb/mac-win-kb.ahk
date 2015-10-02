#SingleInstance force

; left-alt to command (windows key)
LAlt::SendInput {LWin Down}
LAlt Up::SendInput {LWin Up}

; command (windows key) to left-alt
LWin::SendInput {LAlt Down}
LWin Up::SendInput {LAlt Up}

; right-option to context
RAlt::SendInput {AppsKey}

; right-command to right Alt
RWin::SendInput {RAlt Down}
RWin Up::SendInput {RAlt Up}



; media controls (hold control)
^F7::SendInput {Media_Prev}
^F8::SendInput {Media_Play_Pause}
^F9::SendInput {Media_Next}

; volume controls (hold control)
^F10::SendInput {Volume_Mute}
^F11::SendInput {Volume_Down}
^F12::SendInput {Volume_Up}



; print screen
F13::SendInput {PrintScreen Down}
F13 Up::SendInput {PrintScreen Up}
; alt+print screen
!F13::SendInput {Alt down}{PrintScreen}{Alt up}

; scroll lock
F14::SendInput {ScrollLock Down}
F14 Up::SendInput {ScrollLock Up}

; pause
F15::SendInput {Pause Down}
F15 Up::SendInput {Pause Up}


*l::
{
  if( GetKeyState("LAlt", "P") )
    DllCall("LockWorkStation")
  else
    Send {Blind}{l}
}
