$PBExportHeader$multithread.sra
$PBExportComments$Generated Application Object
forward
global type multithread from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type multithread from application
string appname = "multithread"
end type
global multithread multithread

on multithread.create
appname="multithread"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on multithread.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open(w_ex1)
Open(w_ex2)
end event

