CONSTANTS:
	Maxblocks=11		'* Max number of blocks for lLOOPs, etc
	MaxBlocksPlusOne=12
	MaxTurnouts=18
	MaxTurnoutsPlusOne=19


'NETWORK MODULE DECLARATIONS
'	Naming conventions:
'		Chars 1-3 	(UC): Module ID (Type and Port type) [ex. D8C Dash8 Control; TBS TrainBrain Sensor] 
'		Chars 4-5 	(NUM): Port #
'		Chars 6-8	(UP, UP, LC): Board ID (Type And #) (PB=Power Cab; BC=Block Control; TC=Turnout Control; DE=Detectors
'		Char 9	(NUM): Module position on board
'	
'''''''''''
''''''''''' Turnout Control Board "a"

' YardMaster "1"
'CONTROLS: 	YMC01TCa1,YMC02TCa1,YMC03TCa1,YMC04TCa1,YMC05TCa1,YMC06TCa1,YMC07TCa1,YMC08TCa1,YMC09TCa1,YMC10TCa1,YMC11TCa1,YMC12TCa1,YMC13TCa1,YMC14TCa1,YMC15TCa1,YMC16TCa1

' Sentry "1"
'SENSORS:	SES01TCa2,SES02TCa2,SES03TCa2,SES04TCa2,SES05TCa2,SES06TCa2,SES07TCa2,SES08TCa2,SES09TCa2,SES10TCa2,SES11TCa2,SES12TCa2,SES13TCa2,SES14TCa2,SES15TCa2,SES16TCa2


'''''''''''
''''''''''' Turnout Control Board "b"

' YardMaster "1"
'CONTROLS: 	YMC01TCb1,YMC02TCb1,YMC03TCb1,YMC04TCb1,YMC05TCb1,YMC06TCb1,YMC07TCb1,YMC08TCb1,YMC09TCb1,YMC10TCb1,YMC11TCb1,YMC12TCb1,YMC13TCb1,YMC14TCb1,YMC15TCb1,YMC16TCb1

' Sentry "1"
'SENSORS:	SES01TCb2,SES02TCb2,SES03TCb2,SES04TCb2,SES05TCb2,SES06TCb2,SES07TCb2,SES08TCb2,SES09TCb2,SES10TCb2,SES11TCb2,SES12TCb2,SES13TCb2,SES14TCb2,SES15TCb2,SES16TCb2













CONTROLS:	
		CabOuterAorB[16]	'2 dash8 modules
		CabInnerAorB[16]	'2 dash8 modules
'		CabOuterABorC[12]	'1 dash8 module & 1 train brain module
		CabOuterABorC[8]	'1 dash8 module & 1 train brain module-TRAIN BRAIN MODULE IN REPAIR
'		CabInnerABorC[12]	'3 train brain modules 
		CabInnerABorC[4]	'3 train brain modules - preliminary using only 4 in 1 module - will be 12

SENSORS: 	'IRD_East[12],spare,spare,IR_EOT_Detector[2]~ 'Track Block Infra Red Detectors, one at each end of block - 1 sentry module
		'IRD_West[12],spare,spare,spare,Panic	'Track Blook Infra Red Detectors, one at each end of block - 1 sentry module
		Occupy0E#,Occupy0W#,Occupy1E#,Occupy1W#		' Sensors for Current Detectors - 1 train brain
		Occupy2E,Occupy2W,Occupy3E,Occupy3W		' Sensors for Current Detectors - 1/2 Watchman
		Occupy4E,Occupy4W,Occupy5E,Occupy5W		' Sensors for Current Detectors - 1/2 Watchman
		Occupy6E,Occupy6W,Occupy7E,Occupy7W		' Sensors for Current Detectors - 1 train brain
		Occupy8E,Occupy8W,Occupy9E,Occupy9W		' Sensors for Current Detectors - 1 train brain
		Occupy10E,Occupy10W,Occupy11E,Occupy11W	' Sensors for Current Detectors - 1 train brain
'		OccupyEast[12]	'UNUSED ARRay 3 train brain module module
'		OccupyWest[12]  	'UNUSED ARRAY 3 train brain modules

SMARTCABS:	Cab[3]
		
CONSTANTS:	mygray=$RGB_DFDFDF	'* Color for unselected speed buttons
		normal=off			'* Normal (green)  position of turnout
		Diverting=on		'* Diverting (red) position of turnout
		Occupied=true		'* For block occupancy
		Vacant=false		'* For block occupancy
		MaxBlocksLessOne=3
			'*
		
		
			'*


VARIABLES:	

	' Holds address for Tortoise Machine controls
		Tortoise[MaxTurnoutsPlusOne]

	' Holds address of Sensors for Manual turnout buttons
		Turnout_Button[MaxTurnoutsPlusOne]





		blocknum
		count
		initialize
		index
		Block_Color
		TurnoutIndex
		cabnum
		CabIndex
		traincount
		tempcabnum
		blocktemp
		BlockIndex
		SpeedIndex
		OccupancyIndex
		IR_Detector_Index	'LOOP counter for checking IR detectors status 
		CurrentSensorIndex 	'LOOP counter for checking current sensors status
		QueryIndex
		CabAssignIndex
		Tortoise_Status[MaxturnoutsPlusOne]	'holds status of each turnout
		Mouse_Status
		Block_Status[MaxBlocksPlusOne]
temp


	'* Define Grid coordinates for panel display
		Turnout_Grid[MaxTurnoutsPlusOne]
		IR_Detector_Grid_E[12]
		IR_Detector_Grid_W[12]
		IR_EOT_Detector_Grid[2]
		Cab0_Speed_Grid[11]
		Cab1_Speed_Grid[11]
		Cab2_Speed_Grid[11]
		Cab_Brake_Grid[4]
		Cab_F_W_Indication_Grid[4]		
		Cab_Direction_Grid[4]		
		Block_Grid[12]

	'* Define Colors & Shapes for panel display
		Cab_Color[4]
		Block_Color[12]
		Train_E_Sprite[12]
		Train_W_Sprite[12]
		IR_Detector_Shape_E[12]
		IR_Detector_Shape_W[12]
		IR_EOT_Detector_Shape[2]

		Block_Cab[12]		'* holds cab assignment for each block
		Speed_Notch[11]		'* holds throttle speeds for each step
		Cab_Speed[4]		'* holds speed for each cab
		Cab_Direction[4]		'* holds direction for each cab

		OccupyEast[maxblocksplusone]		'* holds status of current sensors
		OccupyWest[maxblocksplusone]		'* holds status of current sensors

		
'******************************************************************************************

ACTIONS:

'*****************************Sub Routines *************************

'******** 	Throw Tortoise Switch and corresponding display on panel

SUB Throw_Switch(TurnOutNum,onoff,ctc_Grid)
	$Switch(ctc_Grid)=onoff
	*tortoise[TurnoutNum]=onoff
ENDSUB

SUB Throw_Tortoise(TurnOutNum,ctc_Grid)
	$Switch(ctc_Grid)=$Switch(ctc_Grid)~
	*tortoise[TurnoutNum]=*
tortoise[TurnoutNum]~
ENDSUB

'******** 	Assign Cab to designated block
'***			Trigger corresponding block controls
'***			Assign Cab and corresponding color on displays

		
SUB Cab_To_Block(blocknum,cabnum)
	IF cabnum>2 then  RETURN

	ELSEIF cabnum=0 then
	CabOuterAorB[blocknum]=off
	CabInnerAorB[blocknum]=off
	CabOuterABorC[blocknum]=off
	CabInnerABorC[blocknum]=off
	
	ELSEIF cabnum=1 then
	CabOuterAorB[blocknum]=on
	CabInnerAorB[blocknum]=on
	CabOuterABorC[blocknum]=off
	CabInnerABorC[blocknum]=off
	
	ELSEIF cabnum=2 then
	CabOuterAorB[blocknum]=off
	CabInnerAorB[blocknum]=off
	CabOuterABorC[blocknum]=on
	CabInnerABorC[blocknum]=on

	ENDIF
	
ENDSUB


'******** 	Indicate change on panel in occupancy of designated block

SUB Block_occupancy_on(block_Grid,block_color,sprite_shape)
	$Color Block (block_Grid) = block_color
	$Draw Sprite (block_Grid) = sprite_shape in Block_Color
'	$Color Block (block_Grid) = pulse 0.1
	
	
ENDSUB


SUB Block_occupancy_off(block_Grid,Block_Color)
	$Color Block (block_Grid) = black
	$Draw Sprite (block_Grid) = Lock in Block_Color
ENDSUB

'*********************************************************

'******** Store Current Sensors Status in East and West Arrays

ALWAYS DO	' Reassign Current Sensors to Variable Array
	OccupyEast[0]=Occupy0E,
	OccupyWest[0]=Occupy0W,
	OccupyEast[1]=Occupy1E,
	OccupyWest[1]=Occupy1W,
	OccupyEast[2]=Occupy2E,
	OccupyWest[2]=Occupy2W,
	OccupyEast[3]=Occupy3E,
	OccupyWest[3]=Occupy3W,
	OccupyEast[4]=Occupy4E,
	OccupyWest[4]=Occupy4W,
	OccupyEast[5]=Occupy5E,
	OccupyWest[5]=Occupy5W,
	OccupyEast[6]=Occupy6E,
	OccupyWest[6]=Occupy6W,
	OccupyEast[7]=Occupy7E,
	OccupyWest[7]=Occupy7W,
	OccupyEast[8]=Occupy8E,
	OccupyWest[8]=Occupy8W,
	OccupyEast[9]=Occupy9E,
	OccupyWest[9]=Occupy9W,
	OccupyEast[10]=Occupy10E,
	OccupyWest[10]=Occupy10W,
	OccupyEast[11]=Occupy11E,
	OccupyWest[11]=Occupy11W


'**************************** Initialization ***********************

WHEN initialize=0 DO

' set address pointers to Turnout_Button Controls

'Tortoise[1]=&YMC01TCa1,
'Tortoise[2]=&YMC02TCa1,
'Tortoise[3]=&YMC03TCa1,
'Tortoise[4]=&YMC04TCa1,
'Tortoise[5]=&YMC05TCa1,
'Tortoise[6]=&YMC06TCa1,
'Tortoise[12]=&YMC07TCa1,
'Tortoise[13]=&YMC08TCa1,
'Tortoise[17]=&YMC09TCa1,
'Tortoise[18]=&YMC10TCa1,
' SPARES YMC11TCa1,YMC12TCa1,YMC13TCa1,YMC14TCa1,YMC15TCa1,YMC16TCa1

'Tortoise[7]=&YMC01TCb1,
'Tortoise[8]=&YMC02TCb1,
'Tortoise[9]=&YMC03TCb1,
'Tortoise[10]=&YMC04TCb1,
'Tortoise[11]=&YMC05TCb1,
'Tortoise[14]=&YMC06TCb1,
'Tortoise[15]=&YMC07TCb1,
'Tortoise[16]=&YMC08TCb1,
' SPARES YMC09TCb1,YMC10TCb1,YMC11TCb1,YMC12TCb1,YMC13TCb1,YMC14TCb1,YMC15TCb1,YMC16TCb1

' set address pointers to Turnout Push Button Sensors

'Turnout_Button[1]=&SES01TCa2,
'Turnout_Button[2]=&SES02TCa2,
'Turnout_Button[3]=&SES03TCa2,
'Turnout_Button[4]=&SES04TCa2,
'Turnout_Button[5]=&SES05TCa2,
'Turnout_Button[6]=&SES06TCa2,
'Turnout_Button[12]=&SES07TCa2,
'Turnout_Button[13]=&SES08TCa2,
'Turnout_Button[17]=&SES09TCa2,
'Turnout_Button[18]=&SES10TCa2,' SPARES SES11TCa2,SES12TCa2,SES13TCa2,SES14TCa2,SES15TCa2,SES16TCa2

'Turnout_Button[7]=&SES01TCb2,
'Turnout_Button[8]=&SES02TCb2,
'Turnout_Button[9]=&SES03TCb2,
'Turnout_Button[10]=&SES04TCb2,
'Turnout_Button[11]=&SES05TCb2,
'Turnout_Button[14]=&SES06TCb2,
'Turnout_Button[15]=&SES07TCb2,
'Turnout_Button[16]=&SES08TCb2,
' SPARES SES09TCb2,SES10TCb2,SES11TCb2,SES12TCb2,SES13TCb2,SES14TCb2,SES15TCb2,SES16TCb2




'**	Initialize panel locations of IR Block Detectors - one at each end of block		

	'IR_Detector_Grid_E[0]=(24,29,4),
	IR_Detector_Grid_E[1]=(46,14,4),
	IR_Detector_Grid_E[2]=(27,26,4),
	IR_Detector_Grid_E[3]=(7,18,4),
	IR_Detector_Grid_E[4]=(24,2,4),
	IR_Detector_Grid_E[5]=(50,17,4),
	IR_Detector_Grid_E[6]=(24,29,4),
	IR_Detector_Grid_E[7]=(4,18,4),
	IR_Detector_Grid_E[8]=(37,6,4),
	IR_Detector_Grid_E[9]=(45,14,4),
	IR_Detector_Grid_E[10]=(8,19,4),
	IR_Detector_Grid_E[11]=(5,18,4),
	'IR_Detector_Grid_E[12]=

	'IR_Detector_Grid_W[0]=(4,23,4),
	IR_Detector_Grid_W[1]=(33,26,4),
	IR_Detector_Grid_W[2]=(7,22,4),
	IR_Detector_Grid_W[3]=(21,2,4),
	IR_Detector_Grid_W[4]=(50,13,4),
	IR_Detector_Grid_W[5]=(27,29,4),
	IR_Detector_Grid_W[6]=(4,23,4),
	IR_Detector_Grid_W[7]=(30,6,4),
	IR_Detector_Grid_W[8]=(46,10,4),
	IR_Detector_Grid_W[9]=(34,24,4),
	IR_Detector_Grid_W[10]=(21,3,4),
	IR_Detector_Grid_W[11]=(32,7,4),
	'IR_Detector_Grid_W[12]=

	IR_EOT_Detector_Grid[0]=(16,5,4),
	IR_EOT_Detector_Grid[1]=(16,4,4),



'**	Initialize panel locations of tortoise controls - left click for normal route, right for diverging

	Turnout_Grid[1]=(46,11,4),
	Turnout_Grid[2]=(46,16,4),
	Turnout_Grid[3]=(45,20,4),
	Turnout_Grid[4]=(44,13,4),
	Turnout_Grid[5]=(29,26,4),
	Turnout_Grid[6]=(33,24,4),
	Turnout_Grid[7]=(7,21,4),
	Turnout_Grid[8]=(8,18,4),
	Turnout_Grid[9]=(7,11,4),
	Turnout_Grid[10]=(23,2,4),
	Turnout_Grid[11]=(20,2,4),
	Turnout_Grid[12]=(50,16,4),
	Turnout_Grid[13]=(50,20,4),
	Turnout_Grid[14]=(4,22,4),
	Turnout_Grid[15]=(5,19,4),
	Turnout_Grid[16]=(9,12,4),
	Turnout_Grid[17]=(32,6,4),
	Turnout_Grid[18]=(35,6,4),

'**	Initialize panel location of track blocks and sprite locations of corresponding sprites

	Block_Grid[0]=(1,1,4),
	Block_Grid[1]=(42,26,4),
	Block_Grid[2]=(15,26,4),
	Block_Grid[3]=(7,4,4),
	Block_Grid[4]=(38,2,4),
	Block_Grid[5]=(42,29,4),
	Block_Grid[6]=(15,29,4),
	Block_Grid[7]=(13,6,4),
	Block_Grid[8]=(42,6,4),
	Block_Grid[9]=(42,24,4),
	Block_Grid[10]=(8,5,4),
	Block_Grid[11]=(13,7,4),

'**	Initialize sprite shapes to overlay on assign cab pushbuttons

	Train_E_Sprite[0]=Loco_north,
	Train_W_Sprite[0]=Loco_south,
	Train_E_Sprite[1]=Loco_west,
	Train_W_Sprite[1]=Loco_east,
	Train_E_Sprite[2]=Loco_west,
	Train_W_Sprite[2]=Loco_east,
	Train_E_Sprite[3]=Loco_north,
	Train_W_Sprite[3]=Loco_south,
	Train_E_Sprite[4]=Loco_east,
	Train_W_Sprite[4]=Loco_west,
	Train_E_Sprite[5]=Loco_west,
	Train_W_Sprite[5]=Loco_east,
	Train_E_Sprite[6]=Loco_west,
	Train_W_Sprite[6]=Loco_east,
	Train_E_Sprite[7]=Arrow_East,
	Train_W_Sprite[7]=Loco_west,
	Train_E_Sprite[8]=Loco_east,
	Train_W_Sprite[8]=Loco_west,
	Train_E_Sprite[9]=Loco_west,
	Train_W_Sprite[9]=Loco_east,
	Train_E_Sprite[10]=Loco_north,
	Train_W_Sprite[10]=Loco_south,
	Train_E_Sprite[11]=Loco_east,
	Train_W_Sprite[11]=Loco_west,

'**	Initialize sprite shapes of IR Block Detectors - one at each end of block		

	IR_Detector_Shape_E[0]=Train_West,
	IR_Detector_Shape_E[1]=Train_South,
	IR_Detector_Shape_E[2]=Train_West,
	IR_Detector_Shape_E[3]=Train_North,
	IR_Detector_Shape_E[4]=Train_East,
	IR_Detector_Shape_E[5]=Train_South,
	IR_Detector_Shape_E[6]=Train_West,
	IR_Detector_Shape_E[7]=Train_North,
	IR_Detector_Shape_E[8]=Train_East,
	IR_Detector_Shape_E[9]=Train_South,
	IR_Detector_Shape_E[10]=Train_North,
	IR_Detector_Shape_E[11]=Train_North,

	IR_Detector_Shape_W[0]=Train_North,
	IR_Detector_Shape_W[1]=Train_West,
	IR_Detector_Shape_W[2]=Train_North,
	IR_Detector_Shape_W[3]=Train_East,
	IR_Detector_Shape_W[4]=Train_South,
	IR_Detector_Shape_W[5]=Train_West,
	IR_Detector_Shape_W[6]=Train_North,
	IR_Detector_Shape_W[7]=Train_East,
	IR_Detector_Shape_W[8]=Train_South,
	IR_Detector_Shape_W[9]=Train_West,
	IR_Detector_Shape_W[10]=Train_East,
	IR_Detector_Shape_W[11]=Train_East,

	IR_EOT_Detector_Shape[0]=Train_East,
	IR_EOT_Detector_Shape[1]=Train_East,


'**	Initialize colors to indiate cab assignments on blocks and sprites

	Cab_Color[0]=$RGB_FF0000,
	Cab_Color[1]=$RGB_2492FF,
	Cab_Color[2]=$RGB_008000,
	Cab_Color[3]=$RGB_005EBB,

'**	Initialize Cab Speed Pushbutton locations

	Cab0_Speed_Grid[10]=(56,4,4),
	Cab0_Speed_Grid[9]=(56,5,4),
	Cab0_Speed_Grid[8]=(56,6,4),
	Cab0_Speed_Grid[7]=(56,7,4),
	Cab0_Speed_Grid[6]=(56,8,4),
	Cab0_Speed_Grid[5]=(56,9,4),
	Cab0_Speed_Grid[4]=(56,10,4),
	Cab0_Speed_Grid[3]=(56,11,4),
	Cab0_Speed_Grid[2]=(56,12,4),
	Cab0_Speed_Grid[1]=(56,13,4),
	Cab0_Speed_Grid[0]=(56,14,4),
	Cab_Brake_Grid[0]=(56,16,4),	
	Cab_F_W_Indication_Grid[0]=(56,18,4),
	Cab_Direction_Grid[0]=(56,18,4),

	Cab1_Speed_Grid[10]=(58,4,4),
	Cab1_Speed_Grid[9]=(58,5,4),
	Cab1_Speed_Grid[8]=(58,6,4),
	Cab1_Speed_Grid[7]=(58,7,4),
	Cab1_Speed_Grid[6]=(58,8,4),
	Cab1_Speed_Grid[5]=(58,9,4),
	Cab1_Speed_Grid[4]=(58,10,4),
	Cab1_Speed_Grid[3]=(58,11,4),
	Cab1_Speed_Grid[2]=(58,12,4),
	Cab1_Speed_Grid[1]=(58,13,4),
	Cab1_Speed_Grid[0]=(58,14,4),
	Cab_Brake_Grid[1]=(58,16,4),	
	Cab_F_W_Indication_Grid[1]=(58,18,4),
	Cab_Direction_Grid[1]=(58,18,4),	

	Cab2_Speed_Grid[10]=(60,4,4),
	Cab2_Speed_Grid[9]=(60,5,4),
	Cab2_Speed_Grid[8]=(60,6,4),
	Cab2_Speed_Grid[7]=(60,7,4),
	Cab2_Speed_Grid[6]=(60,8,4),
	Cab2_Speed_Grid[5]=(60,9,4),
	Cab2_Speed_Grid[4]=(60,10,4),
	Cab2_Speed_Grid[3]=(60,11,4),
	Cab2_Speed_Grid[2]=(60,12,4),
	Cab2_Speed_Grid[1]=(60,13,4),
	Cab2_Speed_Grid[0]=(60,14,4),
	Cab_Brake_Grid[2]=(60,16,4),	
	Cab_F_W_Indication_Grid[2]=(60,18,4),
	Cab_Direction_Grid[2]=(60,18,4),

'**	Initialize Cab Speed Button Values in increments of 6

speedindex=0,
speed_Notch[speedindex]=0,

UNTIL speedindex=11 QUICKLOOP,
	index=0,
		UNTIL index=speedindex QUICKLOOP,
		speed_Notch[speedindex]=6+,
		index=+,
		ENDLOOP,
	speedindex=+,
ENDLOOP,

'**	Initialize all defined turnouts to normal position except those designated with option query

'$QUERY "2$Click on any blocks containing trains$0$1$2$3$4$5$6$7$8$9", 
'	WAIT UNTIL $QueryBusy = False Then ,
'	QueryIndex = 0 ,
'	UNTIL QueryIndex = MaxTurnouts LOOP ,
'		Throw_Switch(Queryindex,$queryBit[queryindex],Turnout_Grid[queryindex]), 
'		QueryIndex = + ,
'	ENDLOOP, 

'**	Initialize all undefined turnouts to normal position

Index=1,
UNTIL index= MaxTurnoutsPlusOne QUICKLOOP,
	Throw_Switch(index,normal,Turnout_Grid[index])
	Index=+,
ENDLOOP,

'**	Initial cab speed and direction so occupancy will be detected at startup

Index=0,
UNTIL index= 3 QUICKLOOP,
	Cab[index].speed = 0,
	Cab[index].direction=forward,
	Cab[index].brake=on,
	Index=+,
ENDLOOP,

'**	Initialize cab speed and direction display on panel

	cab[0].speed=speed_notch[0],
	index=10,
	UNTIL index<0 QUICKLOOP,
		$color Track(cab0_Speed_Grid[index])=mygray,
		index=-,
	ENDLOOP,

	cab[1].speed=speed_notch[0],
	index=10,
	UNTIL index<0 QUICKLOOP,
		$color Track(cab1_Speed_Grid[index])=mygray,
		index=-,
	ENDLOOP,

	cab[2].speed=speed_notch[0],
	index=10,
	UNTIL index<0 QUICKLOOP,
		$color Track(cab2_Speed_Grid[index])=mygray,
		index=-,
	ENDLOOP,

	index=0,
	UNTIL index>2 QUICKLOOP,
		$Color Track(cab_Brake_Grid[index])=red,
		$Draw Sprite(cab_F_W_Indication_grid[index])=Arrow_North in Green,
		index=+,
	ENDLOOP,		


'**	delay for cabs to be initialized

wait 2,



'**	Initialize all blocks to Cab[0]

Blockindex=1,
UNTIL blockindex=MaxblocksPlusOne QUICKLOOP,
	Block_Cab[blockindex]=0,
	Cab_To_Block(blockindex,0),	'no need to set relays as default is all NC
	$Color Sprite(Block_Grid[blockindex])=Cab_Color[0],
	blockindex=+,
ENDLOOP,	

'**	Detect occupancy at each block
'**		Assign cab to corresponding block, then call subroutine
'**		Indicate cab assignment on panel by assigning cab color to block - call subroutine
'**		Color occupied block track with cab color and draw occupied sprite - Call subroutine for this
'**		IF block is not occupied, designate cab #0 to block

traincount=0,
cabindex=0,
blockindex=1,
'wait 2,
UNTIL blockindex=MaxblocksPlusOne QUICKLOOP,
	IF OccupyEast[blockindex]=on then,
	Block_Cab[blockindex]=cabindex,
		Block_Color[blockindex]=cab_color[cabindex],
		Cab_To_Block(blockindex,cabindex),'
		block_occupancy_on (block_Grid[blockindex], Block_Color[blockindex], Train_E_Sprite[blockindex]),
		traincount=+,
		cabindex=+,
	ELSE Block_Cab[blockindex]=0,
	ENDIF,
blockindex=+,
ENDLOOP,	


Initialize=1

'***************************************************** END OF INITIALIZATION ***********************************************


'*************************** Actions **********************************


'** 	Detect activation of Panic button
'**		If set, stop all trains and reset panel indicators


'	while Panic=true DO
'		$Emergency=true,
'		Cab[0].brake=on,
'		Cab[1].brake=on,
'		Cab[2].brake=on,
'		cab[0].speed=speed_notch[0],
'			index=10,
'			UNTIL index<0 QUICKLOOP,
'				$color Track(cab0_Speed_Grid[index])=mygray,
'				index=-,
'			ENDLOOP,
'
'			cab[1].speed=speed_notch[0],
'			index=10,
'			UNTIL index<0 QUICKLOOP,
'				$color Track(cab1_Speed_Grid[index])=mygray,
'				index=-,
'			ENDLOOP,
'
'			cab[2].speed=speed_notch[0],
'			index=10,
'			UNTIL index<0 QUICKLOOP,
'				$color Track(cab2_Speed_Grid[index])=mygray,
'				index=-,
'			ENDLOOP,	
'
'		index=0,
'			UNTIL index>2 QUICKLOOP,
'				$Color Track(cab_Brake_Grid[index])=red,
'				$Draw Sprite(cab_F_W_Indication_grid[index])=Arrow_North in Green,
'				index=+,
'			ENDLOOP	
'
'		when Panic=false do
'			$emergency=false
		


'** 	Detect activation of pushbuttons for cab speed
'**		In all cases, assigns cab to block and calls Subtroutine


	WHEN $leftmouse=cab0_Speed_Grid[0] DO		
		cab[0].speed=speed_notch[0],	
		index=10,	
		UNTIL index<0 QUICKLOOP,	
			$color Track(cab0_Speed_Grid[index])=mygray,
			index=-,
		ENDLOOP,	
			
		index=1,	
		UNTIL index=1 QUICKLOOP,	
			$color Track(cab0_Speed_Grid[index])=cab_color[0],
			index=+,
		ENDLOOP
				
	WHEN $leftmouse=cab0_Speed_Grid[1] DO			
		cab[0].speed=speed_notch[1],		
		index=10,		
		UNTIL index=1 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=2 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab0_Speed_Grid[2] DO			
		cab[0].speed=speed_notch[2],		
		index=10,		
		UNTIL index=2 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=3 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab0_Speed_Grid[3] DO			
		cab[0].speed=speed_notch[3],		
		index=10,		
		UNTIL index=3 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=4 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab0_Speed_Grid[4] DO			
		cab[0].speed=speed_notch[4],		
		index=10,		
		UNTIL index=4 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=5 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab0_Speed_Grid[5] DO			
		cab[0].speed=speed_notch[5],		
		index=10,		
		UNTIL index=5 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=6 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab0_Speed_Grid[6] DO			
		cab[0].speed=speed_notch[6],		
		index=10,		
		UNTIL index=6 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=7 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab0_Speed_Grid[7] DO			
		cab[0].speed=speed_notch[7],		
		index=10,		
		UNTIL index=7 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=8 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab0_Speed_Grid[8] DO			
		cab[0].speed=speed_notch[8],		
		index=10,		
		UNTIL index=8 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=9 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab0_Speed_Grid[9] DO			
		cab[0].speed=speed_notch[9],		
		index=10,		
		UNTIL index=9 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=10 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab0_Speed_Grid[10] DO			
		cab[0].speed=speed_notch[10],		
		index=10,		
		UNTIL index=10 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=11 QUICKLOOP,		
			$color Track(cab0_Speed_Grid[index])=cab_color[0],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab1_Speed_Grid[0] DO			
		cab[1].speed=speed_notch[0],		
		index=10,		
		UNTIL index<0 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=1,		
		UNTIL index=1 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab1_Speed_Grid[1] DO			
		cab[1].speed=speed_notch[1],		
		index=10,		
		UNTIL index=1 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=2 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[2] DO			
		cab[1].speed=speed_notch[2],		
		index=10,		
		UNTIL index=2 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=3 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab1_Speed_Grid[3] DO			
		cab[1].speed=speed_notch[3],		
		index=10,		
		UNTIL index=3 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=4 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[4] DO			
		cab[1].speed=speed_notch[4],		
		index=10,		
		UNTIL index=4 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=5 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[5] DO			
		cab[1].speed=speed_notch[5],		
		index=10,		
		UNTIL index=5 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=6 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[6] DO			
		cab[1].speed=speed_notch[6],		
		index=10,		
		UNTIL index=6 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=7 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[7] DO			
		cab[1].speed=speed_notch[7],		
		index=10,		
		UNTIL index=7 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=8 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[8] DO			
		cab[1].speed=speed_notch[8],		
		index=10,		
		UNTIL index=8 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=9 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[9] DO			
		cab[1].speed=speed_notch[9],		
		index=10,		
		UNTIL index=9 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=10 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab1_Speed_Grid[10] DO			
		cab[1].speed=speed_notch[10],		
		index=10,		
		UNTIL index=10 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=11 QUICKLOOP,		
			$color Track(cab1_Speed_Grid[index])=cab_color[1],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab2_Speed_Grid[0] DO			
		cab[2].speed=speed_notch[0],		
		index=10,		
		UNTIL index<0 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=1,		
		UNTIL index=1 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab2_Speed_Grid[1] DO			
		cab[2].speed=speed_notch[1],		
		index=10,		
		UNTIL index=1 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=2 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab2_Speed_Grid[2] DO			
		cab[2].speed=speed_notch[2],		
		index=10,		
		UNTIL index=2 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=3 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab2_Speed_Grid[3] DO			
		cab[2].speed=speed_notch[3],		
		index=10,		
		UNTIL index=3 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=4 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab2_Speed_Grid[4] DO			
		cab[2].speed=speed_notch[4],		
		index=10,		
		UNTIL index=4 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=5 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab2_Speed_Grid[5] DO			
		cab[2].speed=speed_notch[5],		
		index=10,		
		UNTIL index=5 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=6 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
				
	WHEN $leftmouse=cab2_Speed_Grid[6] DO			
		cab[2].speed=speed_notch[6],		
		index=10,		
		UNTIL index=6 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=7 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab2_Speed_Grid[7] DO			
		cab[2].speed=speed_notch[7],		
		index=10,		
		UNTIL index=7 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=8 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab2_Speed_Grid[8] DO			
		cab[2].speed=speed_notch[8],		
		index=10,		
		UNTIL index=8 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=9 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab2_Speed_Grid[9] DO			
		cab[2].speed=speed_notch[9],		
		index=10,		
		UNTIL index=9 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=10 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
	WHEN $leftmouse=cab2_Speed_Grid[10] DO			
		cab[2].speed=speed_notch[10],		
		index=10,		
		UNTIL index=10 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=mygray,	
			index=-,	
		ENDLOOP,		
				
		index=0,		
		UNTIL index=11 QUICKLOOP,		
			$color Track(cab2_Speed_Grid[index])=cab_color[2],	
			index=+,	
		ENDLOOP		
				
				
'********************************************************************			
'** 	Detect activation of pushbuttons for cab brake		
'**						
				
	WHEN $leftmouse=cab_Brake_Grid[0] DO			
		cab[0].brake=cab[0].brake~,		
		IF cab[0].brake=on then,		
			$Color Track(Cab_Brake_Grid[0])=red,	
		ELSE,		
			$Color Track(Cab_Brake_Grid[0])=Black,	
				
		ENDIF		
				
	WHEN $leftmouse=cab_Brake_Grid[1] DO			
		cab[1].brake=cab[1].brake~,		
		IF cab[1].brake=on then,		
			$Color Track(Cab_Brake_Grid[1])=red,	
		ELSE,		
			$Color Track(Cab_Brake_Grid[1])=Black,	
				
		ENDIF		
				
	WHEN $leftmouse=cab_Brake_Grid[2] DO			
		cab[2].brake=cab[2].brake~,		
		IF cab[2].brake=on then,		
			$Color Track(Cab_Brake_Grid[2])=red,	
		ELSE,		
			$Color Track(Cab_Brake_Grid[2])=Black,	
				
		ENDIF		
				
	
'********************************************************************			
'** 	Detect activation of pushbuttons for cab direction		
'**					
				
	WHEN $leftmouse=cab_Direction_Grid[0] DO			
		cab[0].direction=cab[0].direction~,		
		IF cab[0].direction=Reverse then,		
			$Draw Sprite(Cab_F_W_Indication_Grid[0])=Arrow_South in Red,	
		ELSE,		
			$Draw Sprite(Cab_F_W_Indication_Grid[0])=Arrow_North in Green,	
				
		ENDIF		
				
	WHEN $leftmouse=cab_Direction_Grid[1] DO			
		cab[1].direction=cab[1].direction~,		
		IF cab[1].direction=Reverse then,		
			$Draw Sprite(Cab_F_W_Indication_Grid[1])=Arrow_South in Red,	
		ELSE,		
			$Draw Sprite(Cab_F_W_Indication_Grid[1])=Arrow_North in Green,	
				
		ENDIF		
				
	WHEN $leftmouse=cab_Direction_Grid[2] DO			
		cab[2].direction=cab[2].direction~,		
		IF cab[2].direction=Reverse then,		
			$Draw Sprite(Cab_F_W_Indication_Grid[2])=Arrow_South in Red,	
		ELSE,		
			$Draw Sprite(Cab_F_W_Indication_Grid[2])=Arrow_North in Green,	
				
		ENDIF		
				
				
'*****************************************************************************			
'** Check all blocks for user change of cab assignments
			
	WHEN $Leftmouse=Block_Grid[CabAssignIndex] DO			
		Mouse_Status=$LeftMouse	
		Block_Cab[CabAssignIndex]=+,		
		IF Block_Cab[CabAssignIndex]>3 then, 		
			Block_Cab[CabAssignIndex]=0,	
		ELSE blocktemp=Block_Cab[CabAssignIndex],		
		ENDIF,		
		blocktemp=Block_Cab[CabAssignIndex],		
			block_color[CabAssignIndex]=Cab_Color[blocktemp],	
			Cab_To_Block(CabAssignIndex,blocktemp),	
			$Color Sprite(Block_Grid[CabAssignIndex])=block_color[CabAssignIndex]	
		Wait until Mouse_Status<> $LeftMouse Then	'Wait until mouse is released	

 	ALWAYS DO
		IF CabAssignIndex<MaxBlocks then CabAssignIndex=+ 
		ELSE CabAssignIndex=0
		ENDIF				
		
				
''*************************************			
				
'**	Detect activation of turnouts on panel or Turnout Micro Switches		
'**		Call subroutine	
'**			Left click changes tortoise direction, indicating diverging route with red on panel, main route with green		
		
	WHEN $Leftmouse=Turnout_Grid[TurnoutIndex] DO  
	Mouse_Status=$LeftMouse	
		Throw_Tortoise(TurnoutIndex,Turnout_Grid[TurnoutIndex])
		Tortoise_Status[TurnoutIndex]=Tortoise[TurnoutIndex]
	Wait until Mouse_Status<> $LeftMouse Then	'Wait until mouse is released


 	ALWAYS DO

		IF TurnoutIndex<MaxTurnouts then TurnoutIndex=+ 
		ELSE TurnoutIndex=0
		ENDIF				


'*******************************
'**	LOOP through East and West current detectors to determine block occupancy

	IF OccupyEast[OccupancyIndex]=occupied  THEN
		block_occupancy_on (block_Grid[OccupancyIndex], 
		Block_Color[OccupancyIndex], 
		Train_E_Sprite[OccupancyIndex])
	ELSEif OccupyWest[OccupancyIndex]=occupied THEN
		block_occupancy_on (block_Grid[OccupancyIndex], 
		Block_Color[OccupancyIndex], 
		Train_W_Sprite[OccupancyIndex])
	ELSE  block_occupancy_off(block_Grid[OccupancyIndex],
		Block_Color[OccupancyIndex])
	ENDIF



'*******************************
'**	LOOP through East and West InfraRed detectors to determine block occupancy
		
'	IF IRD_East[OccupancyIndex]=occupied THEN
'		$Draw Sprite(IR_Detector_Grid_E[OccupancyIndex])= IR_Detector_Shape_E[OccupancyIndex] in red
'	ELSE $Erase Sprite(IR_Detector_Grid_E[OccupancyIndex])
'	ENDIF
'
'	IF IRD_West[OccupancyIndex]=occupied THEN
'		$Draw Sprite(IR_Detector_Grid_W[OccupancyIndex])= IR_Detector_Shape_W[OccupancyIndex] in red
'	ELSE $Erase Sprite(IR_Detector_Grid_W[OccupancyIndex])
'	ENDIF
'
'	IF 	OccupyEast[OccupancyIndex]=On or 
'		OccupyWest[OccupancyIndex] = on or 
'		IRD_East[OccupancyIndex]=on or 
'		IRD_West[OccupancyIndex]= on 
'	THEN 
'		Block_Status[OccupancyIndex]=1,
'	ELSE 	Block_Status[OccupancyIndex]=0
'	ENDIF
'

	ALWAYS DO

		IF OccupancyIndex<MaxBlocks then OccupancyIndex=+ 
		ELSE OccupancyIndex=0
		ENDIF


'*******************************
'**	LOOP through EOT InfraRed detectors to determine block occupancy

'	WHEN IR_EOT_Detector[0]=occupied DO
'		$Draw Sprite(IR_EOT_Detector_Grid[0])= IR_EOT_Detector_Shape[0] in red
'	WHEN IR_EOT_Detector[0]=VACANT DO
'		$Erase Sprite(IR_EOT_Detector_Grid[0])



when $leftmouse=(56-58,23-25,4) do temp=$leftmouse,$color track(temp)=red

