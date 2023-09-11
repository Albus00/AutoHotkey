; Visual Studio Code

; Switch to Unity (if open)
Code_5() {
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
Code_Shift5() {
   ; Check if Unity is open
   if WinExist("ahk_exe Unity.exe") {
      Send, ^s    ; Save
      Sleep, 200  ; Wait 0.2 sec
      WinActivate ; Switch
   }
   else {
      ; If not: call default
      5()
   }
   return 1
}