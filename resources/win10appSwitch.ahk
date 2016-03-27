;http://www.autohotkey.com/board/topic/148056-move-window-between-virtual-desktops-on-windows-10/
;SetBatchLines,-1



SetTimer bcheck, 250
coordmode, mouse, screen
MouseGetPos, mX

^!#Left:: MoveWindowToDesktop(0) 
^!#Right:: MoveWindowToDesktop(1)
^Browser_Forward::  MoveWindowToDesktop(0)
^Browser_Back::  MoveWindowToDesktop(1)

   bcheck:
	GetKeyState, mBut, MButton
	GetKeyState, cBut, Ctrl
	MouseGetPos, nX
	t = 100
	if (cBut == "D" && mBut == "D" && nX < (mX-t))
	{
        ; MsgBox yes
         Sleep, 250
		MoveWindowToDesktop(0) 
	}else if(cBut == "D" && mBut == "D" && nX < (mX+t))
	{
       ; MsgBox yes
        Sleep, 250
		MoveWindowToDesktop(1) 
	} else if (mBut == "D" && nX > (mX+t))
	{
		SendInput,{LCtrl down}{LWin down}{Right}{LCtrl up}{LWin up}
	} else if (mBut == "D" && nX < (mX-t))
	{
		SendInput,{LCtrl down}{LWin down}{Left}{LCtrl up}{LWin up}
	}
	MouseGetPos, mX
   return

MoveWindowToDesktop(next) 
{

   ; Launch Win+Tab and open context menu
   Send, #{Tab}
   Sleep, 150
   Send, {AppsKey}

   ; Get context menu info
   WinWait, ahk_class #32768
   SendMessage, 0x1E1, 0, 0
   hMenu := ErrorLevel
   sContents := GetMenu(hMenu)
   StringSplit, itemArray, sContents, `, 

   ; Determine what is the current desktop as well as the total number of desktops
   total := 1
   current := 0
   Loop, %itemArray0%
   {
      element := itemArray%A_Index%
      StringSplit, wordArray, element, %A_Space%
      lastWord := wordArray%wordArray0%
      if (lastWord+0) {
         if (lastWord > total and current = 0)
            current := lastWord - 1
         total := total + 1
      }
      else if (current > 0)
         break
   }
   if (current = 0)
      current := total

   if ((current = total and next = 1) or (current = 1 and next = 0)) {
      Sleep, 75
      SendInput, {Esc 2}
      return
   }

   else {

      ; Send input to select desired desktop
      desired := current - 2 + next
      SendInput, {Down}
      SendInput, {Right}
      SendInput, {Down %desired%}
      SendInput, {Enter}

      ; Go to desired desktop
      SendInput, {Enter}
      if (next = 1)
         Send, ^#{Right}
      else
         Send, ^#{Left}

   }

   return

}
return

GetMenu(hMenu)
{
   Loop, % DllCall("GetMenuItemCount", "Uint", hMenu)
   {
      idx := A_Index - 1
      idn := DllCall("GetMenuItemID", "Uint", hMenu, "int", idx)
      nSize++ := DllCall("GetMenuString", "Uint", hMenu, "int", idx, "Uint", 0, "int", 0, "Uint", 0x400)
     nSize := (nSize * (A_IsUnicode ? 2 : 1))
      VarSetCapacity(sString, nSize)
      DllCall("GetMenuString", "Uint", hMenu, "int", idx, "str", sString, "int", nSize, "Uint", 0x400)   ;MF_BYPOSITION
      If !sString
         sString := "---------------------------------------"
      ;sContents .= idx . " : " . idn . A_Tab . A_Tab . sString . "`n"
      sContents .= sString . ","
      If (idn = -1) && (hSubMenu := DllCall("GetSubMenu", "Uint", hMenu, "int", idx))
         sContents .= GetMenu(hSubMenu)
   }
   Return   sContents
}
return