media = false
proNaam = Trema
ini = %proNaam%.ini

IfNotExist,%ini%
{
	IniWrite,Windows Media Player,%ini%,media,audioTitle
	IniWrite,C:\Program Files (x86)\Windows Media Player\wmplayer.exe,%ini%,media,audioDir
}
IniRead,audioTitle,%ini%,media,audioTitle
IniRead,audioDir,%ini%,media,audioDir

#if (media)
{
	Media_Play_Pause::
	{
		mediaplaypause()

	}
	return
}
return

mediaplaypause()
{
	global audioTitle
	global audioDir
		IfWinExist, %audioTitle%
		{
			global media
			media = false
			Send, {Media_Play_Pause}
			;Sleep, 1000
			media = true
		}else{
			Run, %audioDir%
			WinWaitActive, %audioTitle%
			Sleep, 500
			Send, {tab}
			Send, {enter}
			Send, {Media_Next}
			Send, {Media_Play_Pause}
			return
		}
}

#If MouseIsOver("ahk_class Shell_TrayWnd")
{
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
    Up:: mediaplaypause()
    Down:: mediaplaypause()
    Left:: Send {Media_Prev}
    Right:: Send {Media_Next}

}
#If


MouseIsOver(WinTitle)
{
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
F4:: exit
F5:: reload
;met pijltjes op volgende/vorige en op pauze drukken
