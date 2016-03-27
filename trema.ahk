#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance ignore
#Persistent
;#NoTrayIcon
#Include resources/autoUpdate Noev1.ahk
updateUrl = http://noeel.nl/tools/trema/versie.ini
installdir = %A_AppData%\Moeskops Software\Trema
startMenu = %A_AppData%\Microsoft\Windows\Start Menu\Programs
versie = 163.27
proNaam = Trema


ifExist, %installdir%
{
	Menu, Tray, add, DeInstall, deinstall
	Menu, Tray, add, Carlinga help, carlinga
	Menu, Tray, add, Help, help
}
else {
	Menu, Tray, add, Install, install
}
Menu, Tray, Tip, %proNaam% %versie%
Menu, Tray, NoStandard ; remove standard Menu items
Menu, Tray, add, Update, update
Menu, Tray, add, Restart, restart
Menu, Tray, add, Exit, exit

;Check_ForUpdate(updateUrl)

OnMessage(0x404, "AHK_NOTIFYICON")
AHK_NOTIFYICON(wParam, lParam)

{

    if (lParam = 0x202) ; WM_LBUTTONUP

    {

      ; Gui, Show, w300 h400, Trema

    }
}


;#include GUI.ahk
#Include resources/win10appSwitch.ahk
#Include resources/carlinga/compose.ahk ; file with compose sequences
#Include resources/carlinga/entities.ahk ; file with entities
#Include resources/carlinga/custom.ahk ; file with custom sequences
#Include resources/media.ahk
;#Include resources/volumeChanger.ahk
#Include resources/colorPicker.ahk



GuiClose:
Gui, Cancel
return

install:
ifExist, %installdir%
	MsgBox al geinstaleerd
else {

	FileCreateDir, %installdir%
	FileCopy, %A_workingDir%\Trema.exe, %installdir%\Trema.exe
	FileInstall, resources\carlinga\carlinga_help.pdf, %installdir%\carlinga_help.pdf
	FileInstall, resources\music.lnk, %installdir%\music.lnk
	FileCreateDir, %startMenu%\Moeskops Software\Trema
	FileCreateShortcut, %installdir%\Trema.exe, %startMenu%\Moeskops Software\Trema\Trema.lnk
	FileCreateShortcut, %installdir%\Trema.exe, %startMenu%\Startup\Trema.lnk
	if ErrorLevel
		MsgBox ERROR
		else{
			MsgBox succesvol geinstaleerd
		}
 }
 Reload
return


help:
run http://www.noeel.nl/tools/Trema
return
carlinga:
run, %installdir%\carlinga_help.pdf
return
deinstall:
IfNotExist, %installdir%
	MsgBox is al verwijderd
else{
	FileRemoveDir, %installdir%, 1
	if ErrorLevel
		MsgBox, 16, %proNaam%, cant remove %installdir%
	else
	FileRemoveDir, %startMenu%\Moeskops Software\, 1
	if ErrorLevel
		MsgBox, 16, %proNaam%, cant remove %startMenu%\Moeskops Software
	else
	FileDelete, %startMenu%\Startup\Trema.lnk
	if ErrorLevel
		MsgBox, 16, %proNaam%, cant remove %startMenu%\Startup\Trema.lnk
		else{
			MsgBox succesvol verwijderd
		}
}
Reload
return
update:
	Check_ForUpdate(updateUrl, 0)
return
restart:
	Reload
return
exit:
	ExitApp
return
