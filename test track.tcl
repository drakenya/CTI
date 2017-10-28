CONTROLS:T1,T2,T3,T4
SENSORS:AA#,bb#,cc#,dd#

actions:

when aa=on do $color block(6,2,1)=red 
when aa=off do $color block(6,2,1)=black 
when bb=on do $color block(11,2,1)=red 
when bb=off do $color block(11,2,1)=black
when cc=on do $color block(16,2,1)=red 
when cc=off do $color block(16,2,1)=black 
when dd=on do $color block(21,2,1)=red 
when dd=off do $color block(21,2,1)=black  