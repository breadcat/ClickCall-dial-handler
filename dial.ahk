#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

number = "%1%%2%%3%%4%%5%" ; supports plenty of spaces

StringReplace, number, number, dial:`/`/,, All ; remove url handler
StringReplace, number, number, tel:`/`/,, All ; remove url handler
StringReplace, number, number, `%20,, All ; remove html spaces
number := RegExReplace(number, "[\W_]+") ; remove underscores, non-numbers and non-letters

#Include, *i %A_ScriptDir%\config.ahk ; include configuration values

postData = `<?xml version=\`"1.0\`" ?`>`<!DOCTYPE ipecs_svc SYSTEM \`"iPECSService.dtd\`"`>`<ipecs_svc`>`<request type=\`"service\`" encrypt=\`"off\`" servicename=\`"clicktocall\`"`>`<clicktocall`>`<userinfo`>`<stnnum`>%stnNum%`</stnnum`>`<userid`>%stnNum%`</userid`>`<userpwd encrypt=\`"off\`"`>%stnPwd%`</userpwd`>`</userinfo`>`<srcinfo`>`<dialnum`>%stnNum%`</dialnum`>`</srcinfo`>`<destinfo calltype=\`"single\`"`>`<dialnum`>%linePrefix%%number%`</dialnum`>`</destinfo`>`</clicktocall`>`</request`>`</ipecs_svc`>
ucpAddr = https`:`/`/%ucpIP%`:%ucpPort%`/ipecs_svc
dialCmd = curl -k -X POST -d "%postData%" "%ucpAddr%"

FileAppend, %dialCmd%, dial.bat ; for some reason, can't be called directly. maybe character escaping to blame
Run, dial.bat,,hide ; run the command, hidden
Sleep, 1000 ; fails if file is deleted too quickly
FileDelete dial.bat ; delete temp file afterwards
