#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;CISCO BOSS: 
;	make the router your 
; 	bitch with this easy peasy script!
;▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒░▒▒▒░▒
;▒░▒▒▒▒▒▄▄▀░░░░░▀▄▄▒▒▒▒░▒▒▒░▒▒▒
;▒▒▒░▒███▀▀▀▀███████▄▒▒▒▒░▒▒▒░▒
;▒░▒███▀░░░░░▐███████▌▒░▒▒▒░▒▒▒
;▒▒██▌░░░░░░░░▀███████▌▒▒░▒▒▒░▒
;▒▐██░░░░░░░░░░░▀██████▒▒▒▒░▒▒▒
;▒▐█▌░░░░░░░░░░░░▀████▌▒▒░▒▒▒░▒
;▒▒█░░░░░░░░░░░░░░▀██▀░░▒▒▒░▒▒▒
;▒░█░░░░░░░░░░░░░░░▀█░░░▒░▒▒▒░▒
;▒▒▐░░░░░░░▀▄▄▄▀░▄▀░█░░░▒▒▒░▒▒▒
;▒░▒░▄█▀▄░▄▀░█░▀▌░░░▀░░░▒░▒▒▒░▒
;▒▒▒▐░▀░░▌░▌░░░░▐░░░░░░░▀▄▒▒▒▒▒
;▒░▒▐░░░▐░▒░▀▄▄▄▀░░░░░░▐▒▒▀▀▄▄▒
;▒▒▒▒▀▀▀░▒░░░░░▒░░░░░░░▐▒▒▒▒▒▒▀
;▒░▒▒▒░░░░▒▒░░▄▄▒░░░░░▐▒▒░▒▒▒▒▒
;▒▒▒░▒▒░░▀▄▄▀▀░░▒░░░░▐▒▒░▒▒▒▒▒▒
;▒░▒▒▒▄▀▄░░░░░░░░░░░▄▒▒░▒▒▒▒▒▒▒
;▒▒▒▄▀▒▒▒▀░░░░░░░░▄▀▒▒░▒▒▒▒▒░▒▒
;▒▄▀▒▒▒▒▒▒▀▒▄░░░▄▀▒▒▒░▒▒▒▒▒░▒▒▒
;▀▒▒▒▒▒▒▒▒▄▄█████▄▒▒░▒▒▒▒▒░▒▒▒▒
;
; de-config router or switch
^!1::
	send, no{ENTER}
	sleep, 20000
	send, {ENTER}en{ENTER}del{SPACE}vlan.dat{ENTER}
	sleep, 2000
	send, {ENTER}
	sleep, 2000
	send, {ENTER}
	sleep, 2000
	send, wr{SPACE}er{ENTER}
	sleep, 1000
	send, {ENTER}
	sleep, 2000
	send, reload{ENTER}
	sleep, 200
	send, {ENTER}{ENTER}
	send, reload{enter}
	sleep, 200
	send, no{ENTER}{ENTER}
Return

;set default password set 

^!2::
	send, en{enter}
	send, conf t{enter}
	send, no ip domain-lookup{enter} 
	send, 
(
banner motd "
________  ___  ________  ________  ________     
|\   ____\|\  \|\   ____\|\   ____\|\   __  \    
\ \  \___|\ \  \ \  \___|\ \  \___|\ \  \|\  \   
 \ \  \    \ \  \ \_____  \ \  \    \ \  \\\  \  
  \ \  \____\ \  \|____|\  \ \  \____\ \  \\\  \ 
   \ \_______\ \__\____\_\  \ \_______\ \_______\
    \|_______|\|__|\_________\|_______|\|_______|
                  \|_________|

  _______      ________      ________       _____     
 /  ___  \    |\  ___  \    |\   __  \     / __  \    
/__/|_/  /|   \ \____   \   \ \  \|\  \   |\/_|\  \   
|__|//  / /    \|____|\  \   \ \  \\\  \  \|/ \ \  \  
    /  /_/__       __\_\  \   \ \  \\\  \      \ \  \ 
   |\________\    |\_______\   \ \_______\      \ \__\
    \|_______|    \|_______|    \|_______|       \|__|"{ENTER}
)
	send, enable secret class{enter}
	send, line vty 0 4{enter}
	send, trans in all{enter}
	send, password cisco{enter}
	send, login{enter}
	send, exit{enter}
	send, ip http server{enter}
	send, ip http auth enable{enter}
	send, ip http port 80{enter}
	send, hostname{space}
return

;###################################################
;# # # # # # # # # # # # # # # # # # # # # # # # # #
;###################################################
;Section: Subnets
; autofill subnet mask based on input prefix
Numpad0 & 0::
	send, 0.0.0.0
Return

Numpad0 & Numpad1::
	send, 128.0.0.0
Return

Numpad0 & Numpad2::
	send, 192.0.0.0
Return

Numpad0 & Numpad3::
	send, 224.0.0.0
Return

Numpad0 & Numpad4::
	send, 240.0.0.0
Return

Numpad0 & Numpad5::
	send, 248.0.0.0
Return

Numpad0 & Numpad6::
	send, 252.0.0.0
Return

Numpad0 & Numpad7::
	send, 254.0.0.0
Return

Numpad0 & Numpad8::
	send, 255.0.0.0
Return

Numpad0 & Numpad9::
	send, 255.128.0.0
Return

Numpad1 & Numpad0::
	send, 255.192.0.0
Return

Numpad1 & 1::
	send, 255.224.0.0
Return

Numpad1 & Numpad2::
	send, 255.240.0.0
Return

Numpad1 & Numpad3::
	send, 255.248.0.0
Return

Numpad1 & Numpad4::
	send, 255.252.0.0
Return

Numpad1 & Numpad5::
	send, 255.254.0.0
Return

Numpad1 & Numpad6::
	send, 255.255.0.0
Return

Numpad1 & Numpad7::
	send, 255.255.128.0
Return

Numpad1 & Numpad8::
	send, 255.255.192.0
Return

Numpad1 & Numpad9::
	send, 255.255.224.0
Return

Numpad2 & Numpad0::
	send, 255.255.240.0
Return

Numpad2 & Numpad1::
	send, 255.255.248.0
Return

Numpad2 & 2::
	send, 255.255.252.0
Return

Numpad2 & Numpad3::
	send, 255.255.254.0
Return

Numpad2 & Numpad4::
	send, 255.255.255.0
Return

Numpad2 & Numpad5::
	send, 255.255.255.128
Return

Numpad2 & Numpad6::
	send, 255.255.255.192
Return

Numpad2 & Numpad7::
	send, 255.255.255.224
Return

Numpad2 & Numpad8::
	send, 255.255.255.240
Return

Numpad2 & Numpad9::
	send, 255.255.255.248
Return

Numpad3 & Numpad0::
	send, 255.255.255.252
Return

Numpad3 & Numpad1::
	send, 255.255.255.254
Return

Numpad3 & Numpad2::
	send, 255.255.255.255
Return
