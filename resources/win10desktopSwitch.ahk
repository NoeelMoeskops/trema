
#Persistent
;MsgBox lol
;SetTimer mBut, 250
coordmode, mouse, screen
MouseGetPos, mX

funccie()

funccie()
{
	KeyWait mButton, D
	MsgBox yeah
}

mButton:: functie()

MsgBox never stop


	mBut:
	GetKeyState, mBut, MButton
	GetKeyState, cBut, Control
	MouseGetPos, nX
	t = 100
	if (mBut == "D" && nX < (mX-t) && cBut == "D")
	{
		;MoveWindowToDesktop(0)
	} else if (mBut == "D" && nX < (mX+t) && cBut == "D")
	{
		;MoveWindowToDesktop(1)
	} else if (mBut == "D" && nX > (mX+t))
	{
		SendInput,{LCtrl down}{LWin down}{Right}{LCtrl up}{LWin up}
	} else if (mBut == "D" && nX < (mX-t))
	{
		SendInput,{LCtrl down}{LWin down}{Left}{LCtrl up}{LWin up}
	}
	MouseGetPos, mX
return
