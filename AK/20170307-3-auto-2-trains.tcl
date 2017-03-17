'************************************************************************************
'														*
'						DECLARATIONS						*
'														*
'************************************************************************************

CONSTANTS:
	Maxblocks=12		'* Max number of blocks for lLOOPs, etc
	MaxBlocksPlusOne=13
	MaxTurnouts=17
	MaxTurnoutsPlusOne=18
	start=21

	mygray=$RGB_DFDFDF	'* Color for unselected speed buttons
	normal=off			'* Normal (green)  position of turnout
	Diverting=on		'* Diverting (red) position of turnout
	Occupied=true		'* For block occupancy
	Vacant=false		'* For block occupancy

	TRAVEL_DIRECTION_EAST = 1
	TRAVEL_DIRECTION_NONE = 0
	TRAVEL_DIRECTION_WEST = -1

	BLOCK_NOT_OCCUPIED = 0
	BLOCK_TRAIN_TRAVELING_EAST = 1
	BLOCK_TRAIN_TRAVELING_WEST = 2
	BLOCK_VACATED_EAST = 3
	BLOCK_VACATED_WEST = 4

	NO_HOLD_ON_BLOCK = -1

	MAX_CABS = 3

'***********************************************************************************
'					NETWORK MODULE DECLARATIONS
'***********************************************************************************

' Naming conventions:
'	Chars 1-3 	(UC): Module ID (Type and Port type) [ex. D8C Dash8 Control; TBS TrainBrain Sensor] 
'	Chars 4-5 	(NUM): Port #
'	Chars 6-8	(UP, UP, LC): Board ID (Type And #) (PB=Power Cab; BC=Block Control; TC=Turnout Control; DE=Detectors
'	Char 9	(NUM): Module position on board
'	
'''''''''''
''''''''''' Power Board "a"
'''''''''''

SMARTCABS: SCP01PBa1, SCP01PBa2, SCP01PBa3 	'Network Modules 1-3


'''''''''''
''''''''''' Track Control board "a"
'''''''''''

' Train Brain "1"
CONTROLS: 	TBC01BCa1, TBC02BCa1, TBC03BCa1, TBC04BCa1
SENSORS:	TBS01BCa1_8E#, TBS02BCa1#, TBS01BCa1_5E#, TBS04BCa1#

' Train Brain "2"
CONTROLS: 	TBC01BCa2, TBC02BCa2, TBC03BCa2, TBC04BCa2
SENSORS:	TBS03BCa2_1E#, TBS02BCa2#, TBS03BCa2#, TBS04BCa2#

'Dash-8 "1"
CONTROLS:	D8C01BCa3, D8C02BCa3, D8C03BCa3, D8C04BCa3, D8C05BCa3, D8C06BCa3, D8C07BCa3, D8C08BCa3

'''''''''''
''''''''''' Track Control board "b"
'''''''''''

' Train Brain "1"
CONTROLS: 	TBC01BCb1, TBC02BCb1, TBC03BCb1, TBC04BCb1
SENSORS:	TBS01BCb1_7E#, TBS02BCb1#, TBS03BCb1#, TBS04BCb1#

' Train Brain "2"
CONTROLS: 	TBC01BCb2, TBC02BCb2, TBC03BCb2, TBC04BCb2
SENSORS:	TBS01BCb2_4E#, TBS02BCb2#, TBS03BCb2#, TBS04BCb2#

'Dash-8 "1"
CONTROLS:	D8C01BCb3, D8C02BCb3, D8C03BCb3, D8C04BCb3, D8C05BCb3, D8C06BCb3, D8C07BCb3, D8C08BCb3

'''''''''''
''''''''''' Track Control board "c"
'''''''''''

' Train Brain "1"
CONTROLS: 	TBC01BCc1, TBC02BCc1, TBC03BCc1, TBC04BCc1
SENSORS:	TBS01BCc1_2E#, TBS02BCc1#, TBS03BCc1_6E#, TBS04BCc1#

' Train Brain "2"
CONTROLS: 	TBC01BCc2, TBC02BCc2, TBC03BCc2, TBC04BCc2
SENSORS:	TBS01BCc2#, TBS02BCc2#, TBS03BCc2_3E#, TBS04BCc2#

'Dash-8 "1"
CONTROLS:	D8C01BCc3, D8C02BCc3, D8C03BCc3, D8C04BCc3, D8C05BCc3, D8C06BCc3, D8C07BCc3, D8C08BCc3

'***********************************************************************************
'						VARIABLES
'***********************************************************************************

VARIABLES:

' Holds address of controls for assigning cabs to blocks
	CAB_AorB_Pointer[MaxBlocksPlusOne]
	CAB_CorD_Pointer[MaxBlocksPlusOne]
	CAB_ABorCD_Pointer[MaxBlocksPlusOne]

' Holds addresses of Current Detector Sensors for each block
	CD_East_Pointer[MaxBlocksPlusOne]
	CD_West_Pointer[MaxBlocksPlusOne]

	BlockStatus[MaxBlocksPlusOne]

' Holds address of 3 smart cabs and their functions (cab[0] is placeholder for manual cab and functions)
	Cab_Pointer[4]
	Cab_Speed_Pointer[4]		'* holds address for speed for each cab
	Cab_Direction_Pointer[4]		'* holds address for direction for each cab
	Cab_Momentum_Pointer[4]		'* Holds address formomentum for each cab
	Cab_Brake_Pointer[4]		'* Holds address for brake for each cab

' Indexes for loops
	BlockIndex
	SpeedIndex
	OccupancyIndex
	IR_Detector_Index	'LOOP counter for checking IR detectors status 
	CurrentSensorIndex 	'LOOP counter for checking current sensors status
	QueryIndex
	CabAssignIndex
	TurnoutIndex
	CabIndex
	NotchIndex
	index

' Used in subroutines
		blocknum
		cabnum

		Init
		x
		y
		Count
		Block_Color
		temp
		traincount
		tempcabnum
		blocktemp
' Status holders
	Mouse_Status				' holds mouse status to prevent multiple actions on single click
	'Block_Status[MaxBlocksPlusOne]
	Block_Cab[MaxBlocksPlusOne]		'* holds cab assignment for each block
	'OccupyEast[maxblocksplusOne]		'* holds status of current sensors
	'OccupyWest[maxblocksplusOne]		'* holds status of current sensors

'* Arrays to hold Grid coordinates for panel display
	Block_Grid[MaxBlocksPlusOne]
	
	Cab1_Speed_Grid[12]
	Cab1_Brake_Grid
	Cab1_F_R_Indication_Grid		
	Cab1_Direction_Grid
	Cab2_Speed_Grid[12]
	Cab2_Brake_Grid
	Cab2_F_R_Indication_Grid		
	Cab2_Direction_Grid
	Cab3_Speed_Grid[12]
	Cab3_Brake_Grid
	Cab3_F_R_Indication_Grid		
	Cab3_Direction_Grid

	cab0_Block_Grid[MaxBlocksPlusOne]		
	cab1_Block_Grid[MaxBlocksPlusOne]
	cab2_Block_Grid[MaxBlocksPlusOne]
	cab3_Block_Grid[MaxBlocksPlusOne]

	cab0_All_Blocks_Grid
	cab1_All_Blocks_Grid
	cab2_All_Blocks_Grid
	cab3_All_Blocks_Grid



	
'* Arrays to hold Colors & Shapes for panel display
	Cab_Color[4]
	Block_Color[MaxBlocksPlusOne]
	Block_Sprite[MaxBlocksPlusOne]
	Train_E_Sprite[MaxBlocksPlusOne]
	Train_W_Sprite[MaxBlocksPlusOne]

	Speed_Notch[11]		'* holds throttle speeds for each step


'* Held Blocks
	Held_Blocks_With_Direction[MaxBlocksPlusOne]
	'Holds_On_Blocks[MaxBlocksPlusOne]

	Block_Status[MaxBlocksPlusOne]
	Holds_On_Blocks[MaxBlocksPlusOne]

'* Speed Control
	Previous_Cab_Speed[MAX_CABS]
		



'************************************************************************************
'														*
'						ACTIONS							*
'														*
'************************************************************************************
ACTIONS:


'************************************************************************************
'					   SUB ROUTINES 							
'************************************************************************************

'******** 	Throw Atlas Switch and corresponding display on panel

'******** 	Indicate Block occupancy change on panel

' 	Occupied

SUB Block_occupancy_on(block_Grid,block_color,sprite_shape)
	$Color Block (block_Grid) = block_color
	$Draw Sprite (block_Grid) = sprite_shape in Block_Color
ENDSUB

' 	Vacant

SUB Block_occupancy_off(block_Grid,Block_Color)
	$Color Block (block_Grid) = black
	$Draw Sprite (block_Grid) = Lock in Block_Color
ENDSUB

		
'******** 	Configures TrainBrain Controls to assign proper cab to designated block
'			Also assigns Cab color to designated block for panel displays

SUB Configure_Cab_To_Block(blocknum,cabnum) 
	IF cabnum>3 then  RETURN

	ELSEIF cabnum=0 then
		*Cab_AorB_Pointer[blocknum]=off
		*Cab_ABorCD_Pointer[blocknum]=off
	
	ELSEIF cabnum=1 then
		*Cab_AorB_Pointer[blocknum]=on
		*Cab_ABorCD_Pointer[blocknum]=off
	
	ELSEIF cabnum=2 then
		*Cab_CorD_Pointer[blocknum]=off
		*Cab_ABorCD_Pointer[blocknum]=on
	
	ELSEIF cabnum=3 then
		*Cab_CorD_Pointer[blocknum]=on
		*Cab_ABorCD_Pointer[blocknum]=on
	ENDIF

	Block_Color[blocknum]=Cab_Color[cabnum]
ENDSUB


'******** 	Assign selected cab to designated blocks)
'			Calls subroutine to configure corresponding trainbrain controls
'			Colors block sprite with selected cab color
'			Colors selected block buttons with selected cab color and shape on panel

SUB Assign_Cab_To_Block(cabnum,BlockIndex)
	Block_Cab[BlockIndex]=cabnum,
	Configure_Cab_To_Block(BlockIndex,cabnum),	
	$Color Sprite(Block_Grid[BlockIndex])=Cab_Color[cabnum],
	Block_Color[BlockIndex]=Cab_Color[cabnum],

	IF cabnum=0 THEN $Draw Sprite(cab0_Block_Grid[BlockIndex])=Block_Sprite[BlockIndex] in Cab_Color[0],
	ELSE $DRAW SPRITE(cab0_Block_Grid[BlockIndex])=SQUARE in mygray,
	ENDIF,

	IF cabnum=1 THEN $Draw Sprite(cab1_Block_Grid[BlockIndex])=Block_Sprite[BlockIndex] in Cab_Color[1],
	ELSE $DRAW SPRITE(cab1_Block_Grid[BlockIndex])=SQUARE in mygray,
	ENDIF,

	IF cabnum=2 THEN $Draw Sprite(cab2_Block_Grid[BlockIndex])=Block_Sprite[BlockIndex] in Cab_Color[2],
	ELSE $DRAW SPRITE(cab2_Block_Grid[BlockIndex])=SQUARE in mygray,
	ENDIF,

	IF cabnum=3 THEN $Draw Sprite(cab3_Block_Grid[BlockIndex])=Block_Sprite[BlockIndex] in Cab_Color[3],
	ELSE $DRAW SPRITE(cab3_Block_Grid[BlockIndex])=SQUARE in mygray,
	ENDIF,
ENDSUB

SUB Assign_Cab_To_All_Blocks(CabNum, Index)
	Index = 1
	UNTIL Index > MaxBlocks QUICKLOOP
		Assign_Cab_To_Block(CabNum, Index)
		Index =+
	ENDLOOP
ENDSUB


'******** 	Assign selected speed to cab, and update panel buttons

SUB Assign_Speed_To_Cab(CabIndex,SpeedIndex)
	*Cab_Speed_Pointer[CabIndex]=speed_notch[SpeedIndex], 'Set Actual cab speed	
ENDSUB
	
'************************************************************************************
'					   INITIALIZATION							
'************************************************************************************

WHEN init = 0 do '(All lines must end in a comma to continue the initialization chain)

' set address pointers to cab selection controllers

	CAB_AorB_Pointer[8]=&TBC01BCa1,
	CAB_AorB_Pointer[5]=&TBC02BCa1,
	CAB_AorB_Pointer[1]=&TBC03BCa1,
	CAB_AorB_Pointer[9]=&TBC04BCa1,
	CAB_CorD_Pointer[8]=&TBC01BCa2,
	CAB_CorD_Pointer[5]=&TBC02BCa2,
	CAB_CorD_Pointer[1]=&TBC03BCa2,
	CAB_CorD_Pointer[9]=&TBC04BCa2,
	CAB_ABorCD_Pointer[8]=&D8C01BCa3,
	CAB_ABorCD_Pointer[5]=&D8C02BCa3,
	CAB_ABorCD_Pointer[1]=&D8C03BCa3,
	CAB_ABorCD_Pointer[9]=&D8C04BCa3,

	CAB_AorB_Pointer[7]=&TBC01BCb1,
	CAB_AorB_Pointer[11]=&TBC02BCb1,
	CAB_AorB_Pointer[4]=&TBC03BCb1,
	CAB_CorD_Pointer[7]=&TBC01BCb2,
	CAB_CorD_Pointer[11]=&TBC02BCb2,
	CAB_CorD_Pointer[4]=&TBC03BCb2,
	CAB_ABorCD_Pointer[7]=&D8C01BCb3,
	CAB_ABorCD_Pointer[11]=&D8C02BCb3,
	CAB_ABorCD_Pointer[4]=&D8C03BCb3,
	' SPARE CAB_ABorCD_Pointer[xx]=&D8C04BCb3,

	CAB_AorB_Pointer[2]=&TBC01BCc1,
	CAB_AorB_Pointer[6]=&TBC02BCc1,
	CAB_AorB_Pointer[10]=&TBC03BCc1,
	CAB_AorB_Pointer[3]=&TBC04BCc1,
	CAB_CorD_Pointer[2]=&TBC01BCc2,
	CAB_CorD_Pointer[6]=&TBC02BCc2,
	CAB_CorD_Pointer[10]=&TBC03BCc2,
	CAB_CorD_Pointer[3]=&TBC04BCc2,
	CAB_ABorCD_Pointer[2]=&D8C01BCc3,
	CAB_ABorCD_Pointer[6]=&D8C02BCc3,
	CAB_ABorCD_Pointer[10]=&D8C03BCc3,
	CAB_ABorCD_Pointer[3]=&D8C04BCc3,
' set address pointers to Current Detector Sensors

	CD_East_Pointer[8]=&TBS01BCa1_8E,
	CD_West_Pointer[8]=&TBS02BCa1,
'	CD_East_Pointer[5]=&TBS03BCa1_5E,
'	CD_West_Pointer[5]=&TBS04BCa1,
'	CD_East_Pointer[1]=&TBS01BCa2_1E,
'	CD_West_Pointer[1]=&TBS02BCa2,
	CD_East_Pointer[1]=&TBS01BCa1_5E,
	CD_West_Pointer[1]=&TBS02BCa1,
	CD_East_Pointer[5]=&TBS03BCa2_1E,
	CD_West_Pointer[5]=&TBS04BCa1,
	CD_East_Pointer[9]=&TBS03BCa2,
	CD_West_Pointer[9]=&TBS04BCa2,

	CD_East_Pointer[7]=&TBS01BCb1_7E,
	CD_West_Pointer[7]=&TBS02BCb1,
	CD_East_Pointer[11]=&TBS03BCb1,
	CD_West_Pointer[11]=&TBS04BCb1,
	CD_East_Pointer[4]=&TBS01BCb2_4E,
	CD_West_Pointer[4]=&TBS02BCb2,
	CD_East_Pointer[12]=&TBS03BCb2,
	CD_West_Pointer[12]=&TBS04BCb2,

	CD_East_Pointer[2]=&TBS01BCc1_2E,
	CD_West_Pointer[2]=&TBS02BCc1,
	CD_East_Pointer[6]=&TBS03BCc1_6E,
	CD_West_Pointer[6]=&TBS04BCc1,
	CD_East_Pointer[10]=&TBS01BCc2,
	CD_West_Pointer[10]=&TBS02BCc2,
	CD_East_Pointer[3]=&TBS03BCc2_3E,
	CD_West_Pointer[3]=&TBS04BCc2,

' set address pointers to Cab Controls and Functions

	Cab_Pointer[1]=&SCP01PBa1,
	Cab_Pointer[2]=&SCP01PBa2,
	Cab_Pointer[3]=&SCP01PBa3,

	Cab_Speed_Pointer[1]=&SCP01PBa1.speed,
	Cab_Speed_Pointer[2]=&SCP01PBa2.speed,
	Cab_Speed_Pointer[3]=&SCP01PBa3.speed,

	Cab_Direction_Pointer[1]=&SCP01PBa1.Direction,
	Cab_Direction_Pointer[2]=&SCP01PBa2.Direction,
	Cab_Direction_Pointer[3]=&SCP01PBa3.Direction,

	Cab_Brake_Pointer[1]=&SCP01PBa1.Brake,
	Cab_Brake_Pointer[2]=&SCP01PBa2.Brake,
	Cab_Brake_Pointer[3]=&SCP01PBa3.Brake,

	Cab_Momentum_Pointer[1]=&SCP01PBa1.Momentum,
	Cab_Momentum_Pointer[2]=&SCP01PBa2.Momentum,
	Cab_Momentum_Pointer[3]=&SCP01PBa3.Momentum,

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
	Block_Grid[12]=(24,12,4),

'**	Initialize sprite shapes to overlay on assign cab pushbuttons

	Train_E_Sprite[0]=Arrow_north,
	Train_W_Sprite[0]=Arrow_south,
	Train_E_Sprite[1]=Arrow_west,
	Train_W_Sprite[1]=Arrow_east,
	Train_E_Sprite[2]=Arrow_west,
	Train_W_Sprite[2]=Arrow_east,
	Train_E_Sprite[3]=Arrow_north,
	Train_W_Sprite[3]=Arrow_south,
	Train_E_Sprite[4]=Arrow_east,
	Train_W_Sprite[4]=Arrow_west,
	Train_E_Sprite[5]=Arrow_west,
	Train_W_Sprite[5]=Arrow_east,
	Train_E_Sprite[6]=Arrow_west,
	Train_W_Sprite[6]=Arrow_east,
	Train_E_Sprite[7]=Arrow_East,
	Train_W_Sprite[7]=Arrow_west,
	Train_E_Sprite[8]=Arrow_east,
	Train_W_Sprite[8]=Arrow_west,
	Train_E_Sprite[9]=Arrow_west,
	Train_W_Sprite[9]=Arrow_east,
	Train_E_Sprite[10]=Arrow_north,
	Train_W_Sprite[10]=Arrow_south,
	Train_E_Sprite[11]=Arrow_east,
	Train_W_Sprite[11]=Arrow_west,
	Train_E_Sprite[12]=Arrow_east,
	Train_W_Sprite[12]=Arrow_west,

'**	Initialize colors to indicate cab assignments on blocks and sprites

	Cab_Color[0]=$RGB_FF0000,
	Cab_Color[1]=$RGB_2492FF,
	Cab_Color[2]=$RGB_008000,
	Cab_Color[3]=$RGB_005EBB,

'**	Initialize Cab Speed Pushbutton locations

	Cab1_Speed_Grid[10]=(59,4,4),
	Cab1_Speed_Grid[9]=(59,5,4),
	Cab1_Speed_Grid[8]=(59,6,4),
	Cab1_Speed_Grid[7]=(59,7,4),
	Cab1_Speed_Grid[6]=(59,8,4),
	Cab1_Speed_Grid[5]=(59,9,4),
	Cab1_Speed_Grid[4]=(59,10,4),
	Cab1_Speed_Grid[3]=(59,11,4),
	Cab1_Speed_Grid[2]=(59,12,4),
	Cab1_Speed_Grid[1]=(59,13,4),
	Cab1_Speed_Grid[0]=(59,14,4),
	Cab1_Brake_Grid=(59,16,4),	
	Cab1_F_R_Indication_Grid=(59,18,4),
	Cab1_Direction_Grid=(59,18,4),

	Cab2_Speed_Grid[10]=(61,4,4),
	Cab2_Speed_Grid[9]=(61,5,4),
	Cab2_Speed_Grid[8]=(61,6,4),
	Cab2_Speed_Grid[7]=(61,7,4),
	Cab2_Speed_Grid[6]=(61,8,4),
	Cab2_Speed_Grid[5]=(61,9,4),
	Cab2_Speed_Grid[4]=(61,10,4),
	Cab2_Speed_Grid[3]=(61,11,4),
	Cab2_Speed_Grid[2]=(61,12,4),
	Cab2_Speed_Grid[1]=(61,13,4),
	Cab2_Speed_Grid[0]=(61,14,4),
	Cab2_Brake_Grid=(61,16,4),	
	Cab2_F_R_Indication_Grid=(61,18,4),
	Cab2_Direction_Grid=(61,18,4),	

	Cab3_Speed_Grid[10]=(63,4,4),
	Cab3_Speed_Grid[9]=(63,5,4),
	Cab3_Speed_Grid[8]=(63,6,4),
	Cab3_Speed_Grid[7]=(63,7,4),
	Cab3_Speed_Grid[6]=(63,8,4),
	Cab3_Speed_Grid[5]=(63,9,4),
	Cab3_Speed_Grid[4]=(63,10,4),
	Cab3_Speed_Grid[3]=(63,11,4),
	Cab3_Speed_Grid[2]=(63,12,4),
	Cab3_Speed_Grid[1]=(63,13,4),
	Cab3_Speed_Grid[0]=(63,14,4),
	Cab3_Brake_Grid=(63,16,4),	
	Cab3_F_R_Indication_Grid=(63,18,4),
	Cab3_Direction_Grid=(63,18,4),

'**	Initialize Cab to Block Pushbutton locations

	cab0_Block_Grid[1]=(57,21,4),
	cab0_Block_Grid[2]=(57,22,4),
	cab0_Block_Grid[3]=(57,23,4),
	cab0_Block_Grid[4]=(57,24,4),
	cab0_Block_Grid[5]=(57,25,4),
	cab0_Block_Grid[6]=(57,26,4),
	cab0_Block_Grid[7]=(57,27,4),
	cab0_Block_Grid[8]=(57,28,4),
	cab0_Block_Grid[9]=(57,29,4),
	cab0_Block_Grid[10]=(57,30,4),
	cab0_Block_Grid[11]=(57,31,4),
	cab0_Block_Grid[12]=(57,32,4),

	cab1_Block_Grid[1]=(59,21,4),
	cab1_Block_Grid[2]=(59,22,4),
	cab1_Block_Grid[3]=(59,23,4),
	cab1_Block_Grid[4]=(59,24,4),
	cab1_Block_Grid[5]=(59,25,4),
	cab1_Block_Grid[6]=(59,26,4),
	cab1_Block_Grid[7]=(59,27,4),
	cab1_Block_Grid[8]=(59,28,4),
	cab1_Block_Grid[9]=(59,29,4),
	cab1_Block_Grid[10]=(59,30,4),
	cab1_Block_Grid[11]=(59,31,4),
	cab1_Block_Grid[12]=(59,32,4),

	cab2_Block_Grid[1]=(61,21,4),
	cab2_Block_Grid[2]=(61,22,4),
	cab2_Block_Grid[3]=(61,23,4),
	cab2_Block_Grid[4]=(61,24,4),
	cab2_Block_Grid[5]=(61,25,4),
	cab2_Block_Grid[6]=(61,26,4),
	cab2_Block_Grid[7]=(61,27,4),
	cab2_Block_Grid[8]=(61,28,4),
	cab2_Block_Grid[9]=(61,29,4),
	cab2_Block_Grid[10]=(61,30,4),
	cab2_Block_Grid[11]=(61,31,4),
	cab2_Block_Grid[12]=(61,32,4),

	cab3_Block_Grid[1]=(63,21,4),
	cab3_Block_Grid[2]=(63,22,4),
	cab3_Block_Grid[3]=(63,23,4),
	cab3_Block_Grid[4]=(63,24,4),
	cab3_Block_Grid[5]=(63,25,4),
	cab3_Block_Grid[6]=(63,26,4),
	cab3_Block_Grid[7]=(63,27,4),
	cab3_Block_Grid[8]=(63,28,4),
	cab3_Block_Grid[9]=(63,29,4),
	cab3_Block_Grid[10]=(63,30,4),
	cab3_Block_Grid[11]=(63,31,4),
	cab3_Block_Grid[12]=(63,32,4),

	cab0_All_Blocks_Grid=(57,20,4),
	cab1_All_Blocks_Grid=(59,20,4),
	cab2_All_Blocks_Grid=(61,20,4),
	cab3_All_Blocks_Grid=(63,20,4),


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


'**	Initial cab speed and direction so that: 
'		Occupancy will be detected at startup
'		Trains will initially be stopped to prevent mishaps

	index=1
	until index>3 quickloop
		*Cab_Speed_Pointer[index]=80
		*Cab_Direction_Pointer[index]=reverse
		*Cab_Brake_Pointer[index]=on

		index=+
	endloop
'

'**	Initialize cab speed and direction display on panel

	index=10
	UNTIL index<0 QUICKLOOP
		$color Track(cab1_Speed_Grid[index])=mygray
		$color Track(cab2_Speed_Grid[index])=mygray
		$color Track(cab3_Speed_Grid[index])=mygray
		index=-
	ENDLOOP

'**	Initialize all blocks to Cab[1] 'to detect occupancy and so trains are halted

'(59,22,4)	Assign_Cab_To_All_Blocks(1),	

'**	Detect occupancy at each block
'		Assign cab to corresponding block, then call subroutine
'		Call subroutine to Indicate cab assignment on panel by assigning cab color to block
'		Call Subroutine to Color occupied block track with cab color and draw occupied sprite 
'		IF block is not occupied, designate cab #0 to block

	Assign_Cab_To_All_Blocks(1)

	cabindex=1,
	blockindex=1,
	UNTIL blockindex=MaxblocksPlusOne QUICKLOOP,
		IF *CD_East_Pointer[blockindex]=occupied then,
			Block_Sprite[blockindex]=Arrow_East,
			Block_Cab[blockindex]=cabindex,
			Block_Color[blockindex]=cab_color[cabindex],
			Configure_Cab_To_Block(blockindex,cabindex),
			Block_occupancy_on (block_Grid[blockindex], Block_Color[blockindex], Train_E_Sprite[blockindex]),
			Assign_Cab_To_Block(cabindex,blockindex),
			cabindex = 1+,
		ELSE
			IF *CD_West_Pointer[blockindex]=on then,
				Block_Sprite[blockindex]=Arrow_West,
				Block_Cab[blockindex]=cabindex,
				Block_Color[blockindex]=cab_color[cabindex],
				Configure_Cab_To_Block(blockindex,cabindex),
				Block_occupancy_on (block_Grid[blockindex], Block_Color[blockindex], Train_W_Sprite[blockindex]),
				Assign_Cab_To_Block(cabindex,blockindex),
				cabindex = 1+,
			ELSE
				Block_Sprite[blockindex]=square,
				Block_occupancy_off(block_Grid[blockindex], Block_Color[blockindex], lock),
'				Assign_Cab_To_Block(1,blockindex),
			ENDIF
		ENDIF

		Holds_On_Blocks[blockindex] = NO_HOLD_ON_BLOCK
		blockindex = 1+,
	ENDLOOP,

	wait 3,

'**	Initialize all blocks to Cab[1] 'to detect occupancy and so trains are halted

'''	Assign_Cab_To_Block(1,1,maxblocks),	
	


'**************************** END OF INITIALIZATION *********************************
	init=1

'************************************************************************************
'					   MAIN PROGRAM							
'************************************************************************************


'********************************************************************		
'*** 	Detect activation of Cab to Block assignment buttons

'*	All Block assignments

WHEN $leftmouse=cab0_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(0)

WHEN $leftmouse=cab1_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(1)

WHEN $leftmouse=cab2_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(2)

WHEN $leftmouse=cab3_All_Blocks_Grid DO 
	Assign_Cab_To_All_Blocks(3)

'*	Individual Block assignments

WHEN $leftmouse=cab0_block_grid[BLOCKINDEX] DO
	Assign_Cab_To_Block(0,BlockIndex)

WHEN $leftmouse=cab1_block_grid[BLOCKINDEX] DO
	Assign_Cab_To_Block(1,BlockIndex)

WHEN $leftmouse=cab2_block_grid[BLOCKINDEX] DO
	Assign_Cab_To_Block(2,BlockIndex)
	
WHEN $leftmouse=cab3_block_grid[BLOCKINDEX] DO
	Assign_Cab_To_Block(3,BlockIndex)

ALWAYS DO
	IF BlockIndex<MaxBlocks then BlockIndex=+ 
	ELSE BLOCKINDEX=1
	ENDIF
		
'********************************************************************
'*** 	Detect activation of Cab Speed Buttons

	IF $leftmouse=(59-63,4-14,4) THEN 

		IF $leftmouse=cab1_Speed_grid[SpeedIndex] THEN
		Assign_Speed_To_Cab(1,SpeedIndex)

		ELSEIF $leftmouse=cab2_Speed_grid[SpeedIndex] THEN
		Assign_Speed_To_Cab(2,SpeedIndex)

		ELSEIF $leftmouse=cab3_Speed_grid[SpeedIndex] THEN
		Assign_Speed_To_Cab(3,SpeedIndex)
	
		ENDIF
	ENDIF

SUB Set_Clicked_Speed(CabIndex, MouseClickPosition{Local})
ENDSUB

'When $leftmouse=(59,4-14,4) DO
'	$Status="@$Leftmouse"
	
	' Cab1_Speed_Grid[Index]

When $LeftMouse = cab1_Speed_grid[0] DO Assign_Speed_To_Cab(1, 0)
When $LeftMouse = cab1_Speed_grid[1] DO Assign_Speed_To_Cab(1, 1)
When $LeftMouse = cab1_Speed_grid[2] DO Assign_Speed_To_Cab(1, 2)
When $LeftMouse = cab1_Speed_grid[3] DO Assign_Speed_To_Cab(1, 3)
When $LeftMouse = cab1_Speed_grid[4] DO Assign_Speed_To_Cab(1, 4)
When $LeftMouse = cab1_Speed_grid[5] DO Assign_Speed_To_Cab(1, 5)
When $LeftMouse = cab1_Speed_grid[6] DO Assign_Speed_To_Cab(1, 6)
When $LeftMouse = cab1_Speed_grid[7] DO Assign_Speed_To_Cab(1, 7)
When $LeftMouse = cab1_Speed_grid[8] DO Assign_Speed_To_Cab(1, 8)
When $LeftMouse = cab1_Speed_grid[9] DO Assign_Speed_To_Cab(1, 9)
When $LeftMouse = cab1_Speed_grid[10] DO Assign_Speed_To_Cab(1, 10)

When $LeftMouse = cab2_Speed_grid[0] DO Assign_Speed_To_Cab(2, 0)
When $LeftMouse = cab2_Speed_grid[1] DO Assign_Speed_To_Cab(2, 1)
When $LeftMouse = cab2_Speed_grid[2] DO Assign_Speed_To_Cab(2, 2)
When $LeftMouse = cab2_Speed_grid[3] DO Assign_Speed_To_Cab(2, 3)
When $LeftMouse = cab2_Speed_grid[4] DO Assign_Speed_To_Cab(2, 4)
When $LeftMouse = cab2_Speed_grid[5] DO Assign_Speed_To_Cab(2, 5)
When $LeftMouse = cab2_Speed_grid[6] DO Assign_Speed_To_Cab(2, 6)
When $LeftMouse = cab2_Speed_grid[7] DO Assign_Speed_To_Cab(2, 7)
When $LeftMouse = cab2_Speed_grid[8] DO Assign_Speed_To_Cab(2, 8)
When $LeftMouse = cab2_Speed_grid[9] DO Assign_Speed_To_Cab(2, 9)
When $LeftMouse = cab2_Speed_grid[10] DO Assign_Speed_To_Cab(2, 10)

When $LeftMouse = cab3_Speed_grid[0] DO Assign_Speed_To_Cab(3, 0)
When $LeftMouse = cab3_Speed_grid[1] DO Assign_Speed_To_Cab(3, 1)
When $LeftMouse = cab3_Speed_grid[2] DO Assign_Speed_To_Cab(3, 2)
When $LeftMouse = cab3_Speed_grid[3] DO Assign_Speed_To_Cab(3, 3)
When $LeftMouse = cab3_Speed_grid[4] DO Assign_Speed_To_Cab(3, 4)
When $LeftMouse = cab3_Speed_grid[5] DO Assign_Speed_To_Cab(3, 5)
When $LeftMouse = cab3_Speed_grid[6] DO Assign_Speed_To_Cab(3, 6)
When $LeftMouse = cab3_Speed_grid[7] DO Assign_Speed_To_Cab(3, 7)
When $LeftMouse = cab3_Speed_grid[8] DO Assign_Speed_To_Cab(3, 8)
When $LeftMouse = cab3_Speed_grid[9] DO Assign_Speed_To_Cab(3, 9)
When $LeftMouse = cab3_Speed_grid[10] DO Assign_Speed_To_Cab(3, 10)
	
'ALWAYS DO
'	IF SpeedIndex<11 then SpeedIndex=+ 
'	ELSE SpeedIndex=0
'	ENDIF

SUB Draw_Cab_Speeds(CabIndex, {Local} CurrentSpeedGrid[12], Index, Idx)
'	If CabIndex = 1 THEN Idx = 0, UNTIL Idx > 12 QUICKLOOP CurrentSpeedGrid[Index] = cab1_Speed_Grid[Idx], Idx = 1+ ENDLOOP ENDIF
'	If CabIndex = 2 THEN Idx = 0, UNTIL Idx > 12 QUICKLOOP CurrentSpeedGrid[Index] = cab2_Speed_Grid[Idx], Idx = 1+ ENDLOOP ENDIF
'	If CabIndex = 3 THEN Idx = 0, UNTIL Idx > 12 QUICKLOOP CurrentSpeedGrid[Index] = cab3_Speed_Grid[Idx], Idx = 1+ ENDLOOP ENDIF

	Index = 0
	UNTIL Index > 10 QUICKLOOP
		IF CabIndex = 1 THEN
			IF *Cab_Speed_Pointer[CabIndex] >= speed_Notch[Index] THEN
				$color Track(cab1_Speed_Grid[Index]) = Cab_Color[CabIndex]
			ELSE
				$color Track(cab1_Speed_Grid[Index]) = mygray
			ENDIF
		ENDIF

		IF CabIndex = 2 THEN
			IF *Cab_Speed_Pointer[CabIndex] >= speed_Notch[Index] THEN
				$color Track(cab2_Speed_Grid[Index]) = Cab_Color[CabIndex]
			ELSE
				$color Track(cab2_Speed_Grid[Index]) = mygray
			ENDIF
		ENDIF

		IF CabIndex = 3 THEN
			IF *Cab_Speed_Pointer[CabIndex] >= speed_Notch[Index] THEN
				$color Track(cab3_Speed_Grid[Index]) = Cab_Color[CabIndex]
			ELSE
				$color Track(cab3_Speed_Grid[Index]) = mygray
			ENDIF
		ENDIF

		Index = 1+
	ENDLOOP
'		NotchIndex=10,	
'		UNTIL NotchIndex=SpeedIndex QUICKLOOP,	
'			IF CabIndex=1 THEN
'				$color Track(cab1_Speed_Grid[NotchIndex])=mygray,
'			ELSEIF CabIndex=2 THEN
'				$color Track(cab2_Speed_Grid[NotchIndex])=mygray,
'			ELSEIF CabIndex=3 THEN
'				$color Track(cab3_Speed_Grid[NotchIndex])=mygray,
'			ENDIF
'			NotchIndex=-,
'		ENDLOOP,	
'			
'		NotchIndex=SpeedIndex,	
'		UNTIL NotchIndex=0 QUICKLOOP,	
'			IF CabIndex=1 THEN
'				$color Track(cab1_Speed_Grid[NotchIndex])=Cab_Color[1],
'			ELSEIF CabIndex=2 THEN
'				$color Track(cab2_Speed_Grid[NotchIndex])=Cab_Color[2],
'			ELSEIF CabIndex=3 THEN
'				$color Track(cab3_Speed_Grid[NotchIndex])=Cab_Color[3],
'			ENDIF
'			NotchIndex=-,
'		ENDLOOP
ENDSUB

WHEN Previous_Cab_Speed[1] <> *Cab_Speed_Pointer[1] DO
	Previous_Cab_Speed[1] = *Cab_Speed_Pointer[1]
	Draw_Cab_Speeds(1)
WHEN Previous_Cab_Speed[2] <> *Cab_Speed_Pointer[2] DO
	Previous_Cab_Speed[2] = *Cab_Speed_Pointer[2]
	Draw_Cab_Speeds(2)
WHEN Previous_Cab_Speed[3] <> *Cab_Speed_Pointer[3] DO
	Previous_Cab_Speed[3] = *Cab_Speed_Pointer[3]
	Draw_Cab_Speeds(3)

				
'********************************************************************			
'** 	Detect activation of pushbuttons for cab brake		
'**						

SUB Draw_Cab_Brake(CabIndex)
	IF CabIndex = 1 THEN
		IF *Cab_Brake_Pointer[1] = On THEN
			$Color Track(cab1_Brake_Grid) = red
		ELSE
			$Color Track(cab1_Brake_Grid) = black
		ENDIF
	ENDIF
	IF CabIndex = 2 THEN
		IF *Cab_Brake_Pointer[2] = On THEN
			$Color Track(cab2_Brake_Grid) = red
		ELSE
			$Color Track(cab2_Brake_Grid) = black
		ENDIF
	ENDIF
	IF CabIndex = 3 THEN
		IF *Cab_Brake_Pointer[3] = On THEN
			$Color Track(cab3_Brake_Grid) = red
		ELSE
			$Color Track(cab3_Brake_Grid) = black
		ENDIF
	ENDIF
			
ENDSUB

WHEN *Cab_Brake_Pointer[1] = on DO Draw_Cab_Brake(1)
WHEN *Cab_Brake_Pointer[1] = off DO Draw_Cab_Brake(1)
WHEN *Cab_Brake_Pointer[2] = on DO Draw_Cab_Brake(2)
WHEN *Cab_Brake_Pointer[2] = off DO Draw_Cab_Brake(2)
WHEN *Cab_Brake_Pointer[3] = on DO Draw_Cab_Brake(3)
WHEN *Cab_Brake_Pointer[3] = off DO Draw_Cab_Brake(3)
				
WHEN $leftmouse=cab1_Brake_Grid DO	
	*Cab_Brake_Pointer[1]=	*Cab_Brake_Pointer[1]~,
WHEN $leftmouse=cab2_Brake_Grid DO	
	*Cab_Brake_Pointer[2]=	*Cab_Brake_Pointer[2]~,
WHEN $leftmouse=cab3_Brake_Grid DO	
	*Cab_Brake_Pointer[3]=	*Cab_Brake_Pointer[3]~,
	
'********************************************************************			
'** 	Detect activation of pushbuttons for cab direction		
'**

SUB Draw_Cab_Direction(CabIndex)
	IF CabIndex = 1 THEN
		IF *Cab_Direction_Pointer[1] = forward THEN
			$Draw Sprite(Cab1_F_R_Indication_Grid)=Arrow_North in Green,
		ELSE
			$Draw Sprite(Cab1_F_R_Indication_Grid)=Arrow_South in Red,
		ENDIF
	ENDIF
	IF CabIndex = 2 THEN
		IF *Cab_Direction_Pointer[2] = forward THEN
			$Draw Sprite(Cab2_F_R_Indication_Grid)=Arrow_North in Green,
		ELSE
			$Draw Sprite(Cab2_F_R_Indication_Grid)=Arrow_South in Red,
		ENDIF
	ENDIF
	IF CabIndex = 3 THEN
		IF *Cab_Direction_Pointer[3] = forward THEN
			$Draw Sprite(Cab3_F_R_Indication_Grid)=Arrow_North in Green,
		ELSE
			$Draw Sprite(Cab3_F_R_Indication_Grid)=Arrow_South in Red,
		ENDIF
	ENDIF
			
ENDSUB

WHEN *Cab_Direction_Pointer[1] = forward DO Draw_Cab_Direction(1)
WHEN *Cab_Direction_Pointer[1] = reverse DO Draw_Cab_Direction(1)
WHEN *Cab_Direction_Pointer[2] = forward DO Draw_Cab_Direction(2)
WHEN *Cab_Direction_Pointer[2] = reverse DO Draw_Cab_Direction(2)
WHEN *Cab_Direction_Pointer[3] = forward DO Draw_Cab_Direction(3)
WHEN *Cab_Direction_Pointer[3] = reverse DO Draw_Cab_Direction(3)					
				
WHEN $leftmouse=cab1_Direction_Grid DO			
	*Cab_Direction_Pointer[1]=*Cab_Direction_Pointer[1]~,			
WHEN $leftmouse=cab2_Direction_Grid DO			
	*Cab_Direction_Pointer[2]=*Cab_Direction_Pointer[2]~,					
WHEN $leftmouse=cab3_Direction_Grid DO			
	*Cab_Direction_Pointer[3]=*Cab_Direction_Pointer[3]~,				
				
'********************************************************************			
'**	Detect activation of turnouts on panel or Turnout Micro Switches		
'		Call subroutine	
'			Left click changes tortoise direction, indicating diverging route with red on panel, main route with green		
		

'********************************************************************
'**	LOOP through East and West current detectors to determine block occupancy

SUB Release_Block_From_Movement(BlockIndex, BlockStep, ReleasingBlockIndex, EnablingCab)
'	BlockStep = Held_Blocks_With_Direction[BlockIndex], BlockStep = -1*, BlockStep = 2*
'	ReleasingBlockIndex = BlockIndex, ReleasingBlockIndex = BlockStep+
'	IF ReleasingBlockIndex <= 0 THEN ReleasingBlockIndex = 8+ ENDIF
'	IF ReleasingBlockIndex >= 9 THEN ReleasingBlockIndex = 8- ENDIF
'
'	Held_Blocks_With_Direction[ReleasingBlockIndex] = TRAVEL_DIRECTION_NONE
'
'	If Holds_On_Blocks[BlockIndex] <> -1 THEN
'		EnablingCab = Holds_On_Blocks[BlockIndex]
'		*Cab_Brake_Pointer[EnablingCab] = Off
'		Holds_On_Blocks[BlockIndex] = -1
'	ENDIF
'	Holds_On_Blocks[BlockIndex] = -1
'
''	$Status = "BlockIndex:@BlockIndex // ReleasingBlockIndex:@ReleasingBlockIndex"
ENDSUB

SUB Entered_East_Block(BlockIndex, BlockComingFromIndex, BlockGoingToIndex, CurrentCab)
'	BlockComingFromIndex = BlockIndex, BlockComingFromIndex = 1-, BlockComingFromIndex = 8#
'	If BlockComingFromIndex = 0 Then BlockComingFromIndex = 8 ENDIF
'	Assign_Cab_To_Block(Block_Cab[BlockComingFromIndex], BlockIndex)
'
'	Held_Blocks_With_Direction[BlockIndex] = TRAVEL_DIRECTION_EAST
'	Held_Blocks_With_Direction[BlockComingFromIndex] = TRAVEL_DIRECTION_EAST
''$Status = "Holding: @BlockIndex @BlockComingFromIndex"
'	'''Release_Block_From_Movement(BlockIndex)
'
'	block_occupancy_on(block_Grid[BlockIndex], Block_Color[BlockIndex], Train_E_Sprite[BlockIndex])
'	Block_Sprite[BlockIndex]=Arrow_East
'
'	'Hold Until Clear
'	BlockGoingToIndex = BlockIndex, BlockGoingToIndex = 1+, BlockGoingToIndex = 8#
'	IF BlockGoingToIndex = 0 THEN BlockGoingToIndex = 8 ENDIF
''$Status = "In @BlockIndex going to @BlockGoingToIndex"
'	If Held_Blocks_With_Direction[BlockGoingToIndex] <> 0 THEN
''$Status = "Holding in @BlockIndex for @BlockGoingToIndex"
'		CurrentCab = Block_Cab[BlockIndex]
'		*Cab_Brake_Pointer[CurrentCab] = On
'		Holds_On_Blocks[BlockGoingToIndex] = Block_Cab[BlockIndex]
'	ENDIF
ENDSUB
SUB Entered_West_Block(BlockIndex, BlockComingFromIndex, BlockGoingToIndex, CurrentCab)
'	BlockComingFromIndex = BlockIndex, BlockComingFromIndex = 1+, BlockComingFromIndex = 8#
'	IF BlockComingFromIndex = 0 THEN BlockComingFromIndex = 8 ENDIF
'	Assign_Cab_To_Block(Block_Cab[BlockComingFromIndex ], BlockIndex)
'
'	Held_Blocks_With_Direction[BlockIndex] = TRAVEL_DIRECTION_WEST
'	Held_Blocks_With_Direction[BlockComingFromIndex] = TRAVEL_DIRECTION_WEST
'	'''Release_Block_From_Movement(BlockIndex)
'
'	block_occupancy_on (block_Grid[BlockIndex], Block_Color[BlockIndex], Train_W_Sprite[BlockIndex])
'	Block_Sprite[BlockIndex] = Arrow_West
'
'	' Hold until clear
'	BlockGoingToIndex = BlockIndex, BlockGoingToIndex = 1-, BlockGoingToIndex = 8#
'	If BlockGoingToIndex = 0 Then BlockGoingToIndex= 8 ENDIF
'
ENDSUB
SUB Cleared_Block(BlockIndex)
'	Release_Block_From_Movement(BlockIndex)
'
'	block_occupancy_off(block_Grid[BlockIndex], Block_Color[BlockIndex])
'	Block_Sprite[BlockIndex] = Square
'	'Assign_Cab_To_Block(Block_Cab[BlockIndex], BlockIndex)
ENDSUB

SUB Block_Occupied_East(BlockIndex, {Local} BlockFromIndex, BlockToIndex, CurrentCab)
	Block_Status[BlockIndex] = BLOCK_TRAIN_TRAVELING_EAST
	
	block_occupancy_on(block_grid[BlockIndex], BLock_Color[BlockIndex], Train_E_Sprite[BlockIndex])
	Block_Sprite[BlockIndex]=Arrow_East
	
	IF BlockIndex > 8 THEN RETURN ENDIF

	BlockFromIndex = BlockIndex, BlockFromIndex = 1-
	If BlockFromIndex < 1 THEN BlockFromIndex = 8+ ENDIF
	IF init > 0 THEN Assign_Cab_To_Block(Block_Cab[BlockFromIndex], BlockIndex) ENDIF

	BlockToIndex = BlockIndex, BlockToIndex = 1+
	If BlockToIndex > 8 THEN BlockToIndex = 8- ENDIF
	IF Block_Status[BlockToIndex] = BLOCK_NOT_OCCUPIED THEN
		CurrentCab = Block_Cab[BlockIndex]
		Assign_Cab_To_Block(CurrentCab, BlockToIndex)
	ELSE
		CurrentCab = Block_Cab[BlockIndex]
		*Cab_Brake_Pointer[CurrentCab] = On
		Holds_On_Blocks[BlockToIndex] = CurrentCab
	ENDIF	
ENDSUB

SUB Block_Unoccupied(BlockIndex, {Local} BlockPreviousIndex)
	block_occupancy_off(block_Grid[BlockIndex], Block_Color[BlockIndex])
	Block_Sprite[BlockIndex] = Square
	
	IF BlockIndex > 8 THEN RETURN ENDIF

	IF Block_Status[BlockIndex] = BLOCK_TRAIN_TRAVELING_EAST THEN
		Block_Status[BlockIndex] = BLOCK_VACATED_EAST

		BlockPreviousIndex = BlockIndex, BlockPreviousIndex = 1-
		IF BlockPreviousIndex < 1 THEN BlockPreviousIndex = 8+ ENDIF
		If Block_Status[BlockPreviousIndex] = BLOCK_VACATED_EAST or Block_Status[BlockPreviousIndex] = BLOCK_VACATED_WEST THEN
			Block_Status[BlockPreviousIndex] = BLOCK_NOT_OCCUPIED
		ENDIF
	ENDIF
ENDSUB

SUB Release_Hold_On_Block(BlockIndex, {Local} CurrentCab)
	CurrentCab = Holds_On_Blocks[BlockIndex]
	*Cab_Brake_Pointer[CurrentCab] = Off
	Holds_On_Blocks[BlockIndex] = NO_HOLD_ON_BLOCK
	Assign_Cab_To_Block(CurrentCab, BlockIndex)
ENDSUB

WHEN *CD_East_Pointer[1]=occupied DO
	Block_Occupied_East(1)
WHEN *CD_West_Pointer[1]=occupied DO
	Entered_West_Block(1)
WHEN *CD_East_Pointer[1]=vacant and *CD_West_Pointer[1]=vacant DO
	Block_Unoccupied(1)
WHEN Block_status[1] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[1] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(1) ENDIF

WHEN *CD_East_Pointer[2]=occupied DO
	Block_Occupied_East(2)
WHEN *CD_West_Pointer[2]=occupied DO
	Entered_West_Block(2)
WHEN *CD_East_Pointer[2]=vacant, *CD_West_Pointer[2]=vacant DO
	Block_Unoccupied(2)
WHEN Block_status[2] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[2] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(2) ENDIF

WHEN *CD_East_Pointer[3]=occupied DO
	Block_Occupied_East(3)
WHEN *CD_West_Pointer[3]=occupied DO
	Entered_West_Block(3)
WHEN *CD_East_Pointer[3]=vacant, *CD_West_Pointer[3]=vacant DO
	Block_Unoccupied(3)
WHEN Block_status[3] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[3] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(3) ENDIF

WHEN *CD_East_Pointer[4]=occupied DO
	Block_Occupied_East(4)
WHEN *CD_West_Pointer[4]=occupied DO
	Entered_West_Block(4)
WHEN *CD_East_Pointer[4]=vacant, *CD_West_Pointer[4]=vacant DO
	Block_Unoccupied(4)
WHEN Block_status[4] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[4] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(4) ENDIF

WHEN *CD_East_Pointer[5]=occupied DO
	Block_Occupied_East(5)
WHEN *CD_West_Pointer[5]=occupied DO
	Entered_West_Block(5)
WHEN *CD_East_Pointer[5]=vacant, *CD_West_Pointer[5]=vacant DO
	Block_Unoccupied(5)
WHEN Block_status[5] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[5] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(5) ENDIF

WHEN *CD_East_Pointer[6]=occupied DO
	Block_Occupied_East(6)
WHEN *CD_West_Pointer[6]=occupied DO
	Entered_West_Block(6)
WHEN *CD_East_Pointer[6]=vacant, *CD_West_Pointer[6]=vacant DO
	Block_Unoccupied(6)
WHEN Block_status[6] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[6] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(6) ENDIF

WHEN *CD_East_Pointer[7]=occupied DO
	Block_Occupied_East(7)
WHEN *CD_West_Pointer[7]=occupied DO
	Entered_West_Block(7)
WHEN *CD_East_Pointer[7]=vacant, *CD_West_Pointer[7]=vacant DO
	Block_Unoccupied(7)
WHEN Block_status[7] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[7] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(7) ENDIF

WHEN *CD_East_Pointer[8]=occupied DO
	Block_Occupied_East(8)
WHEN *CD_West_Pointer[8]=occupied DO
	Entered_West_Block(8)
WHEN *CD_East_Pointer[8]=vacant, *CD_West_Pointer[8]=vacant DO
	Block_Unoccupied(8)
WHEN Block_status[8] = BLOCK_NOT_OCCUPIED DO
	IF Holds_on_blocks[8] <> NO_HOLD_ON_BLOCK THEN Release_Hold_On_Block(8) ENDIF
	
WHEN *CD_East_Pointer[9]=occupied DO
	Block_Occupied_East(9)
WHEN *CD_West_Pointer[9]=occupied DO
	Entered_West_Block(9)
WHEN *CD_East_Pointer[9]=vacant, *CD_West_Pointer[9]=vacant DO
	Block_Unoccupied(9)
	
WHEN *CD_East_Pointer[10]=occupied DO
	Block_Occupied_East(10)
WHEN *CD_West_Pointer[10]=occupied DO
	Entered_West_Block(10)
WHEN *CD_East_Pointer[10]=vacant, *CD_West_Pointer[10]=vacant DO
	Block_Unoccupied(10)
	
WHEN *CD_East_Pointer[11]=occupied DO
	Block_Occupied_East(11)
WHEN *CD_West_Pointer[11]=occupied DO
	Entered_West_Block(11)
WHEN *CD_East_Pointer[11]=vacant, *CD_West_Pointer[11]=vacant DO
	Block_Unoccupied(11)
	
WHEN *CD_East_Pointer[12]=occupied DO
	$Status = "east 12"
	Block_Occupied_East(12)
WHEN *CD_West_Pointer[12]=occupied DO
	Entered_West_Block(12)
WHEN *CD_East_Pointer[12]=vacant, *CD_West_Pointer[12]=vacant DO
	$Status="clear 12"
	Block_Unoccupied(12)