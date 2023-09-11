; Visual Studio

; Switch to Unity (if open)
Devenv_5() {
   ; Check if Unity is open
   if WinExist("ahk_exe Unity.exe") {
      WinActivate ; Switch
   }
   else {
      ; If not: call default
      5()
   }
   return 1
}

; Save and switch to Unity (if open)
Devenv_Shift5() {
   ; Check if Unity is open
   if WinExist("ahk_exe Unity.exe") {
      Send, ^s    ;Save
      WinActivate ; Switch
   }
   else {
      ; If not: call default
      5()
   }
   return 1
}