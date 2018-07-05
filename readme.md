## iPECS ClickCall dial handler

A simple script to allow you to dial telephone numbers programmatically using [iPECS ClickCall](https://www.ipecs.com/site/lgericsson/menu/366.do?scene=detail&productNo=95).
Naturally, requires you to have working ClickCall credentials configured in your UCP.

### Usage
```
dial.ahk telephone_number
```
The script can also be compiled with `Ahk2Exe.exe`, to negate having autohotkey installed.
Requires a Windows binary version of `curl.exe`, available [here](https://curl.haxx.se/download.html) to make POST requests.

The script also supports being used as your default `dial://` and `tel://` URL handlers.

### Setup
Firstly set the login details for your extension in PGM227 and edit the `config.ahk` with the appropriate details.
Then enabled `Click To Call Service` on your extension in PGM111 and you're good to go.