$PBExportHeader$n_thread2.sru
forward
global type n_thread2 from nonvisualobject
end type
end forward

global type n_thread2 from nonvisualobject
end type
global n_thread2 n_thread2

type variables
long il_count
boolean ib_stop
nv_arg inv_arg
end variables

forward prototypes
public subroutine of_start ()
public subroutine of_stop ()
public subroutine of_ini (nonvisualobject anv)
end prototypes

public subroutine of_start ();If Not IsValid(inv_arg) Then Return
ib_stop = inv_arg.ib_stop
// ib_stop running flag
If  Not ib_stop Then
	
	//reset count numner
	If il_count > 10000000 Then il_count = 0
	
	//count the number of times
	il_count++
	
	// call back function	
	Post of_start()
	if inv_arg.ii_runtype = 2 then
		inv_arg.iw.dynamic function wf_refresh2() 
	else
		inv_arg.iw.dynamic function wf_refresh() 
	end if
End If

end subroutine

public subroutine of_stop ();ib_stop = True
end subroutine

public subroutine of_ini (nonvisualobject anv);inv_arg = anv
end subroutine

on n_thread2.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_thread2.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

