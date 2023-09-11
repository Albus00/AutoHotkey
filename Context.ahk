; Initialize arrays
global programs := ["chrome", "Code", "Unity", "devenv", "RainbowSix_Vulcan", "UnrealEditor", "idea64"]

; Include programs library and start
include_folder("Programs")
#Include, %A_ScriptDir%\IncludeList.ahk

; Send call function based on active program and inputKey
ContextAware(inputKey) {
    activeProgram := getActiveExe() ; Get active program exe name

    ;MsgBox, %activeProgram%_%inputKey%

    ; Check if active program has lib file
    for i, prog in programs {
        if (prog = activeProgram) {
            ; Check if program-specific function corresponding to inputKey exists
            if (%prog%_%inputKey%() != 1) {
                %inputKey%() ; Call default function
            }
            return
        }
    } 

    ; Program file not found, call default function for inputKey
    %inputKey%()
    return
}

; Get the active program executable name
; source = https://www.autohotkey.com/boards/viewtopic.php?t=36484
; edited
getActiveExe() {
    ; Get program exe name
    WinGet, hWnd, ID, A
    WinGet, program, ProcessName, % "ahk_id " hWnd

    ; Remove ".exe" from program
    StringReplace, program, program, .exe

    ; Return program exe
    return %program%   
}

; Finds all .ahk files in folder and saves them, with the "include" command in "IncludeList.ahk"
; author    = davebrny
; source    = https://gist.github.com/davebrny/55de3ab40499e33e40324ac6a96b70c0
; edited
include_folder(folder) {
    ; Get file paths
    loop, files, % folder "\*.ahk", FR
        {
        if a_loopFileFullPath contains %a_scriptFullPath%,%a_lineFile%,\lib\
            continue
        stringReplace, loop_path, a_loopFileFullPath,  %a_scriptDir%, `%a_scriptDir`%
        new_includes .= (new_includes ? "`n" : "") . "#Include, %A_ScriptDir%\" . loop_path
        }

    ; Write file paths to list
    file := fileOpen("IncludeList.ahk", "w `n")
    file.write(";include_" "these:`n" new_includes)
    file.close()
}