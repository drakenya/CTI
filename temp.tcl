CONSTANTS:
	MaxBlocksPlusOne=12
	MaxTurnoutsPlusOne=19


'NETWORK MODULE DECLARATIONS
'	Naming conventions:
'		Chars 1-3 	(UC): Module ID (Type and Port type) [ex. D8C Dash8 Control; TBS TrainBrain Sensor] 
'		Chars 4-5 	(NUM): Port #
'		Chars 6-8	(UP, UP, LC): Board ID (Type And #) (PB=Power Cab; BC=Block Control; TC=Turnout Control; DE=Detectors
'		Char 9	(NUM): Module position on board
'	
'''''''''''
''''''''''' Power Board "a"

SMARTCABS: SCP01PBa1, SCP01PBa2,SCP01PBa3 	'Network Modules 1-3


'''''''''''
''''''''''' Track Control board "a"

' Train Brain "1"
CONTROLS: 	TBC01BCa1, TBC02BCa1, TBC03BCa1, TBC04BCa1
SENSORS:	TBS01BCa1#, TBS02BCa1#, TBS03BCa1#, TBS04BCa1#

' Train Brain "2"
CONTROLS: 	TBC01BCa2, TBC02BCa2, TBC03BCa2, TBC04BCa2
SENSORS:	TBS01BCa2#, TBS02BCa2#, TBS03BCa2#, TBS04BCa2#

'Dash-8 "1"
CONTROLS:	D8C01BCa3, D8C02BCa3, D8C03BCa3, D8C04BCa3, D8C05BCa3, D8C06BCa3, D8C07BCa3, D8C08BCa3

'''''''''''
''''''''''' Track Control board "b"

' Train Brain "1"
CONTROLS: 	TBC01BCb1, TBC02BCb1, TBC03BCb1, TBC04BCb1
SENSORS:	TBS01BCb1#, TBS02BCb1#, TBS03BCb1#, TBS04BCb1#

' Train Brain "2"
CONTROLS: 	TBC01BCb2, TBC02BCb2, TBC03BCb2, TBC04BCb2
SENSORS:	TBS01BCb2#, TBS02BCb2#, TBS03BCb2#, TBS04BCb2#

'Dash-8 "1"
CONTROLS:	D8C01BCb3, D8C02BCb3, D8C03BCb3, D8C04BCb3, D8C05BCb3, D8C06BCb3, D8C07BCb3, D8C08BCb3

'''''''''''
''''''''''' Track Control board "c"

' Train Brain "1"
CONTROLS: 	TBC01BCc1, TBC02BCc1, TBC03BCc1, TBC04BCc1
SENSORS:	TBS01BCc1#, TBS02BCc1#, TBS03BCc1#, TBS04BCc1#

' Train Brain "2"
CONTROLS: 	TBC01BCc2, TBC02BCc2, TBC03BCc2, TBC04BCc2
SENSORS:	TBS01BCc2#, TBS02BCc2#, TBS03BCc2#, TBS04BCc2#

'Dash-8 "1"
CONTROLS:	D8C01BCc3, D8C02BCc3, D8C03BCc3, D8C04BCc3, D8C05BCc3, D8C06BCc3, D8C07BCc3, D8C08BCc3


'''''''''''
''''''''''' Turnout Control Board "a"

' YardMaster "1"
CONTROLS: 	YMC01TCa1,YMC02TCa1,YMC03TCa1,YMC04TCa1,YMC05TCa1,YMC06TCa1,YMC07TCa1,YMC08TCa1,YMC09TCa1,YMC10TCa1,YMC11TCa1,YMC12TCa1,YMC13TCa1,YMC14TCa1,YMC15TCa1,YMC16TCa1

' Sentry "1"
SENSORS:	SES01TCa2,SES02TCa2,SES03TCa2,SES04TCa2,SES05TCa2,SES06TCa2,SES07TCa2,SES08TCa2,SES09TCa2,SES10TCa2,SES11TCa2,SES12TCa2,SES13TCa2,SES14TCa2,SES15TCa2,SES16TCa2


'''''''''''
''''''''''' Turnout Control Board "b"

' YardMaster "1"
CONTROLS: 	YMC01TCb1,YMC02TCb1,YMC03TCb1,YMC04TCb1,YMC05TCb1,YMC06TCb1,YMC07TCb1,YMC08TCb1,YMC09TCb1,YMC10TCb1,YMC11TCb1,YMC12TCb1,YMC13TCb1,YMC14TCb1,YMC15TCb1,YMC16TCb1

' Sentry "1"
SENSORS:	SES01TCb2,SES02TCb2,SES03TCb2,SES04TCb2,SES05TCb2,SES06TCb2,SES07TCb2,SES08TCb2,SES09TCb2,SES10TCb2,SES11TCb2,SES12TCb2,SES13TCb2,SES14TCb2,SES15TCb2,SES16TCb2


'''''''''''
''''''''''' Detection Board "a"

' Sentry "1"
SENSORS:	SES01DTa1,SES02DTa1,SES03DTa1,SES04DTa1,SES05DTa1,SES06DTa1,SES07DTa1,SES08DTa1,SES09DTa1,SES10DTa1,SES11DTa1,SES12DTa1,SES13DTa1,SES14DTa1,SES15DTa1,SES16DTa1


'''''''''''
''''''''''' Detection Board "b"

' Sentry "1"
SENSORS:	SES01DTb1,SES02DTb1,SES03DTb1,SES04DTb1,SES05DTb1,SES06DTb1,SES07DTb1,SES08DTb1,SES09DTb1,SES10DTb1,SES11DTb1,SES12DTb1,SES13DTb1,SES14DTb1,SES15DTb1,SES16DTb1


VARIABLES: init,x,y,count

' Holds address of controls for assigning cabs to blocks
CAB_AorB[MaxBlocksPlusOne]
CAB_CorD[MaxBlocksPlusOne]
CAB_ABorCD[MaxBlocksPlusOne]

' Holds addresses of Current Detector Sensors for each block
CD_East[MaxBlocksPlusOne]
CD_West[MaxBlocksPlusOne]

BlockStatus[MaxBlocksPlusOne]

' Holds address for Tortoise Machine controls
Tortoise[MaxTurnoutsPlusOne]

' Holds address of Sensors for Manual turnout buttons
Turnout_Button[MaxTurnoutsPlusOne]

' Holds address of 3 smart cabs (cab[0] is placeholderf for manual cab
Cab[4]

''''''''''''''''''''''''''''''''''''''''''''''''''''''
				ACTIONS:
''''''''''''''''''''''''''''''''''''''''''''''''''''''

''''''''''''''''''''''''''''''INITIALIZATION

WHEN init=0 do

' set address pointers to cab selection controllers

CAB_AorB[3]=&TBC01BCa1,
CAB_AorB[4]=&TBC02BCa1,
CAB_AorB[8]=&TBC03BCa1,
CAB_AorB[10]=&TBC04BCa1,
CAB_CorD[3]=&TBC01BCa2,
CAB_CorD[4]=&TBC02BCa2,
CAB_CorD[8]=&TBC03BCa2,
CAB_CorD[10]=&TBC04BCa2,
CAB_ABorCD[3]=&D8C01BCa3,
CAB_ABorCD[4]=&D8C02BCa3,
CAB_ABorCD[8]=&D8C03BCa3,
CAB_ABorCD[10]=&D8C04BCa3,
' SPARE=&D8C05BCa3,
' SPARE=&D8C06BCa3,
' SPARE=&D8C07BCa3,
' SPARE=&D8C08BCa3,

'CAB_AorB[2]=&TBC01BCb1,
'CAB_AorB[7]=&TBC02BCb1,
'CAB_AorB[9]=&TBC03BCb1,
' SPARE CAB_AorB[xx]=&TBC04BCb1,
'CAB_CorD[2]=&TBC01BCb2,
'CAB_CorD[7]=&TBC02BCb2,
'CAB_CorD[9]=&TBC03BCb2,
' SPARE CAB_CorD[xx]=&TBC04BCb2,
'CAB_ABorCD[2]=&D8C01BCb3,
'CAB_ABorCD[7]=&D8C02BCb3,
'CAB_ABorCD[9]=&D8C03BCb3,
' SPARE CAB_ABorCD[xx]=&D8C04BCb3,
' SPARE=&D8C05BCb3,
' SPARE=&D8C06BCb3,
' SPARE=&D8C07BCb3,
' SPARE=&D8C08BCb3,

'CAB_AorB[1]=&TBC01BCc1,
'CAB_AorB[5]=&TBC02BCc1,
'CAB_AorB[9]=&TBC03BCc1,
' SPARE CAB_AorB[xx]=&TBC04BCc1,
'CAB_CorD[1]=&TBC01BCc2,
'CAB_CorD[5]=&TBC02BCc2,
'CAB_CorD[9]=&TBC03BCc2,
' SPARE CAB_CorD[xx]=&TBC04BCc2,
'CAB_ABorCD[1]=&D8C01BCc3,
'CAB_ABorCD[5]=&D8C02BCc3,
'CAB_ABorCD[9]=&D8C03BCc3,
' SPARE CAB_ABorCD[xx]=&D8C04BCc3,
' SPARE=&D8C05BCc3,
' SPARE=&D8C06BCc3,
' SPARE=&D8C07BCc3,
' SPARE=&D8C08BCc3,

' set address pointers to Current Detector Sensors

CD_East[3]=&TBS01BCa1,
CD_West[3]=&TBS02BCa1,
CD_East[4]=&TBS03BCa1,
CD_West[4]=&TBS04BCa1,
CD_East[8]=&TBS01BCa2,
CD_West[8]=&TBS02BCa2,
CD_East[10]=&TBS03BCa2,
CD_West[10]=&TBS04BCa2,

CD_East[2]=&TBS01BCb1,
CD_West[2]=&TBS02BCb1,
CD_East[7]=&TBS03BCb1,
CD_West[7]=&TBS04BCb1,
CD_East[9]=&TBS01BCb2,
CD_West[9]=&TBS02BCb2,
' SPARE CD_East[xx]=&TBS03BCb2,
' SPARE CD_West[xx]=&TBS04BCb2,

CD_East[3]=&TBS01BCc1,
CD_West[3]=&TBS02BCc1,
CD_East[4]=&TBS03BCc1,
CD_West[4]=&TBS04BCc1,
CD_East[8]=&TBS01BCc2,
CD_West[8]=&TBS02BCc2,
CD_East[10]=&TBS03BCc2,
CD_West[10]=&TBS04BCc2,

' set address pointers to Turnout_Button Controls

Tortoise[1]=&YMC01TCa1,
Tortoise[2]=&YMC02TCa1,
Tortoise[3]=&YMC03TCa1,
Tortoise[12]=&YMC04TCa1,
Tortoise[13]=&YMC05TCa1,
Tortoise[14]=&YMC06TCa1,
Tortoise[15]=&YMC07TCa1,
Tortoise[16]=&YMC08TCa1,
' SPARES YMC09TCa1,YMC10TCa1,YMC11TCa1,YMC12TCa1,YMC13TCa1,YMC14TCa1,YMC15TCa1,YMC16TCa1

Tortoise[4]=&YMC01TCb1,
Tortoise[5]=&YMC02TCb1,
Tortoise[6]=&YMC03TCb1,
Tortoise[7]=&YMC04TCb1,
Tortoise[8]=&YMC05TCb1,
Tortoise[9]=&YMC06TCb1,
Tortoise[10]=&YMC07TCb1,
Tortoise[11]=&YMC08TCb1,
Tortoise[17]=&YMC09TCb1,
Tortoise[18]=&YMC10TCb1,
' SPARES YMC11TCb1,YMC12TCb1,YMC13TCb1,YMC14TCb1,YMC15TCb1,YMC16TCb1

' set address pointers to Turnout Push Button Sensors

Turnout_Button[1]=&SES01TCa2,
Turnout_Button[2]=&SES02TCa2,
Turnout_Button[3]=&SES03TCa2,
Turnout_Button[12]=&SES04TCa2,
Turnout_Button[13]=&SES05TCa2,
Turnout_Button[14]=&SES06TCa2,
Turnout_Button[15]=&SES07TCa2,
Turnout_Button[16]=&SES08TCa2,
' SPARES SES09TCa2,SES10TCa2,SES11TCa2,SES12TCa2,SES13TCa2,SES14TCa2,SES15TCa2,SES16TCa2

Turnout_Button[4]=&SES01TCb2,
Turnout_Button[5]=&SES02TCb2,
Turnout_Button[6]=&SES03TCb2,
Turnout_Button[7]=&SES04TCb2,
Turnout_Button[8]=&SES05TCb2,
Turnout_Button[9]=&SES06TCb2,
Turnout_Button[10]=&SES07TCb2,
Turnout_Button[11]=&SES08TCb2,
Turnout_Button[17]=&SES09TCb2,
Turnout_Button[18]=&SES10TCb2,
' SPARES SES11TCb2,SES12TCb2,SES13TCb2,SES14TCb2,SES15TCb2,SES16TCb2


init=3

always do
count=1
until count= 17 quickloop
if *CD_East[count]=on or *CD_West[count]=on then BlockStatus[count]=1 else BlockStatus[count]=0
endif
count=+
endloop
