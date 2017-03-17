'''''''''' control board "a"

' Train Brain "1"
controls: 	c01a1, c02a1, c03a1, c04a1
sensors:	CD01a1#, CD02a1#, CD03a1#, CD04a1#

' Train Brain "2"
controls: 	c01a2, c02a2, c03a2, c04a2
sensors:	CD01a2#, CD02a2#, CD03a2#, CD04a2#

'Dash-8 "1"
controls:	c01a3, c02a3, c03a3, c04a3, c05a3, c06a3, c07a3, c08a3




variables: blockstatus[17],init,x,y,count
CAB_AorB[17]
CAB_CorD[17]
CAB_ABorCD[17]

CD_East[17]
CD_West[17]


actions:
when init=0 do

CAB_AorB[3]=&c01a1,
CAB_AorB[4]=&c02a1,
CAB_AorB[7]=&c03a1,
CAB_AorB[10]=&c04a1,
CAB_CorD[3]=&c01a2,
CAB_CorD[4]=&c02a2,
CAB_CorD[7]=&c03a2,
CAB_CorD[10]=&c04a2,
CAB_ABorCD[3]=&c01a3,
CAB_ABorCD[4]=&c02a3,
CAB_ABorCD[7]=&c03a3,
CAB_ABorCD[10]=&c04a3,
' &c05a3,
' &c06a3,
' &c07a3,
' &c08a3,

CD_East[3]=&CD01a1,
CD_West[3]=&CD02a1,
CD_East[4]=&CD03a1,
CD_West[4]=&CD04a1,
CD_East[7]=&CD01a2,
CD_West[7]=&CD02a2,
CD_East[10]=&CD03a2,
CD_West[10]=&CD04a2,

init=3

always do
count=1
until count= 17 quickloop
if *CD_East[count]=on or *CD_West[count]=on then BlockStatus[count]=1 else BlockStatus[count]=0
endif
count=+
endloop
