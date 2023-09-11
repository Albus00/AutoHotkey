; Numpad controller

; Setup
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Include
#Include, %A_ScriptDir%\Context.ahk

; Numpad 0
NumpadIns::
   ContextAware("0")
return
+NumpadIns::
   ContextAware("Shift0")
return
^NumpadIns::
   ContextAware("Ctrl0")
return

; Numpad 1
NumpadEnd::
   ContextAware("1")
return
+NumpadEnd::
   ContextAware("Shift1")
return
^NumpadEnd::
   ContextAware("Ctrl1")
return
NumpadIns & NumpadEnd::
   ContextAware("Zero1")
return

; Numpad 2
NumpadDown::
   ContextAware("2")
return
+NumpadDown::
   ContextAware("Shift2")
return
^NumpadDown::
   ContextAware("Ctrl2")
return
NumpadIns & NumpadDown::
   ContextAware("Zero2")
return

; Numpad 3
NumpadPgDn::
   ContextAware("3")
return
+NumpadPgDn::
   ContextAware("Shift3")
return
^NumpadPgDn::
   ContextAware("Ctrl3")
return
NumpadIns & NumpadPgDn::
   ContextAware("Zero3")
return

; Numpad 4
NumpadLeft::
   ContextAware("4")
return
+NumpadLeft::
   ContextAware("Shift4")
return
NumpadIns & NumpadLeft::
   ContextAware("Zero4")
return

; Numpad 5
NumpadClear::
   ContextAware("5")
return
+NumpadClear::
   ContextAware("Shift5")
return
^NumpadClear::
   ContextAware("Ctrl5")
return
NumpadIns & NumpadClear::
   ContextAware("Zero5")
return

; Numpad 6
NumpadRight::
   ContextAware("6")
return
+NumpadRight::
   ContextAware("Shift6")
return
NumpadIns & NumpadRight::
   ContextAware("Zero6")
return

; Numpad 7
NumpadHome::
   ContextAware("7")
return
+NumpadHome::
   ContextAware("Shift7")
return
NumpadIns & NumpadHome::
   ContextAware("Zero7")
return

; Numpad 8
NumpadUp::
   ContextAware("8")
return
+NumpadUp::
   ContextAware("Shift8")
return
NumpadIns & NumpadUp::
   ContextAware("Zero8")
return

; Numpad 9
NumpadPgUp::
   ContextAware("9")
return
+NumpadPgUp::
   ContextAware("Shift9")
return
NumpadIns & NumpadPgUp::
   ContextAware("Zero9")
return

; Numpad Del
NumpadDel::
    ContextAware("NumpadDel")
+NumpadDel::
   ContextAware("ShiftDel")
return
NumpadIns & NumpadDel::
   ContextAware("ZeroDel")
return


; --------- Debug ---------

; Shift+Numpad enter
+NumpadEnter::
   activeProgram := getActiveExe()  ; Get active program
   Clipboard := activeProgram       ; Copy program to clipboard
return

; Ctrl+Shift+Numpad enter
^+NumpadEnter::
   activeProgram := getActiveExe()  ; Get active program
   Clipboard := activeProgram       ; Copy program to clipboard
   MsgBox, %activeProgram%          ; Display program in message box
return
