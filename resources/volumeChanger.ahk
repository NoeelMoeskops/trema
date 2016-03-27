#If MouseIsOver("ahk_class Shell_TrayWnd")
{
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
    Up:: Send {Media_Play_Pause}
    Down:: Send {Media_Play_Pause}
    Left:: Send {Media_Prev}
    Right:: Send {Media_Next}
    
}
#If


MouseIsOver(WinTitle) 
{
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

;met pijltjes op volgende/vorige en op pauze drukken