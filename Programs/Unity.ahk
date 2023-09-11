; Unity

; Play/Stop game
Unity_0() {
   Send, ^p
   return 1
}

; Maximize window
Unity_1() {
   Send, +{Space}
   return 1
}

; Switch to VSCode
Unity_5() {
   ; Check if VSCode is open
   if WinExist("ahk_exe Code.exe") {
      WinActivate ; Switch
   }
   else {
      ; If not: display message
      MsgBox, 0, Error, Visual Studio Code is not open, 1
   }
   return 1
}