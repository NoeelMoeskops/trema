#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#SingleInstance force ;ignore for compile
#Persistent ;ignore for compile
;#NoTrayIcon

ListLines Off
Process, Priority, , H ;if unstable, comment or remove this line
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

proNaam = proNaam
#include Packages.ahk
Menu, Tray, Tip, %proNaam%
; script goes here

; load test package
packages := new Packages()
packages.load(["volume", "ietsanders"])
F4::ExitApp ;ignore for compile
F5::Reload ;ignore for compile
