$PBExportHeader$nv_arg.sru
forward
global type nv_arg from nonvisualobject
end type
end forward

global type nv_arg from nonvisualobject
end type
global nv_arg nv_arg

type variables
window iw
boolean ib_stop = True
int ii_runtype
end variables
on nv_arg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_arg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

