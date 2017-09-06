#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

number = "%1%%2%"

StringReplace, number, number, dial:`/`/,, All ; remove url handler
StringReplace, number, number, tel:`/`/,, All ; remove url handler
StringReplace, number, number, `%20,, All ; remove html spaces
number := RegExReplace(number, "[\W_]+") ; remove underscores, non-numbers and non-letters

Run, "%A_ProgramFiles%\iPECS\iPECS ClickCall\iPECS ClickCall.exe"
WinWaitActive, iPECS ClickCall, , 2
    Send, {Sleep 75}9%number%{Sleep 75}{Enter} ; send dial command
    Return