$PBExportHeader$w_ex1.srw
forward
global type w_ex1 from window
end type
type st_3 from statictext within w_ex1
end type
type st_2 from statictext within w_ex1
end type
type st_1 from statictext within w_ex1
end type
type sle_2 from singlelineedit within w_ex1
end type
type sle_1 from singlelineedit within w_ex1
end type
type cb_4 from commandbutton within w_ex1
end type
type cb_3 from commandbutton within w_ex1
end type
type cb_2 from commandbutton within w_ex1
end type
type cb_1 from commandbutton within w_ex1
end type
end forward

global type w_ex1 from window
integer width = 1897
integer height = 612
boolean titlebar = true
string title = "Multi Thread Exam 1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
sle_2 sle_2
sle_1 sle_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_ex1 w_ex1

type variables
n_thread1 in_thread1, in_thread2
end variables

on w_ex1.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.sle_2,&
this.sle_1,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_ex1.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;ErrorReturn lErrorReturn
lErrorReturn = SharedObjectRegister("n_thread1", "in_thread1")
lErrorReturn = SharedObjectGet("in_thread1", in_thread1)

lErrorReturn = SharedObjectRegister("n_thread1", "in_thread2")
lErrorReturn = SharedObjectGet("in_thread2", in_thread2)


end event

event close;ErrorReturn lErrorReturn
lErrorReturn = SharedObjectUnRegister("in_thread1")
lErrorReturn = SharedObjectUnRegister("in_thread2")

If IsValid(in_thread1) Then  Destroy in_thread1
If IsValid(in_thread2) Then  Destroy in_thread2


end event

event timer;sle_1.Text = String(in_thread1.il_count )
sle_2.Text = String(in_thread2.il_count )

end event

type st_3 from statictext within w_ex1
integer x = 73
integer y = 416
integer width = 1189
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Example:  Multithreading unused parameters"
boolean focusrectangle = false
end type

type st_2 from statictext within w_ex1
integer y = 212
integer width = 256
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Number:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_ex1
integer y = 64
integer width = 256
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Number:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_ex1
integer x = 270
integer y = 192
integer width = 695
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_ex1
integer x = 270
integer y = 64
integer width = 695
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_ex1
integer x = 1426
integer y = 192
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;If Not IsValid(in_thread2) Then return

in_thread2.of_stop( )

//timer(0)

end event

type cb_3 from commandbutton within w_ex1
integer x = 987
integer y = 192
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;If Not IsValid(in_thread2) Then in_thread2 = Create n_thread1

in_thread2.post of_start( )

timer(0.1)

end event

type cb_2 from commandbutton within w_ex1
integer x = 1426
integer y = 64
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;If Not IsValid(in_thread1) Then return

in_thread1.of_stop( )

//timer(0)

end event

type cb_1 from commandbutton within w_ex1
integer x = 987
integer y = 64
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;If Not IsValid(in_thread1) Then in_thread1 = Create n_thread1

in_thread1.post of_start( )

timer(0.1)

end event

