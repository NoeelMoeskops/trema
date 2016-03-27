
;#NoTrayIcon
;#warn
Gui, Add, Button, x112 y359 w80 h30 gGuiClose, Cancel
Gui, Add, Button, x212 y359 w80 h30 , Apply
Gui, Add, Button, x12 y359 w80 h30 , OK
Gui, Add, Text, x40 y30, Alleen install, deinstall, update en exit doen het!
Gui, Add, Text, x70 y330, Gemaakt door Noeël Moeskops
;Gui, Add, Tab2, x0 y0 w350 h400 , General|Desktop Switch|Carlinga|Media|Color Picker
Gui, Add, CheckBox, x22 y189 w100 h20 +Left, AuoUpdate
Gui, Add, CheckBox, x22 y269 w100 h20 +Left, Start at Startup
Gui, Add, Button, x22 y89 w100 h30 , Help
Gui, Add, Text, x172 y279 w100 h20 +Center, %proNaam% %versie%
Gui, Add, Button, x172 y89 w100 h30 ginstall, Install
Gui, Add, Button, x172 y139 w100 h30 gdeinstall, Deinstall
Gui, Add, CheckBox, x22 y229 w100 h20 +Left, show at tray
Gui, Add, GroupBox, x162 y69 w120 h240 , Instalation
Gui, Add, Button, x172 y189 w100 h30 , Reset
Gui, Add, Button, x22 y139 w100 h30 gupdate , Update
Gui, Add, GroupBox, x12 y69 w120 h240 , 
Gui, Add, Button, x172 y239 w100 h30 gexit, Exit Trema
; Generated using SmartGUI Creator 4.0