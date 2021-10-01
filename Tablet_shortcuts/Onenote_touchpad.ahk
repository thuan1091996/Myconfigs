+^0:: ; pen0
;MouseClick, Left, 562, 1070, 1, 0
ControlClick, , ahk_class ApplicationFrameWindow, , LEFT, 1, Pos x315 y81 , , 
return

+^1:: ; pen1
MouseClick, Left, 315, 81, 1, 0
return

+^2:: ; pen2
MouseClick, Left, 349, 88, 1, 0
return

+^3:: ; pen3
MouseClick, Left, 395, 86, 1, 0
return

+^4:: ; pen4
MouseClick, Left, 765, 1075, 1, 0
return

+^5:: ; pen5
MouseClick, Left, 808, 1075, 1, 0
return

+^6:: ; pen6
MouseClick, Left, 859, 1074, 1, 0
return

+^7:: ; Erase
MouseClick, Left, 241, 81, 1, 0
return

+^8:: ; 
MouseClick, Left, 946, 1074, 1, 0
return

+^9:: ; Select
MouseClick, Left, 165, 91, 1, 0
return

;////////////////////////////////////////////////////////
;GetMousePos function
+^j::
MouseGetPos, x,y
msgBox, x=%x% - y=%y%
FileAppend, %x%, C:\Users\minht\OneDrive\Desktop\pos.txt
FileAppend, - %y%`n, C:\Users\minht\OneDrive\Desktop\pos.txt
return
;OutputDebug
;///////////Whiteboard RIGHT Layout////////////// 
; pen
	; 1847 244
	; 19 278
	; 1833 344
	; 1830 378
	; 1821 436
;Select 1827 669
;Highlight 1825 531
;Erase 1841 572 


;///////////Whiteboard BOTTOM Layout////////////// 
;567, 1080
;615, 1079
;676, 1079
;720, 1076
;765, 1075
;808, 1075
;859, 1074
;898, 1074
;946, 1074
;1013, 1080

;////////////////////////////////////////////////////////

;///////////One note win 10 ////////////// 
;292, 95
;315, 81
;349, 88
;395, 86
;241, 81
;165, 91
;////////////////////////////////////////////////////////


	
