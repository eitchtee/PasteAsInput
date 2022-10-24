#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}



TrayTip PasteAsInput, PasteAsInput is running.`n"CTRL + Insert" to type current clipboard`n"CTRL + SHIFT + Insert" to quit
SetTimer, HideTrayTip, -3000

^insert::
SendRaw, %Clipboard%
TrayTip PasteAsInput, Successfully pasted, , 16
SetTimer, HideTrayTip, -1000
Return

^+insert:: 
TrayTip PasteAsInput, PasteAsInput is quitting, , 16
Sleep 2000
HideTrayTip()
ExitApp
Return
