#include, %A_ScriptDir%/Include/PhilipsHue.ahk
; Keys
; https://www.autohotkey.com/docs/KeyList.htm

; GE Overlay
NumpadDel() {
   Send, !{NumpadDel}
   return
}

;------------------------------------------------------------------

; GE Overlay - save clip
1() {
   Send, !{Numpad1}
   return
}

Shift1() {
   MsgBox, Shift 1
   return
}

; Switch to/Open Spotify
Ctrl1() {
   ; Check if Spotify is open
   if WinExist("ahk_exe Spotify.exe") {
      WinActivate ; Switch
   }
   else {
      ; If not: open Spotify
      SetWorkingDir, C:\Users\albin\AppData\Roaming\Spotify
      Run C:\Users\albin\AppData\Roaming\Spotify\Spotify.exe
      SetWorkingDir, %A_ScriptDir%
   }
   return
}

; Philips Hue - Change brigtness: 20%
Zero1() {
   modifyLightBrightness(8, 200, WinHTTP)
   return
}

;------------------------------------------------------------------

; GE Overlay - screenshot
2() {
   Send, !{Numpad2}
   return
}

Shift2() {
   MsgBox, Shift 2
   return
}

; Switch to/Open Discord
Ctrl2() {
   ; Check if Discord is open
   if WinExist("ahk_exe Discord.exe") {
      WinActivate ; Switch
   }
   else {
      ; If not: open Discord
      SetWorkingDir, C:\Users\albin\AppData\Local\Discord\app-1.0.9003
      Run C:\Users\albin\AppData\Local\Discord\app-1.0.9003\Discord.exe
      SetWorkingDir, %A_ScriptDir%
   }
   return
}

Zero2() {
   MsgBox, Zero 2
   return
}

;------------------------------------------------------------------

; GE Overlay - fps overlay
3() {
   Send, !{Numpad3}
   return
}

Shift3() {
   MsgBox, Shift 3
   return
}

Ctrl3() {
   MsgBox, Ctrl 3
   return
}

Zero3() {
   MsgBox, Zero 3
   return
}

;------------------------------------------------------------------

; Left arrow
4() {
   Send, {Left}
   return
}

; Shift + Left arrow
Shift4() {
   Send, +{Left}
   return
}

Zero4() {
   Send	{Media_Prev}
   return
}

;------------------------------------------------------------------

5() {
   MsgBox, 5
   return
}

Shift5() {
   MsgBox, Shift 5
   return
}

Ctrl5() {
   MsgBox, Ctrl 5
   return
}

Zero5() {
   Send	{Media_Play_Pause}
   return
}

;------------------------------------------------------------------

; Right arrow
6() {
   Send, {Right}
   return
}

; Shift + Right arrow
Shift6() {
   Send, +{Right}
   return
}

Zero6() {
   Send  {Media_Next}
   return
}

;------------------------------------------------------------------

7() {
   MsgBox, 7
   return
}

Shift7() {
   MsgBox, Shift 7
   return
}

Zero7() {
   MsgBox, Zero 7
   return
}

;------------------------------------------------------------------

; Hibernate PC
8() {
   MsgBox, 1,, Hibernate?
   IfMsgBox Ok
      DllCall("PowrProf\SetSuspendState", "int", 1, "int", 1, "int", 1)
   return
}

; Shutdown PC
Zero8() {
   MsgBox, 1,, Shutdown?
   IfMsgBox Ok
      Shutdown, 8
   return
}

;------------------------------------------------------------------

; Connect to VPN
9() {
   SetNumLockState, On ; Turn on 'Notification led'

   ; Open openVPN
   SetWorkingDir, C:\Program Files\OpenVPN\config 
   Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --connect mullvad_se_sto.ovpn
   SetWorkingDir, %A_ScriptDir%

   ; Turn off 'Notification led'
   Sleep 200
   SetNumLockState, Off
   Return
}

Shift9() {
   MsgBox, Shift 9
   return
}

Zero9() {
   MsgBox, Zero 9
   return
}