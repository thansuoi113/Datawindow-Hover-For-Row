$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_1 from datawindow within w_main
end type
end forward

global type w_main from window
string tag = "Change Datawindow Row Color At Mouse Move / Mouse Over"
integer width = 1550
integer height = 1752
boolean titlebar = true
string title = "Datawindow Hover For Row"
boolean controlmenu = true
boolean minbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_main w_main

type variables
int li_xpos , li_ypos , li_prev_xpos , li_prev_ypos

end variables
on w_main.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_main.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_main
event mousemove pbm_mousemove
integer x = 37
integer y = 32
integer width = 1463
integer height = 1600
integer taborder = 10
string title = "none"
string dataobject = "d_dataex"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event mousemove;
String ls_band_name
Integer li_previousrownum,li_rowNum

li_xpos = xpos
li_ypos = ypos
If li_prev_xpos = xpos And li_prev_ypos = ypos Then
	Return
Else
	li_prev_xpos = xpos
	li_prev_ypos = ypos
End If

ls_band_name = This.GetBandAtPointer()

If Pos(ls_band_name, "detail") > 0 Then
	li_rowNum = Integer( Mid( ls_band_name, 7))
	If li_rowNum = li_previousrownum Or li_rowNum <= 0 Then
		Return
	Else
		// YOU CHANGE YOUR OWN COLOR In RGB(--,--,--)
		This.Modify('datawindow.detail.color="0~tif(getRow()=' + String(li_rowNum) + ',RGB(241,240,146) ,'+This.Object.DataWindow.Color+')"' )
		li_previousrownum = li_rowNum
	End If
	//Return
End If



end event

