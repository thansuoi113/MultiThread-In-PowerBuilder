$PBExportHeader$n_thread1.sru
forward
global type n_thread1 from nonvisualobject
end type
end forward

global type n_thread1 from nonvisualobject
end type
global n_thread1 n_thread1

type variables
long il_count
boolean ib_stop
end variables

forward prototypes
public subroutine of_step ()
public subroutine of_start ()
public subroutine of_stop ()
end prototypes

public subroutine of_step ();
// ib_stop running flag
If  Not ib_stop Then
	
	//reset count numner
	If il_count > 10000000 Then il_count = 0
	
	//count the number of times
	il_count++
	
	// call back function	
	Post of_step()
	
End If

end subroutine

public subroutine of_start ();//flag running on
ib_stop = False
//call function
Post of_step()


end subroutine

public subroutine of_stop ();ib_stop = True
end subroutine

on n_thread1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_thread1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

