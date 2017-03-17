CONTROLS:	Tortoise[16],		'yardmaster module
		Switchman[16]		'Switchman module
		CabOuterAorB[16]	'2 dash8 modules
		CabInnerAorB[16]	'2 dash8 modules
'		CabOuterABorC[12]	'1 dash8 module & 1 train brain module
		CabOuterABorC[8]	'1 dash8 module & 1 train brain module-TRAIN BRAIN MODULE IN REPAIR
'		CabInnerABorC[12]	'3 train brain modules 
		CabInnerABorC[4]	'3 train brain modules - preliminary using only 4 in 1 module - will be 12

SENSORS: 	'IRD_East[12],spare,spare,IR_EOT_Detector[2] 'Track Block Infra Red Detectors, one at each end of block - 1 sentry module
		'IRD_West[12],spare,spare,spare,spare	'Track Blook Infra Red Detectors, one at each end of block - 1 sentry module
		IRD_East[6],IR_EOT_Detector[2]
		IRD_West[6],spare,spare
		Occupy0E,Occupy0W,Occupy1E,Occupy1W		' Sensors for Current Detectors - 1 train brain
		Occupy2E,Occupy2W,Occupy3E,Occupy3W		' Sensors for Current Detectors - 1/2 Watchman
		Occupy4E,Occupy4W,Occupy5E,Occupy5W		' Sensors for Current Detectors - 1/2 Watchman
'		Occupy6E,Occupy6W,Occupy7E,Occupy7W		' Sensors for Current Detectors - 1 train brain
'		Occupy8E,Occupy8W,Occupy9E,Occupy9W		' Sensors for Current Detectors - 1 train brain
'		Occupy10E,Occupy10W,Occupy11E,Occupy11W	' Sensors for Current Detectors - 1 train brain
'		OccupyEast[12]	'UNUSED ARRay 3 train brain module module
'		OccupyWest[12]  	'UNUSED ARRAY 3 train brain modules

SMARTCABS:	Cab[3]
		
CONSTANTS:	mygray=$RGB_DFDFDF	'* Color for unselected speed buttons
		normal=off			'* Normal (green)  position of turnout
		Diverting=on		'* Diverting (red) position of turnout
		Occupied=true		'* For block occupancy
		Vacant=false		'* For block occupancy
		Maxblocks=4		'* Max number of blocks for lLOOPs, etc
		MaxBlocksLessOne=3	'*
		MaxTurnoutsUsed=10	'*

VARIABLES:	blocknum
		count
		initialize
		index
		Block_Color
		turnout
		cabnum
		cabindex
		traincount
		tempcabnum
		blocktemp
		BlockIndex
		SpeedIndex
		IR_Detector_Index	'LLOOP counter for checking IR detectors status 
		Current_Sensor_Index 	'LLOOP counter for checking current sensors status
		QueryIndex

	'* Define Grid coordinates for panel display
		Turnout_Grid[16]
		IR_Detector_Grid_E[12]
		IR_Detector_Grid_W[12]
		IR_EOT_Detector_Grid[2]
		Cab0_Speed_Grid[11]
		Cab1_Speed_Grid[11]
		Cab2_Speed_Grid[11]
		Cab_Brake_Grid[3]
		Cab_F_W_Indication_Grid[3]		
		Cab_Direction_Grid[3]		
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
		Cab_Speed[3]		'* holds speed for each cab
		Cab_Direction[3]		'* holds direction for each cab

		OccupyEast[6]		'* holds status of current sensors
		OccupyWest[6]		'* holds status of current sensors

		
'******************************************************************************************

ACTIONS:

'*****************************Sub Routines *************************

'******** 	Throw Tortoise Switch and corresponding display on panel

SUB Throw_Switch(TurnOutNum,onoff,ctc_Grid)
	$Switch(ctc_Grid)=onoff
	tortoise[TurnoutNum]=onoff
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
'	OccupyEast[6]=Occupy6E,
'	OccupyWest[6]=Occupy6W,
'	OccupyEast[7]=Occupy7E,
'	OccupyWest[7]=Occupy7W,
'	OccupyEast[8]=Occupy8E,
'	OccupyWest[8]=Occupy8W,
'	OccupyEast[9]=Occupy9E,
'	OccupyWest[9]=Occupy9W,
'	OccupyEast[10]=Occupy10E,
'	OccupyWest[10]=Occupy10W,
'	OccupyEast[11]=Occupy11E,
'	OccupyWest[11]=Occupy11W


'**************************** Initialization ***********************

WHEN initialize=0 DO


'**	Initialize panel locations of IR Block Detectors - one at each end of block		

	IR_Detector_Grid_E[0]=(24,30,4),
	IR_Detector_Grid_E[1]=(4,18,4),
	IR_Detector_Grid_E[2]=(37,6,4),
	IR_Detector_Grid_E[3]=(46,14,4),
	IR_Detector_Grid_E[4]=(27,27,4),
	IR_Detector_Grid_E[5]=(7,22,4),
	IR_Detector_Grid_E[6]=(37,3,4),
	IR_Detector_Grid_E[7]=(50,18,4),
	IR_Detector_Grid_E[8]=(5,18,4),
	IR_Detector_Grid_E[9]=(45,14,4),
	IR_Detector_Grid_E[10]=(5,24,4),
	IR_Detector_Grid_E[11]=(1,1,4),

	IR_Detector_Grid_W[0]=(4,24,4),
	IR_Detector_Grid_W[1]=(30,6,4),
	IR_Detector_Grid_W[2]=(46,10,4),
	IR_Detector_Grid_W[3]=(33,27,4),
	IR_Detector_Grid_W[4]=(9,27,4),
	IR_Detector_Grid_W[5]=(26,3,4),
	IR_Detector_Grid_W[6]=(50,16,4),
	IR_Detector_Grid_W[7]=(27,30,4),
	IR_Detector_Grid_W[8]=(32,7,4),
	IR_Detector_Grid_W[9]=(34,26,4),
	IR_Detector_Grid_W[10]=(26,2,4),
	IR_Detector_Grid_W[11]=(1,1,4),

	IR_EOT_Detector_Grid[0]=(16,5,4),
	IR_EOT_Detector_Grid[1]=(16,4,4),



'**	Initialize panel locations of tortoise controls - left click for normal route, right for diverging

	Turnout_Grid[0]=(4,21,4),
	Turnout_Grid[1]=(9,12,4),
	Turnout_Grid[2]=(32,6,4),
	Turnout_Grid[3]=(35,6,4),
	Turnout_Grid[4]=(46,11,4),
	Turnout_Grid[5]=(46,16,4),
	Turnout_Grid[6]=(45,20,4),
	Turnout_Grid[7]=(29,27,4),
	Turnout_Grid[8]=(7,25,4),
	Turnout_Grid[9]=(30,3,4),
	Turnout_Grid[10]=(4,21,4),
	Turnout_Grid[11]=(4,21,4),
	Turnout_Grid[12]=(4,21,4),
	Turnout_Grid[13]=(4,21,4),
	Turnout_Grid[14]=(4,21,4),
	Turnout_Grid[15]=(4,21,4),


'**	Initialize panel location of track blocks and sprite locations of corresponding sprites

	Block_Grid[0]=(4,28,4),
	Block_Grid[1]=(14,6,4),
	Block_Grid[2]=(42,6,4),
	Block_Grid[3]=(46,21,4),
	Block_Grid[4]=(11,27,4),
	Block_Grid[5]=(12,3,4),
	Block_Grid[6]=(47,3,4),
	Block_Grid[7]=(43,30,4),
	Block_Grid[8]=(16,7,4),
	Block_Grid[9]=(39,26,4),
	Block_Grid[10]=(2,8,4),
	Block_Grid[11]=(1,1,4),

'**	Initialize sprite shapes to overlay on assign cab pushbuttons

	Train_E_Sprite[0]=Loco_north,
	Train_W_Sprite[0]=Loco_south,
	Train_E_Sprite[1]=Loco_east,
	Train_W_Sprite[1]=Loco_west,
	Train_E_Sprite[2]=Loco_east,
	Train_W_Sprite[2]=Loco_west,
	Train_E_Sprite[3]=Loco_south,
	Train_W_Sprite[3]=Loco_north,
	Train_E_Sprite[4]=Loco_west,
	Train_W_Sprite[4]=Loco_east,
	Train_E_Sprite[5]=Loco_east,
	Train_W_Sprite[5]=Loco_west,
	Train_E_Sprite[6]=Loco_east,
	Train_W_Sprite[6]=Loco_west,
	Train_E_Sprite[7]=Loco_west,
	Train_W_Sprite[7]=Loco_east,
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
	IR_Detector_Shape_E[1]=Train_North,
	IR_Detector_Shape_E[2]=Train_East,
	IR_Detector_Shape_E[3]=Train_South,
	IR_Detector_Shape_E[4]=Train_West,
	IR_Detector_Shape_E[5]=Train_North,
	IR_Detector_Shape_E[6]=Train_East,
	IR_Detector_Shape_E[7]=Train_South,
	IR_Detector_Shape_E[8]=Train_North,
	IR_Detector_Shape_E[9]=Train_South,
	IR_Detector_Shape_E[10]=Train_west,
	IR_Detector_Shape_E[11]=Triangle,

	IR_Detector_Shape_W[0]=Train_North,
	IR_Detector_Shape_W[1]=Train_East,
	IR_Detector_Shape_W[2]=Train_South,
	IR_Detector_Shape_W[3]=Train_West,
	IR_Detector_Shape_W[4]=Train_West,
	IR_Detector_Shape_W[5]=Train_East,
	IR_Detector_Shape_W[6]=Train_South,
	IR_Detector_Shape_W[7]=Train_West,
	IR_Detector_Shape_W[8]=Train_East,
	IR_Detector_Shape_W[9]=Train_West,
	IR_Detector_Shape_W[10]=Train_East,
	IR_Detector_Shape_W[11]=Triangle,

	IR_EOT_Detector_Shape[0]=Train_East,
	IR_EOT_Detector_Shape[1]=Train_East,


'**	Initialize colors to indiate cab assignments on blocks and sprites

	Cab_Color[0]=gray,
	Cab_Color[1]=$RGB_80FF
	Cab_Color[2]=$RGB_FF00FF,
	Cab_Color[3]=$RGB_0,

'**	Initialize Cab Speed Pushbutton locations

	Cab0_Speed_Grid[10]=(54,4,4),
	Cab0_Speed_Grid[9]=(54,5,4),
	Cab0_Speed_Grid[8]=(54,6,4),
	Cab0_Speed_Grid[7]=(54,7,4),
	Cab0_Speed_Grid[6]=(54,8,4),
	Cab0_Speed_Grid[5]=(54,9,4),
	Cab0_Speed_Grid[4]=(54,10,4),
	Cab0_Speed_Grid[3]=(54,11,4),
	Cab0_Speed_Grid[2]=(54,12,4),
	Cab0_Speed_Grid[1]=(54,13,4),
	Cab0_Speed_Grid[0]=(54,14,4),
	Cab_Brake_Grid[0]=(54,16,4),	
	Cab_F_W_Indication_Grid[0]=(54,18,4),
	Cab_Direction_Grid[0]=(54,18,4),

	Cab1_Speed_Grid[10]=(56,4,4),
	Cab1_Speed_Grid[9]=(56,5,4),
	Cab1_Speed_Grid[8]=(56,6,4),
	Cab1_Speed_Grid[7]=(56,7,4),
	Cab1_Speed_Grid[6]=(56,8,4),
	Cab1_Speed_Grid[5]=(56,9,4),
	Cab1_Speed_Grid[4]=(56,10,4),
	Cab1_Speed_Grid[3]=(56,11,4),
	Cab1_Speed_Grid[2]=(56,12,4),
	Cab1_Speed_Grid[1]=(56,13,4),
	Cab1_Speed_Grid[0]=(56,14,4),
	Cab_Brake_Grid[1]=(56,16,4),	
	Cab_F_W_Indication_Grid[1]=(56,18,4),
	Cab_Direction_Grid[1]=(56,18,4),	

	Cab2_Speed_Grid[10]=(58,4,4),
	Cab2_Speed_Grid[9]=(58,5,4),
	Cab2_Speed_Grid[8]=(58,6,4),
	Cab2_Speed_Grid[7]=(58,7,4),
	Cab2_Speed_Grid[6]=(58,8,4),
	Cab2_Speed_Grid[5]=(58,9,4),
	Cab2_Speed_Grid[4]=(58,10,4),
	Cab2_Speed_Grid[3]=(58,11,4),
	Cab2_Speed_Grid[2]=(58,12,4),
	Cab2_Speed_Grid[1]=(58,13,4),
	Cab2_Speed_Grid[0]=(58,14,4),
	Cab_Brake_Grid[2]=(58,16,4),	
	Cab_F_W_Indication_Grid[2]=(58,18,4),
	Cab_Direction_Grid[2]=(58,18,4),

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

$QUERY "2$Click on any blocks containing trains$0$1$2$3$4$5$6$7$8$9", 
	WAIT UNTIL $QueryBusy = False Then ,
	QueryIndex = 0 ,
	UNTIL QueryIndex = MaxTurnoutsUsed LOOP ,
		Throw_Switch(Queryindex,$queryBit[queryindex],Turnout_Grid[queryindex]), 
		QueryIndex = + ,
	ENDLOOP, 

'**	Initialize all undefined turnouts to normal position

Index=MaxTurnoutsUsed,
UNTIL index= 16 QUICKLOOP,
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

Blockindex=0,
UNTIL blockindex=Maxblocks QUICKLOOP,
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
blockindex=0,
wait 1,
UNTIL blockindex=Maxblocks QUICKLOOP,
	IF OccupyEast[blockindex]=on then,
	Block_Cab[blockindex]=cabindex,
		Cab_To_Block(blockindex,cabindex),
		Block_Color[blockindex]=cab_color[cabindex],
		block_occupancy_on (block_Grid[blockindex], Block_Color[blockindex],Block_Color[blockindex], Train_E_Sprite[blockindex]),
		traincount=+,
		cabindex=+,
	ELSE Block_Cab[blockindex]=0,
	ENDIF,
blockindex=+,
ENDLOOP,	


Initialize=1

'***************************************************** END OF INITIALIZATION ***********************************************


'*************************** Actions **********************************


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
			
	WHEN $Leftmouse=Block_Grid[0] DO 			
		Block_Cab[0]=+,		
		IF Block_Cab[0]>2 then, 		
			Block_Cab[0]=0,	
		ELSE blocktemp=Block_Cab[0],		
		ENDIF,		
		blocktemp=Block_Cab[0],		
			block_color[0]=Cab_Color[blocktemp],	
			Cab_To_Block(0,blocktemp),	
			$Color Sprite(Block_Grid[0])=block_color[0]	
				
				
	WHEN $Leftmouse=Block_Grid[1] DO 			
		Block_Cab[1]=+,		
		IF Block_Cab[1]>2 then, 		
			Block_Cab[1]=0,	
		ENDIF,		
		blocktemp=Block_Cab[1],		
			block_color[1]=Cab_Color[blocktemp],	
			Cab_To_Block(1,blocktemp),	
			$Color Sprite(Block_Grid[1])=block_color[1]	
				
		WHEN $Leftmouse=Block_Grid[2] DO 		
		Block_Cab[2]=+,		
		IF Block_Cab[2]>2 then, 		
			Block_Cab[2]=0,	
		ENDIF,		
		blocktemp=Block_Cab[2],		
			block_color[2]=Cab_Color[blocktemp],	
			Cab_To_Block(2,blocktemp),	
			$Color Sprite(Block_Grid[2])=block_color[2]	
				
	WHEN $Leftmouse=Block_Grid[3] DO 			
		Block_Cab[3]=+,		
		IF Block_Cab[3]>2 then, 		
			Block_Cab[3]=0,	
		ENDIF,		
		blocktemp=Block_Cab[3],		
			block_color[3]=Cab_Color[blocktemp],	
			Cab_To_Block(3,blocktemp),	
			$Color Sprite(Block_Grid[3])=block_color[3]	
				
				
	WHEN $Leftmouse=Block_Grid[4] DO 			
		Block_Cab[4]=+,		
		IF Block_Cab[4]>2 then, 		
			Block_Cab[4]=0,	
		ELSE blocktemp=Block_Cab[4],		
		ENDIF,		
		blocktemp=Block_Cab[4],		
			block_color[4]=Cab_Color[blocktemp],	
			Cab_To_Block(4,blocktemp),	
			$Color Sprite(Block_Grid[4])=block_color[4]	
				
	WHEN $Leftmouse=Block_Grid[5] DO 			
		Block_Cab[5]=+,		
		IF Block_Cab[5]>2 then, 		
			Block_Cab[5]=0,	
		ELSE blocktemp=Block_Cab[5],		
		ENDIF,		
		blocktemp=Block_Cab[5],		
			block_color[5]=Cab_Color[blocktemp],	
			Cab_To_Block(5,blocktemp),	
			$Color Sprite(Block_Grid[5])=block_color[5]	
				
	WHEN $Leftmouse=Block_Grid[6] DO 			
		Block_Cab[6]=+,		
		IF Block_Cab[6]>2 then, 		
			Block_Cab[6]=0,	
		ELSE blocktemp=Block_Cab[6],		
		ENDIF,		
		blocktemp=Block_Cab[6],		
			block_color[6]=Cab_Color[blocktemp],	
			Cab_To_Block(6,blocktemp),	
			$Color Sprite(Block_Grid[6])=block_color[6]	
				
	WHEN $Leftmouse=Block_Grid[7] DO 			
		Block_Cab[7]=+,		
		IF Block_Cab[7]>2 then, 		
			Block_Cab[7]=0,	
		ELSE blocktemp=Block_Cab[7],		
		ENDIF,		
		blocktemp=Block_Cab[7],		
			block_color[7]=Cab_Color[blocktemp],	
			Cab_To_Block(7,blocktemp),	
			$Color Sprite(Block_Grid[7])=block_color[7]	
				
	WHEN $Leftmouse=Block_Grid[8] DO 			
		Block_Cab[8]=+,		
		IF Block_Cab[8]>2 then, 		
			Block_Cab[8]=0,	
		ELSE blocktemp=Block_Cab[8],		
		ENDIF,		
		blocktemp=Block_Cab[8],		
			block_color[8]=Cab_Color[blocktemp],	
			Cab_To_Block(8,blocktemp),	
			$Color Sprite(Block_Grid[8])=block_color[8]	
				
	WHEN $Leftmouse=Block_Grid[9] DO 			
		Block_Cab[9]=+,		
		IF Block_Cab[9]>2 then, 		
			Block_Cab[9]=0,	
		ELSE blocktemp=Block_Cab[9],		
		ENDIF,		
		blocktemp=Block_Cab[9],		
			block_color[9]=Cab_Color[blocktemp],	
			Cab_To_Block(9,blocktemp),	
			$Color Sprite(Block_Grid[9])=block_color[9]	
				
	WHEN $Leftmouse=Block_Grid[10] DO 			
		Block_Cab[10]=+,		
		IF Block_Cab[10]>2 then, 		
			Block_Cab[10]=0,	
		ELSE blocktemp=Block_Cab[10],		
		ENDIF,		
		blocktemp=Block_Cab[10],		
			block_color[10]=Cab_Color[blocktemp],	
			Cab_To_Block(10,blocktemp),	
			$Color Sprite(Block_Grid[10])=block_color[10]	
				
	WHEN $Leftmouse=Block_Grid[11] DO 			
		Block_Cab[11]=+,		
		IF Block_Cab[11]>2 then, 		
			Block_Cab[11]=0,	
		ELSE blocktemp=Block_Cab[11],		
		ENDIF,		
		blocktemp=Block_Cab[11],		
			block_color[11]=Cab_Color[blocktemp],	
			Cab_To_Block(11,blocktemp),	
			$Color Sprite(Block_Grid[11])=block_color[11]	
							
				
''*************************************			
				
'**	Detect activation of turnouts on panel		
'**		Call subroutine	
'**			Right click turns tortoise on, and indicates normal route with green on panel
'**			Left click turns tortoise off, and indates diverging route with red on panel			
							
	WHEN $Rightmouse=Turnout_Grid[0] DO 			
			Throw_Switch(0,on,Turnout_Grid[0]),	
	'		Tortoise[0]=on	
	WHEN $Leftmouse=Turnout_Grid[0]DO 			
			Throw_Switch(0,off,Turnout_Grid[0]),	
	'		Tortoise[0]=off	
				
	WHEN $Rightmouse=Turnout_Grid[1] DO 			
			Throw_Switch(1,on,Turnout_Grid[1]),	
	'		Tortoise[1]=on	
	WHEN $Leftmouse=Turnout_Grid[1]DO 			
			Throw_Switch(1,off,Turnout_Grid[1]),	
	'		Tortoise[1]=off	
				
	WHEN $Rightmouse=Turnout_Grid[2] DO 			
			Throw_Switch(2,on,Turnout_Grid[2]),	
	'		Tortoise[2]=on	
	WHEN $Leftmouse=Turnout_Grid[2]DO 			
			Throw_Switch(2,off,Turnout_Grid[2]),	
	'		Tortoise[2]=off	
				
	WHEN $Rightmouse=Turnout_Grid[3] DO 			
			Throw_Switch(3,on,Turnout_Grid[3]),	
	'		Tortoise[3]=on	
	WHEN $Leftmouse=Turnout_Grid[3]DO 			
			Throw_Switch(3,off,Turnout_Grid[3]),	
	'		Tortoise[3]=off	
				
	WHEN $Rightmouse=Turnout_Grid[4] DO 			
			Throw_Switch(4,on,Turnout_Grid[4]),	
	'		Tortoise[4]=on	
	WHEN $Leftmouse=Turnout_Grid[4]DO			
			Throw_Switch(4,off,Turnout_Grid[4]),	
	'		Tortoise[4]=off	
				
	WHEN $Rightmouse=Turnout_Grid[5] DO 			
			Throw_Switch(5,on,Turnout_Grid[5]),	
	'		Tortoise[5]=on	
	WHEN $Leftmouse=Turnout_Grid[5]DO 			
			Throw_Switch(5,off,Turnout_Grid[5]),	
	'		Tortoise[5]=off	
				
	WHEN $Rightmouse=Turnout_Grid[6] DO 			
			Throw_Switch(6,on,Turnout_Grid[6]),	
	'		Tortoise[6]=on	
	WHEN $Leftmouse=Turnout_Grid[6]DO			
			Throw_Switch(6,off,Turnout_Grid[6]),	
	'		Tortoise[6]=off	
				
	WHEN $Rightmouse=Turnout_Grid[7] DO 			
			Throw_Switch(7,on,Turnout_Grid[7]),	
	'		Tortoise[7]=on	
	WHEN $Leftmouse=Turnout_Grid[7]DO 			
			Throw_Switch(7,off,Turnout_Grid[7]),	
	'		Tortoise[7]=off	
				
	WHEN $Rightmouse=Turnout_Grid[8] DO 			
			Throw_Switch(8,on,Turnout_Grid[8]),	
	'		Tortoise[8]=on	
	WHEN $Leftmouse=Turnout_Grid[8]DO 			
			Throw_Switch(8,off,Turnout_Grid[8]),	
	'		Tortoise[8]=off	
	WHEN $Rightmouse=Turnout_Grid[9] DO 			
			Throw_Switch(9,on,Turnout_Grid[9]),	
	'		Tortoise[9]=on	
	WHEN $Leftmouse=Turnout_Grid[9]DO 			
			Throw_Switch(9,off,Turnout_Grid[9]),	
	'		Tortoise[9]=off	
				
	WHEN $Rightmouse=Turnout_Grid[10] DO 			
			Throw_Switch(10,on,Turnout_Grid[10]),	
	'		Tortoise[10]=on	
	WHEN $Leftmouse=Turnout_Grid[10]DO			
			Throw_Switch(10,off,Turnout_Grid[10]),	
	'		Tortoise[10]=off	
				
	WHEN $Rightmouse=Turnout_Grid[11] DO 			
			Throw_Switch(11,on,Turnout_Grid[11]),	
	'		Tortoise[11]=on	
	WHEN $Leftmouse=Turnout_Grid[11]DO 			
			Throw_Switch(11,off,Turnout_Grid[11]),	
	'		Tortoise[11]=off	
	WHEN $Rightmouse=Turnout_Grid[12] DO 			
			Throw_Switch(12,on,Turnout_Grid[12]),	
	'		Tortoise[12]=on	
	WHEN $Leftmouse=Turnout_Grid[12]DO 			
			Throw_Switch(12,off,Turnout_Grid[12]),	
	'		Tortoise[12]=off	
				
	WHEN $Rightmouse=Turnout_Grid[13] DO 			
			Throw_Switch(13,on,Turnout_Grid[13]),	
	'		Tortoise[13]=on	
	WHEN $Leftmouse=Turnout_Grid[13]DO 			
			Throw_Switch(13,off,Turnout_Grid[13]),	
	'		Tortoise[13]=off	
				
	WHEN $Rightmouse=Turnout_Grid[14] DO 			
			Throw_Switch(14,on,Turnout_Grid[14]),	
	'		Tortoise[14]=on	
	WHEN $Leftmouse=Turnout_Grid[14]DO 			
			Throw_Switch(14,off,Turnout_Grid[14]),	
	'		Tortoise[14]=off	
				
				
	WHEN $Rightmouse=Turnout_Grid[15] DO 			
			Throw_Switch(15,on,Turnout_Grid[15]),	
	'		Tortoise[15]=on	
	WHEN $Leftmouse=Turnout_Grid[15]DO 			
			Throw_Switch(15,off,Turnout_Grid[15]),	
	'		Tortoise[15]=off		


'*******************************

'**	LOOP through East and West current detectors to determine block occupancy

	WHEN OccupyEast[0]=occupied  DO 
		block_occupancy_on (block_Grid[0], 
		Block_Color[0], 
		Train_E_Sprite[0])
	WHEN OccupyWest[0]=occupied  DO 
		block_occupancy_on (block_Grid[0], 
		Block_Color[0], 
		Train_W_Sprite[0])
	WHEN OccupyEast[0]=vacant and OccupyWest[0]=vacant DO 
		block_occupancy_off (block_Grid[0], 
		Block_Color[0])

	WHEN OccupyEast[1]=occupied  DO 
		block_occupancy_on (block_Grid[1], 
		Block_Color[1], 
		Train_E_Sprite[1])
	WHEN OccupyWest[1]=occupied  DO 
		block_occupancy_on (block_Grid[1], 
		Block_Color[1], 
		Train_W_Sprite[1])
	WHEN OccupyEast[1]=vacant and OccupyWest[1]=vacant DO 
		block_occupancy_off (block_Grid[1], 
		Block_Color[1])

	WHEN OccupyEast[2]=occupied  DO 
		block_occupancy_on (block_Grid[2], 
		Block_Color[2], 
		Train_E_Sprite[2])
	WHEN OccupyWest[2]=occupied  DO 
		block_occupancy_on (block_Grid[2], 
		Block_Color[2], 
		Train_W_Sprite[2])
	WHEN OccupyEast[2]=vacant and OccupyWest[2]=vacant DO 
		block_occupancy_off (block_Grid[2], 
		Block_Color[2])

	WHEN OccupyEast[3]=occupied  DO 
		block_occupancy_on (block_Grid[3], 
		Block_Color[3], 
		Train_E_Sprite[3])
	WHEN OccupyWest[3]=occupied  DO 
		block_occupancy_on (block_Grid[3], 
		Block_Color[3], 
		Train_W_Sprite[3])
	WHEN OccupyEast[3]=vacant and OccupyWest[3]=vacant DO 
		block_occupancy_off (block_Grid[3], 
		Block_Color[3])








