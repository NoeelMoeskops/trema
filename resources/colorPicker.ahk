^`::
	CoordMode, Mouse, Relative
	MouseGetPos, mX, mY
	PixelGetColor, color, mX, mY, rgb slow
	if ErrorLevel
		MsgBox error
	StringReplace c, color, 0x
	Clipboard = %c%
return
