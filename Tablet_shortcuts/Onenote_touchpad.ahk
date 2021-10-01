+^0:: ; pen1
MouseClick, Left, 230, 90, 1, 0
return

+^1:: ; pen2
MouseClick, Left, 275, 86, 1, 0
return

+^2:: ; pen3
MouseClick, Left, 330, 90, 1, 0
return

+^3:: ; pen4
MouseClick, Left, 390, 90, 1, 0
return

+^4:: ; pen4
MouseClick, Left, 765, 1075, 1, 0
return

+^5:: ; pen4
MouseClick, Left, 808, 1075, 1, 0
return

+^6:: ; pen4
MouseClick, Left, 859, 1074, 1, 0
return

+^7:: ; Erase
MouseClick, Left, 167, 80, 1, 0
return

+^8:: ; pen4
MouseClick, Left, 946, 1074, 1, 0
return

+^9:: ; Select
MouseClick, Left, 71, 93, 1, 0
return

;////////////////////////////////////////////////////////
;;GetMousePos function
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


	
