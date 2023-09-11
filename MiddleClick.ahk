; Abbes

; Setup
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Mouse 4 to middle click
XButton1::
   Send, !{MButton}
return

; ; Mouse 4 to middle click
; F::
;    Send, !{MButton}
; return