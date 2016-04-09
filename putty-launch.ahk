#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!4
;

	InputBox, COM, Enter COM,  Enter COM port for console connection: (Hint: check device manager if you don't know!)
	run, putty.exe
	send, {tab}{tab}{Right}{shift down}{tab}{tab}{shift up}{right}{backspace}%COM%{enter}
	sleep, 100
	send, {enter}
Return