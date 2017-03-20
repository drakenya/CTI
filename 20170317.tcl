
'***********************************************************************************
'														*
'						DECLARATIONS						*
'														*
'************************************************************************************

CONSTANTS:
	INITIALIZING=0
	OPERATING=1	

	INITIAL_BLOCK_INDEX=1
	MAX_BLOCK=12		'* Max number of blocks for LOOPs, etc
	MAX_BLOCK_INDEX=13

	INITIAL_IR_EOT_DETECTOR=1
	MAX_IR_EOT_DETECTOR=2
	MAX_IR_EOT_DETECTOR_INDEX=3

	INITIAL_TURNOUT_INDEX=1
	MAX_TURNOUT=18
	MAX_TURNOUT_INDEX=19

	MANUAL_CAB_INDEX = 0
	INITIAL_CAB_INDEX = 1
	MAX_CAB=3
	MAX_CAB_INDEX=4

	MAX_CAB_SPEED_INDEX=12
	MAX_SPEED_NOTCH_INDEX=11	
	SPEED_NOTCH_INCREMENT=6

	TURNOUT_NORMAL=off			'* Turnout Normal (green)  position of turnout
	TURNOUT_DIVERGING=on			'* Turnout DIVERGing(red) position of turnout

	TORTOISE=1					'* Turnout Types
	ATLAS=2

	DETECTOR_BLOCK_OCCUPIED=true		'* For block occupancy
	DETECTOR_BLOCK_VACANT=false		'* For block occupancy

	BLOCK_STATUS_VACANT=0
	BLOCK_STATUS_OCCUPIED_EAST=1
	BLOCK_STATUS_OCCUPIED_WEST=2

	COLOR_UNSELECTED_SPEED=$RGB_DFDFDF	'* Color for unselected speed buttons
	COLOR_MANUAL_CAB=$RGB_FF0000
	COLOR_CAB_1=$RGB_2492FF
	COLOR_CAB_2=$RGB_008000
	COLOR_CAB_3=$RGB_005EBB
	COLOR_BRAKE_ON = Red
	COLOR_BRAKE_OFF = Black
	COLOR_DIRECTION_FORWARD = Green
	COLOR_DIRECTION_REVERSE = Red

	ICON_DIRECTION_FORWARD = Arrow_North
	ICON_DIRECTION_REVERSE = Arrow_South

'***********************************************************************************
'					NETWORK MODULE DECLARATIONS
'***********************************************************************************

' Naming conventions:
'	Chars 1-3 		(UC): Module ID (Type and Port type) [ex. D8C Dash8 Control; TBS TrainBrain Sensor]
'	Char 4		"_" Separator 
'	Chars 5-7		(UP, UP, LC): Board ID (Type And #) (PB=Power Cab; BC=Block Control; TC=Turnout Control; DE=Detectors
'	Char 8		(NUM): Module position on board
'	Char 9		"_" Separator 
'	Chars 10-11 	(NUM): Port #
	
'''''''''''
''''''''''' Power Board "a"
'''''''''''

SMARTCABS: 	SCP_PBa1_01, SCP_PBa1_02, SCP_PBa1_03 	'Network Modules 1-3

'''''''''''
''''''''''' Turnout Control Board "a"
'''''''''''

' YardMaster "a1"
'CONTROLS:	YMC_TCa1_01, YMC_TCa1_02, YMC_TCa1_03, YMC_TCa1_04, YMC_TCa1_05, YMC_TCa1_06, YMC_TCa1_07,YMC_TCa1_08, 
'		YMC_TCa1_09, YMC_TCa1_10, YMC_TCa1_11, YMC_TCa1_12, YMC_TCa1_13, YMC_TCa1_14, YMC_TCa1_15, YMC_TCa1_16

' Sentry "a2"
'SENSORS:	SES_TCa2_01, SES_TCa2_02, SES_TCa2_03, SES_TCa2_04, SES_TCa2_05, SES_TCa2_06, SES_TCa2_07,SES_TCa2_08, 
'		SES_TCa2_09, SES_TCa2_10, SES_TCa2_11, SES_TCa2_12, SES_TCa2_13, SES_TCa2_14, SES_TCa2_15, SES_TCa2_16



'''''''''''
''''''''''' Block Control board "a"
'''''''''''

' Train Brain "a1"
CONTROLS: 	TBC_BCa1_01, TBC_BCa1_02, TBC_BCa1_03, TBC_BCa1_04
SENSORS:	TBS_BCa1_01_8E#, TBS_BCa1_02#, TBS_BCa1_03_1E#, TBS_BCa1_04# 

' Train Brain "a2"
CONTROLS: 	TBC_BCa2_01, TBC_BCa2_02, TBC_BCa2_03, TBC_BCa2_04
SENSORS:	TBS_BCa2_01_5E#, TBS_BCa2_02#, TBS_BCa2_03_9E#, TBS_BCa2_04#

'Dash-8 "a3"
CONTROLS:	D8C_BCa3_01, D8C_BCa3_02, D8C_BCa3_03, D8C_BCa3_04, D8C_BCa3_05, D8C_BCa3_06, D8C_BCa3_07, D8C_BCa3_08



'''''''''''
''''''''''' Atlas Turnout Control Board "a"
'''''''''''

' Switchman "a1"
'CONTROLS:	SMC_TCa1_01, SMC_TCa1_02, SMC_TCa1_03, SMC_TCa1_04, SMC_TCa1_05, SMC_TCa1_06, SMC_TCa1_07,SMC_TCa1_08, 
'		SMC_TCa1_09, SMC_TCa1_10, SMC_TCa1_11, SMC_TCa1_12, SMC_TCa1_13, SMC_TCa1_14, SMC_TCa1_15, SMC_TCa1_16



'''''''''''
''''''''''' Block Control board "b"
'''''''''''

' Train Brain "b1"
CONTROLS: 	TBC_BCb1_01, TBC_BCb1_02, TBC_BCb1_03, TBC_BCb1_04
SENSORS:	TBS_BCb1_01_7E#, TBS_BCb1_02#, TBS_BCb1_03_11E#, TBS_BCb1_04# 

' Train Brain "b2"
CONTROLS: 	TBC_BCb2_01, TBC_BCb2_02, TBC_BCb2_03, TBC_BCb2_04
SENSORS:	TBS_BCb2_01_4E#, TBS_BCb2_02#, TBS_BCb2_03_12E#, TBS_BCb2_04#

'Dash-8 "b3"
CONTROLS:	D8C_BCb3_01, D8C_BCb3_02, D8C_BCb3_03, D8C_BCb3_04, D8C_BCb3_05, D8C_BCb3_06, D8C_BCb3_07, D8C_BCb3_08

'''''''''''
''''''''''' Block Control board "c"
'''''''''''

' Train Brain "c1"
CONTROLS: 	TBC_BCc1_01, TBC_BCc1_02, TBC_BCc1_03, TBC_BCc1_04
SENSORS:	TBS_BCc1_01_2E#, TBS_BCc1_02#, TBS_BCc1_03_6E#, TBS_BCc1_04# 

' Trcin Brcin "c2"
CONTROLS: 	TBC_BCc2_01, TBC_BCc2_02, TBC_BCc2_03, TBC_BCc2_04
SENSORS:	TBS_BCc2_01_10E#, TBS_BCc2_02#, TBS_BCc2_03_3E#, TBS_BCc2_04#

'Dash-8 "c3"
CONTROLS:	D8C_BCc3_01, D8C_BCc3_02, D8C_BCc3_03, D8C_BCc3_04, D8C_BCc3_05, D8C_BCc3_06, D8C_BCc3_07, D8C_BCc3_08


'''''''''''
''''''''''' Turnout Control Board "b"
'''''''''''

' YardMaster "b1"
'CONTROLS:	YMC_TCb1_01, YMC_TCb1_02, YMC_TCb1_03, YMC_TCb1_04, YMC_TCb1_05, YMC_TCb1_06, YMC_TCb1_07,YMC_TCb1_08, 
'		YMC_TCb1_09, YMC_TCb1_10, YMC_TCb1_11, YMC_TCb1_12, YMC_TCb1_13, YMC_TCb1_14, YMC_TCb1_15, YMC_TCb1_16

' Sentry "b2"
'SENSORS:	SES_TCb2_01, SES_TCb2_02, SES_TCb2_03, SES_TCb2_04, SES_TCb2_05, SES_TCb2_06, SES_TCb2_07,SES_TCb2_08, 
'		SES_TCb2_09, SES_TCb2_10, SES_TCb2_11, SES_TCb2_12, SES_TCb2_13, SES_TCb2_14, SES_TCb2_15, SES_TCb2_16


'''''''''''
''''''''''' Detection Board "a"
'''''''''''

' Sentry "1"
'SENSORS:	SES_DTa1_01, SES_DTa1_02, SES_DTa1_03, SES_DTa1_04, SES_DTa1_05, SES_DTa1_06, SES_DTa1_07,SES_DTa1_08, 
'		SES_DTa1_09, SES_DTa1_10, SES_DTa1_11, SES_DTa1_12, SES_DTa1_13, SES_DTa1_14, SES_DTa1_15, SES_DTa1_16

'''''''''''
''''''''''' Detection Board "b"
'''''''''''

' Sentry "1"
'SENSORS:	SES_DTb1_01, SES_DTb1_02, SES_DTb1_03, SES_DTb1_04, SES_DTb1_05, SES_DTb1_06, SES_DTb1_07,SES_DTb1_08, 
'		SES_DTb1_09, SES_DTb1_10, SES_DTb1_11, SES_DTb1_12, SES_DTb1_13, SES_DTb1_14, SES_DTb1_15, SES_DTb1_16

'***********************************************************************************
'						VARIABLES
'***********************************************************************************

VARIABLES:

' Holds address of controls for assigning cabs to blocks
	CAB_AorB_Pointer[MAX_BLOCK_INDEX]
	CAB_CorD_Pointer[MAX_BLOCK_INDEX]
	CAB_ABorCD_Pointer[MAX_BLOCK_INDEX]

' Holds addresses of Current Detector Sensors for each block
	CD_East_Pointer[MAX_BLOCK_INDEX]
	CD_West_Pointer[MAX_BLOCK_INDEX]


' Holds address for Turnout Machine controls
	Turnout_Pointer[MAX_TURNOUT_INDEX]

' Holds address of Sensors for Manual turnout buttons
	Turnout_Button_Pointer[MAX_TURNOUT_INDEX]

' Holds address of Controls for Atlas turnouts
	Atlas_Turnout_Pointer_Normal[MAX_TURNOUT_INDEX]
	Atlas_Turnout_Pointer_DIVERGING[MAX_TURNOUT_INDEX]
	Atlas_Turnout_LED_Pointer_Normal[MAX_TURNOUT_INDEX]
	Atlas_Turnout_LED_Pointer_DIVERGING[MAX_TURNOUT_INDEX]	

' Holds address of 3 smart cabs and their functions (cab[0] is placeholder for manual cab and functions)
	Cab_Pointer[MAX_CAB_INDEX]
	Cab_Speed_Pointer[MAX_CAB_INDEX]		'* holds address for speed for each cab
	Cab_Direction_Pointer[MAX_CAB_INDEX]		'* holds address for direction for each cab
	Cab_Momentum_Pointer[MAX_CAB_INDEX]		'* Holds address formomentum for each cab
	Cab_Brake_Pointer[MAX_CAB_INDEX]		'* Holds address for brake for each cab

' Indexes for loops
	BlockIndex ' BIndex
	SpeedIndex ' SIndex
	OccupancyIndex
	IR_Detector_Index		'LOOP counter for checking IR detectors status 
	CurrentSensorIndex 	'LOOP counter for checking current sensors status
	QueryIndex
	CabAssignIndex
	TurnoutIndex
	CabIndex ' CIndex
	NotchIndex
	index

	InitStatus
' Status holders
	Turnout_Status[MAX_TURNOUT_INDEX]	'holds status of each turnout
	Block_Status[MAX_BLOCK_INDEX] 'BStatus
	Block_Cab[MAX_BLOCK_INDEX]		'* holds cab assignment for each block
'	OccupyEast[MAX_BLOCK_INDEX]		'* holds status of current sensors
'	OccupyWest[MAX_BLOCK_INDEX]		'* holds status of current sensors

	Turnout_Type[MAX_TURNOUT_INDEX]
	
	Dcc_Cab_Pointer[MAX_CAB_INDEX]
	Previous_Dcc_Cab_Speed[MAX_CAB_INDEX]

'* Arrays to hold Grid coordinates for panel display
	Block_Grid[MAX_BLOCK_INDEX]
	Turnout_Grid[MAX_TURNOUT_INDEX]
		
	IR_Detector_Grid_E[MAX_BLOCK_INDEX]
	IR_Detector_Grid_W[MAX_BLOCK_INDEX]
	IR_EOT_Detector_Grid[MAX_IR_EOT_DETECTOR_INDEX]
	
	Cab1_Speed_Grid[MAX_CAB_SPEED_INDEX]
	Cab1_Brake_Grid
	Cab1_F_R_Indication_Grid		
	Cab1_Direction_Grid
	Cab2_Speed_Grid[MAX_CAB_SPEED_INDEX]
	Cab2_Brake_Grid
	Cab2_F_R_Indication_Grid		
	Cab2_Direction_Grid
	Cab3_Speed_Grid[MAX_CAB_SPEED_INDEX]
	Cab3_Brake_Grid
	Cab3_F_R_Indication_Grid		
	Cab3_Direction_Grid

	cab0_Block_Grid[MAX_BLOCK_INDEX]		
	cab1_Block_Grid[MAX_BLOCK_INDEX]
	cab2_Block_Grid[MAX_BLOCK_INDEX]
	cab3_Block_Grid[MAX_BLOCK_INDEX]

	cab0_All_Blocks_Grid
	cab1_All_Blocks_Grid
	cab2_All_Blocks_Grid
	cab3_All_Blocks_Grid



	
'* Arrays to hold Colors & Shapes for panel display
	Cab_Color[MAX_CAB_INDEX]
	Block_Color[MAX_BLOCK_INDEX]
	Block_Sprite[MAX_BLOCK_INDEX]
	Train_E_Sprite[MAX_BLOCK_INDEX]
	Train_W_Sprite[MAX_BLOCK_INDEX]
	IR_Detector_Shape_E[MAX_BLOCK_INDEX]
	IR_Detector_Shape_W[MAX_BLOCK_INDEX]
	IR_EOT_Detector_Shape[MAX_IR_EOT_DETECTOR]




'* Speed Control
	Previous_Cab_Speed[MAX_CAB]
	Speed_Notch[MAX_SPEED_NOTCH_INDEX]		'* holds throttle speeds for each step		



'************************************************************************************
'														*
'						ACTIONS							*
'														*
'************************************************************************************
ACTIONS:


'************************************************************************************
'					   SUB ROUTINES 							
'************************************************************************************

'******** 	Indicate Block occupancy change on panel

' 	Occupied
SUB Block_occupancy_off(block_Grid,Block_Color)
	$Color Block (block_Grid) = black
	$Draw Sprite (block_Grid) = Lock in Block_Color
ENDSUB


SUB Block_occupancy_on(block_Grid,block_color,sprite_shape)
	$Color Block(block_Grid) = block_color
	$Draw Sprite(block_Grid) = sprite_shape in Block_Color
ENDSUB

' 	Vacant


		
'******** 	Configures TrainBrain Controls to assign proper cab to designated block
'			Also assigns Cab color to designated block for panel displays

SUB Configure_Cab_To_Block(BNum, CNum)
	IF CNum >= MAX_CAB_INDEX THEN Return

	ELSEIF CNum = MANUAL_CAB_INDEX then
		*Cab_AorB_Pointer[BNum] = off
		*Cab_ABorCD_Pointer[BNum] = off

	ELSEIF CNum = 1 then
		*Cab_AorB_Pointer[BNum] = on
		*Cab_ABorCD_Pointer[BNum] = off

	ELSEIF CNum = 2 then
		*Cab_CorD_Pointer[BNum] = off
		*Cab_ABorCD_Pointer[BNum] = on

	ELSEIF CNum = 3 then
		*Cab_CorD_Pointer[BNum] = on
		*Cab_ABorCD_Pointer[BNum] = on
	ENDIF

	Block_Color[BNum] = Cab_Color[CNum]
ENDSUB



'******** 	Assign selected cab to designated blocks)
'			Calls subroutine to configure corresponding trainbrain controls
'			Colors block sprite with selected cab color
'			Colors selected block buttons with selected cab color and shape on panel

SUB Assign_Cab_To_Block(CIndex,BIndex,BStatus)
	Block_Cab[BIndex]=CIndex
	Configure_Cab_To_Block(BIndex,CIndex)
	$Color Sprite(Block_Grid[BIndex])=Cab_Color[CIndex]
	Block_Color[BIndex]=Cab_Color[CIndex]

	IF BStatus=BLOCK_STATUS_OCCUPIED_EAST OR BStatus=BLOCK_STATUS_OCCUPIED_WEST THEN $color Block(Block_Grid[BIndex]) = Block_Color[BIndex],
	ELSEIF BStatus=BLOCK_STATUS_VACANT THEN $color Block(Block_Grid[BIndex]) = BLACK,
	ENDIF,

	IF CIndex=0 THEN $Draw Sprite(cab0_Block_Grid[BIndex])=Block_Sprite[BIndex] in Cab_Color[0]
	ELSE $DRAW SPRITE(cab0_Block_Grid[BIndex])=SQUARE in COLOR_UNSELECTED_SPEED
	ENDIF

	IF CIndex=1 THEN $Draw Sprite(cab1_Block_Grid[BIndex])=Block_Sprite[BIndex] in Cab_Color[1]
	ELSE $DRAW SPRITE(cab1_Block_Grid[BIndex])=SQUARE in COLOR_UNSELECTED_SPEED
	ENDIF

	IF CIndex=2 THEN $Draw Sprite(cab2_Block_Grid[BIndex])=Block_Sprite[BIndex] in Cab_Color[2]
	ELSE $DRAW SPRITE(cab2_Block_Grid[BIndex])=SQUARE in COLOR_UNSELECTED_SPEED
	ENDIF

	IF CIndex=3 THEN $Draw Sprite(cab3_Block_Grid[BIndex])=Block_Sprite[BIndex] in Cab_Color[3]
	ELSE $DRAW SPRITE(cab3_Block_Grid[BIndex])=SQUARE in COLOR_UNSELECTED_SPEED
	ENDIF
ENDSUB

SUB Assign_Cab_To_All_Blocks(CIndex, {Local} I)
	I = INITIAL_BLOCK_INDEX

	UNTIL I >= MAX_BLOCK_INDEX QUICKLOOP
		Assign_Cab_To_Block(CIndex, I)
		I = 1 +
	ENDLOOP
ENDSUB


'******** 	Assign selected speed to cab

SUB Assign_Speed_To_Cab(CIndex,SIndex)
	*Cab_Speed_Pointer[CIndex] = Speed_Notch[SIndex], 'Set Actual cab speed
ENDSUB

' *******Initialization Sub Routines **********************

'**	Initialize Cab Speed Button Notch Values

SUB Initialize_Speed_Index({Local} SIndex, CurrentSpeed)
	CurrentSpeed = 0
	SIndex = 0

	UNTIL SIndex >= MAX_SPEED_NOTCH_INDEX QUICKLOOP
		Speed_Notch[SIndex] = CurrentSpeed
		CurrentSpeed = SPEED_NOTCH_INCREMENT +
		SIndex = 1 +
	ENDLOOP
ENDSUB

SUB Initialize_Cab_Status()
	*Cab_Brake_Pointer[1]=on
	Assign_Speed_To_Cab(1)
	*Cab_Direction_Pointer[1]=forward

	*Cab_Brake_Pointer[2]=on
	Assign_Speed_To_Cab(2,1)
	*Cab_Direction_Pointer[2]=forward
	
	*Cab_Brake_Pointer[3]=on
	Assign_Speed_To_Cab(3,1)
	*Cab_Direction_Pointer[3]=forward
ENDSUB

SUB Initialize_Cab_Speed_And_Direction_On_Display({Local} I)
	I = 0
	UNTIL I >= MAX_CAB_SPEED_INDEX QUICKLOOP
		$color Track(cab1_Speed_Grid[I]) = COLOR_UNSELECTED_SPEED
		$color Track(cab2_Speed_Grid[I]) = COLOR_UNSELECTED_SPEED
		$color Track(cab3_Speed_Grid[I]) = COLOR_UNSELECTED_SPEED

		I = 1 +
	ENDLOOP
ENDSUB

SUB Initialize_Cab_Direction_Display()
	$Color Track(cab1_Brake_Grid)=red
	$Draw Sprite(cab1_F_R_Indication_grid)=Arrow_North in Green

	$Color Track(cab2_Brake_Grid)=red
	$Draw Sprite(cab2_F_R_Indication_grid)=Arrow_North in Green

	$Color Track(cab3_Brake_Grid)=red
	$Draw Sprite(cab3_F_R_Indication_grid)=Arrow_North in Green
ENDSUB

SUB Initialize_Detect_Initial_Blocks({Local} CIndex, BIndex)
	CIndex = INITIAL_CAB_INDEX
	BIndex = INITIAL_BLOCK_INDEX

	UNTIL BIndex = MAX_BLOCK_INDEX QUICKLOOP
		IF *CD_East_Pointer[BIndex]=on then
			Block_Sprite[BIndex]=Arrow_East
			Block_Cab[BIndex]=CIndex
			Block_Color[BIndex]=cab_color[CIndex]
			Configure_Cab_To_Block(BIndex,CIndex)
			Block_occupancy_on (block_Grid[BIndex], Block_Color[BIndex], Train_E_Sprite[BIndex])
			Block_Status[BIndex]=BLOCK_STATUS_OCCUPIED_EAST
			Assign_Cab_To_Block(CIndex ,BIndex,BLOCK_STATUS_OCCUPIED_EAST)

			CIndex = 1+
		ELSE
			Block_Sprite[BIndex]=square
			Block_occupancy_off(block_Grid[BIndex], Block_Color[BIndex], lock)
			Assign_Cab_To_Block(CIndex ,BLOCK_STATUS_VACANT)
			Block_Status[BIndex]=BLOCK_STATUS_VACANT
		ENDIF

		BIndex=+
	ENDLOOP
ENDSUB

SUB Initialize_Set_All_Turnouts_To_Normal({Local} TIndex)
	TIndex = INITIAL_TURNOUT_INDEX
	UNTIL TIndex >= MAX_TURNOUT_INDEX LOOP
		$Switch(TurnOut_Grid[TIndex])=TURNOUT_NORMAL
		IF Turnout_Type[TIndex]=TORTOISE THEN
			*Turnout_Pointer[TIndex]=TURNOUT_NORMAL
		ELSEIF Turnout_Type[TIndex]=ATLAS THEN
			*Atlas_Turnout_Pointer_Normal[TIndex]=PULSE 0.1
		ENDIF
		Turnout_Status[TIndex]=TURNOUT_NORMAL

		TIndex = 1+
	ENDLOOP
ENDSUB
	

	
'************************************************************************************
'					   INITIALIZATION							
'************************************************************************************

WHEN InitStatus=INITIALIZING do '(All lines must end in a comma to continue the initialization chain)

' set address pointers to cab selection controllers
''	board "a",
	CAB_AorB_Pointer[8]=&TBC_BCa1_01, CAB_AorB_Pointer[1]=&TBC_BCa1_02, CAB_AorB_Pointer[5]=&TBC_BCa1_03, CAB_AorB_Pointer[9]=&TBC_BCa1_04,
	CAB_CorD_Pointer[8]=&TBC_BCa2_01, CAB_CorD_Pointer[1]=&TBC_BCa2_02, CAB_CorD_Pointer[5]=&TBC_BCa2_03, CAB_CorD_Pointer[9]=&TBC_BCa2_04,
	CAB_ABorCD_Pointer[8]=&D8C_BCa3_01, CAB_ABorCD_Pointer[1]=&D8C_BCa3_02, CAB_ABorCD_Pointer[5]=&D8C_BCa3_03, CAB_ABorCD_Pointer[9]=&D8C_BCa3_04,
	' SPARE=&D8C_BCa3_05, SPARE=&D8C_BCa3_06, SPARE=&D8C_BCa3_07, SPARE=&D8C_BCa3_08,

''	board "b"
	CAB_AorB_Pointer[7]=&TBC_BCb1_01, CAB_AorB_Pointer[11]=&TBC_BCb1_02, CAB_AorB_Pointer[4]=&TBC_BCb1_03, CAB_AorB_Pointer[12]=&TBC_BCb1_04,
	CAB_CorD_Pointer[7]=&TBC_BCb2_01, CAB_CorD_Pointer[11]=&TBC_BCb2_02, CAB_CorD_Pointer[4]=&TBC_BCb2_03, CAB_CorD_Pointer[12]=&TBC_BCb2_04,
	CAB_ABorCD_Pointer[7]=&D8C_BCb3_01, CAB_ABorCD_Pointer[11]=&D8C_BCb3_02, CAB_ABorCD_Pointer[4]=&D8C_BCb3_03, CAB_ABorCD_Pointer[12]=&D8C_BCb3_04,
	' SPARE=&D8C_BCb3_05, SPARE=&D8C_BCb3_06, SPARE=&D8C_BCb3_07, SPARE=&D8C_BCb3_08,

''	board "c"
	CAB_AorB_Pointer[2]=&TBC_BCc1_01, CAB_AorB_Pointer[6]=&TBC_BCc1_02, CAB_AorB_Pointer[10]=&TBC_BCc1_03, CAB_AorB_Pointer[3]=&TBC_BCc1_04,
	CAB_CorD_Pointer[2]=&TBC_BCc2_01, CAB_CorD_Pointer[6]=&TBC_BCc2_02, CAB_CorD_Pointer[10]=&TBC_BCc2_03, CAB_CorD_Pointer[3]=&TBC_BCc2_04,
	CAB_ABorCD_Pointer[2]=&D8C_BCc3_01, CAB_ABorCD_Pointer[6]=&D8C_BCc3_02, CAB_ABorCD_Pointer[10]=&D8C_BCc3_03, CAB_ABorCD_Pointer[3]=&D8C_BCc3_04,
	' SPARE=&D8C_BCc3_05, SPARE=&D8C_BCc3_06, SPARE=&D8C_BCc3_07, SPARE=&D8C_BCc3_08,


' set address pointers to Current Detector Sensors
''	board "a"
	CD_East_Pointer[8]=&TBS_BCa1_01_8E, CD_West_Pointer[8]=&TBS_BCa1_02, CD_East_Pointer[1]=&TBS_BCa1_03_1E, CD_West_Pointer[5]=&TBS_BCa1_04,
	CD_East_Pointer[5]=&TBS_BCa2_01_5E, CD_West_Pointer[5]=&TBS_BCa2_02, CD_East_Pointer[9]=&TBS_BCa2_03_9E, CD_West_Pointer[9]=&TBS_BCa2_04,

''	board "b"
	CD_East_Pointer[7]=&TBS_BCb1_01_7E, CD_West_Pointer[7]=&TBS_BCb1_02, CD_East_Pointer[11]=&TBS_BCb1_03_11E, CD_West_Pointer[11]=&TBS_BCb1_04,
	CD_East_Pointer[4]=&TBS_BCb2_01_4E, CD_West_Pointer[4]=&TBS_BCb2_02, CD_East_Pointer[12]=&TBS_BCb2_03_12E, CD_West_Pointer[12]=&TBS_BCb2_04,

''	board "c"
	CD_East_Pointer[2]=&TBS_BCc1_01_2E, CD_West_Pointer[2]=&TBS_BCc1_02, CD_East_Pointer[6]=&TBS_BCc1_03_6E, CD_West_Pointer[6]=&TBS_BCc1_04,
	CD_East_Pointer[10]=&TBS_BCc2_01_10E, CD_West_Pointer[10]=&TBS_BCc2_02, CD_East_Pointer[3]=&TBS_BCc2_03_3E, CD_West_Pointer[3]=&TBS_BCc2_04,


' set address pointers to Turnout_Controls

	'Turnout_Pointer[5]=&YMC_TCa1_01,
	'Turnout_Pointer[6]=&YMC_TCa1_02,
	'Turnout_Pointer[3]=&YMC_TCa1_03,
	'Turnout_Pointer[12]=&YMC_TCa1_04,
	'Turnout_Pointer[1]=&YMC_TCa1_05,
	'Turnout_Pointer[14]=&YMC_TCa1_06,
	'Turnout_Pointer[15]=&YMC_TCa1_07,
	'Turnout_Pointer[2]=&YMC_TCa1_08,
	' SPARES YMC_TCa1_09,YMC_TCa1_10,YMC_TCa1_11,YMC_TCa1_12,YMC_TCa1_13,YMC_TCa1_14,YMC_TCa1_15,YMC_TCa1_16,

	'Turnout_Pointer[4]=&YMC_TCb1_01,
	'Turnout_Pointer[5]=&YMC_TCb1_02,
	'Turnout_Pointer[6]=&YMC_TCb1_03,
	'Turnout_Pointer[7]=&YMC_TCb1_04,
	'Turnout_Pointer[8]=&YMC_TCb1_05,
	'Turnout_Pointer[9]=&YMC_TCb1_06,
	'Turnout_Pointer[10]=&YMC_TCb1_07,
	'Turnout_Pointer[11]=&YMC_TCb1_08,
	'Turnout_Pointer[17]=&YMC_TCb1_09,
	'Turnout_Pointer[18]=&YMC_TCb1_10,
	' SPARES YMC_TCb1_11,YMC_TCb1_12,,YMC_TCb1_13,YMC_TCb1_14,YMC_TCb1_15,YMC_TCb1_16,

' set address pointers to Turnout Push Button Sensors

	'Turnout_Button_Pointer[5]=&SES_TCa2_01,
	'Turnout_Button_Pointer[6]=&SES_TCa2_02,
	'Turnout_Button_Pointer[3]=&SES_TCa2_03,
	'Turnout_Button_Pointer[12]=&SES_TCa2_04,
	'Turnout_Button_Pointer[1]=&SES_TCa2_05,
	'Turnout_Button_Pointer[14]=&SES_TCa2_06,
	'Turnout_Button_Pointer[15]=&SES_TCa2_07,
	'Turnout_Button_Pointer[2]=&SES_TCa2_08,
	' SPARES SES_TCa2_09,SES_TCa2_10,SES_TCa2_11,SES_TCa2_12,SES_TCa2_13,SES_TCa2_14,SES_TCa2_15,SES_TCa2_16,

	'Turnout_Button_Pointer[4]=&SES_TCb2_01,
	'Turnout_Button_Pointer[5]=&SES_TCb2_02,
	'Turnout_Button_Pointer[6]=&SES_TCb2_03,
	'Turnout_Button_Pointer[7]=&SES_TCb2_04,
	'Turnout_Button_Pointer[8]=&SES_TCb2_05,
	'Turnout_Button_Pointer[9]=&SES_TCb2_06,
	'Turnout_Button_Pointer[10]=&SES_TCb2_07,
	'Turnout_Button_Pointer[11]=&SES_TCb2_08,
	'Turnout_Button_Pointer[17]=&SES_TCb2_09,
	'Turnout_Button_Pointer[18]=&SES_TCb2_10,
	' SPARES SES_TCb2_11,SES_TCb2_12,,SES_TCb2_13,SES_TCb2_14,SES_TCb2_15,SES_TCb2_16,

' set address pointers to Cab Controls and Functions

	Cab_Pointer[1]=&SCP_PBa1_01, Cab_Pointer[2]=&SCP_PBa1_02, Cab_Pointer[3]=&SCP_PBa1_03,
	Cab_Speed_Pointer[1]=&SCP_PBa1_01.speed, Cab_Speed_Pointer[2]=&SCP_PBa1_02.speed, Cab_Speed_Pointer[3]=&SCP_PBa1_03.speed,
	Cab_Direction_Pointer[1]=&SCP_PBa1_01.Direction, Cab_Direction_Pointer[2]=&SCP_PBa1_02.Direction, Cab_Direction_Pointer[3]=&SCP_PBa1_03.Direction,
	Cab_Brake_Pointer[1]=&SCP_PBa1_01.Brake, Cab_Brake_Pointer[2]=&SCP_PBa1_02.Brake, Cab_Brake_Pointer[3]=&SCP_PBa1_03.Brake,
	Cab_Momentum_Pointer[1]=&SCP_PBa1_01.Momentum, Cab_Momentum_Pointer[2]=&SCP_PBa1_02.Momentum, Cab_Momentum_Pointer[3]=&SCP_PBa1_03.Momentum,
	
' set DCC cab pointers
	Dcc_Cab_Pointer[1] = &CAB_1
	Dcc_Cab_Pointer[2] = &CAB_2
	Dcc_Cab_Pointer[3] = &CAB_3

'**	Initialize panel locations of IR Block Detectors - one at each end of block		

	IR_Detector_Grid_E[1]=(46,14,4), IR_Detector_Grid_E[2]=(27,26,4), IR_Detector_Grid_E[3]=(7,18,4), IR_Detector_Grid_E[4]=(24,2,4)
	IR_Detector_Grid_E[5]=(50,17,4), IR_Detector_Grid_E[6]=(24,29,4), IR_Detector_Grid_E[7]=(4,15,4), IR_Detector_Grid_E[8]=(37,6,4)
	IR_Detector_Grid_E[9]=(45,14,4), IR_Detector_Grid_E[10]=(8,19,4), IR_Detector_Grid_E[11]=(6,15,4), 'IR_Detector_Grid_E[12]=

	IR_Detector_Grid_W[1]=(33,26,4), IR_Detector_Grid_W[2]=(7,22,4), IR_Detector_Grid_W[3]=(21,2,4), IR_Detector_Grid_W[4]=(50,13,4)
	IR_Detector_Grid_W[5]=(27,29,4), IR_Detector_Grid_W[6]=(4,21,4), IR_Detector_Grid_W[7]=(30,6,4), IR_Detector_Grid_W[8]=(46,10,4)
	IR_Detector_Grid_W[9]=(34,24,4), IR_Detector_Grid_W[10]=(21,3,4), IR_Detector_Grid_W[11]=(32,7,4), 'IR_Detector_Grid_W[12]=

	IR_EOT_Detector_Grid[0]=(16,5,4), IR_EOT_Detector_Grid[1]=(16,4,4)


'**	Initialize panel locations of tortoise controls

	Turnout_Grid[1]=(4,18,4), Turnout_Grid[2]=(9,12,4), Turnout_Grid[3]=(32,6,4), Turnout_Grid[4]=(35,6,4),
	Turnout_Grid[5]=(46,11,4), Turnout_Grid[6]=(46,16,4), Turnout_Grid[7]=(45,20,4), Turnout_Grid[8]=(29,26,4),
	Turnout_Grid[9]=(7,21,4), Turnout_Grid[10]=(20,2,4), Turnout_Grid[11]=(23,2,4), Turnout_Grid[12]=(50,16,4),
	Turnout_Grid[13]=(50,20,4), Turnout_Grid[14]=(33,24,4), Turnout_Grid[15]=(7,11,4), Turnout_Grid[16]=(8,18,4),
	Turnout_Grid[17]=(4,20,4), Turnout_Grid[18]=(30,5,4),

'**	Initialize panel location of track blocks and sprite locations of corresponding sprites

	Block_Grid[1]=(42,26,4), Block_Grid[2]=(15,26,4), Block_Grid[3]=(7,4,4), Block_Grid[4]=(38,2,4)
	Block_Grid[5]=(42,29,4), Block_Grid[6]=(15,29,4), Block_Grid[7]=(13,6,4), Block_Grid[8]=(42,6,4)
	Block_Grid[9]=(42,24,4), Block_Grid[10]=(8,5,4), Block_Grid[11]=(13,7,4), Block_Grid[12]=(24,12,4),


'**	Initialize sprite shapes to overlay on assign cab pushbuttons

	Train_E_Sprite[1]=Arrow_west, Train_W_Sprite[1]=Arrow_east, Train_E_Sprite[2]=Arrow_west, Train_W_Sprite[2]=Arrow_east
	Train_E_Sprite[3]=Arrow_north, Train_W_Sprite[3]=Arrow_south, Train_E_Sprite[4]=Arrow_east, Train_W_Sprite[4]=Arrow_west
	Train_E_Sprite[5]=Arrow_west, Train_W_Sprite[5]=Arrow_east, Train_E_Sprite[6]=Arrow_west, Train_W_Sprite[6]=Arrow_east
	Train_E_Sprite[7]=Arrow_East, Train_W_Sprite[7]=Arrow_west, Train_E_Sprite[8]=Arrow_east, Train_W_Sprite[8]=Arrow_west
	Train_E_Sprite[9]=Arrow_west, Train_W_Sprite[9]=Arrow_east, Train_E_Sprite[10]=Arrow_north, Train_W_Sprite[10]=Arrow_south
	Train_E_Sprite[11]=Arrow_east, Train_W_Sprite[11]=Arrow_west, Train_E_Sprite[12]=Arrow_east, Train_W_Sprite[12]=Arrow_west


'**	Initialize sprite shapes of IR Block Detectors - one at each end of block		

	IR_Detector_Shape_E[1]=Train_South, IR_Detector_Shape_E[2]=Train_West, IR_Detector_Shape_E[3]=Train_North, IR_Detector_Shape_E[4]=Train_East
	IR_Detector_Shape_E[5]=Train_South, IR_Detector_Shape_E[6]=Train_West, IR_Detector_Shape_E[7]=Train_North, IR_Detector_Shape_E[8]=Train_East
	IR_Detector_Shape_E[9]=Train_South, IR_Detector_Shape_E[10]=Train_North, IR_Detector_Shape_E[11]=Train_North

	IR_Detector_Shape_W[1]=Train_West, IR_Detector_Shape_W[2]=Train_North, IR_Detector_Shape_W[3]=Train_East, IR_Detector_Shape_W[4]=Train_South
	IR_Detector_Shape_W[5]=Train_West, IR_Detector_Shape_W[6]=Train_North, IR_Detector_Shape_W[7]=Train_East, IR_Detector_Shape_W[8]=Train_South
	IR_Detector_Shape_W[9]=Train_West, IR_Detector_Shape_W[10]=Train_East, IR_Detector_Shape_W[11]=Train_East
	'IR_Dector_Shape_E[12]=
	'IR_Dector_Shape_W[12]=
	
	IR_EOT_Detector_Shape[0]=Train_East, IR_EOT_Detector_Shape[1]=Train_East

'**	Defines turnout Types
	Turnout_Type[1]=TORTOISE, Turnout_Type[2]=TORTOISE, Turnout_Type[3]=TORTOISE, Turnout_Type[4]=TORTOISE,
	Turnout_Type[5]=TORTOISE, Turnout_Type[6]=TORTOISE, Turnout_Type[7]=TORTOISE, Turnout_Type[8]=TORTOISE,
	Turnout_Type[9]=TORTOISE, Turnout_Type[10]=TORTOISE, Turnout_Type[11]=TORTOISE, Turnout_Type[12]=TORTOISE,
	Turnout_Type[13]=TORTOISE, Turnout_Type[14]=TORTOISE, Turnout_Type[15]=TORTOISE, Turnout_Type[16]=TORTOISE,
	Turnout_Type[17]=TORTOISE, Turnout_Type[18]=TORTOISE, 

'**	Initialize colors to indicate cab assignments on blocks and sprites

	Cab_Color[0]=$RGB_FF0000, Cab_Color[1]=$RGB_2492FF, Cab_Color[2]=$RGB_008000, Cab_Color[3]=$RGB_005EBB,

'**	Initialize Cab Speed Pushbutton locations

	Cab1_Speed_Grid[10]=(59,4,4), Cab1_Speed_Grid[9]=(59,5,4), Cab1_Speed_Grid[8]=(59,6,4), Cab1_Speed_Grid[7]=(59,7,4),
	Cab1_Speed_Grid[6]=(59,8,4), Cab1_Speed_Grid[5]=(59,9,4), Cab1_Speed_Grid[4]=(59,10,4), Cab1_Speed_Grid[3]=(59,11,4),
	Cab1_Speed_Grid[2]=(59,12,4), Cab1_Speed_Grid[1]=(59,13,4), Cab1_Speed_Grid[0]=(59,14,4),
	Cab1_Brake_Grid=(59,16,4), 
	Cab1_F_R_Indication_Grid=(59,18,4), 
	Cab1_Direction_Grid=(59,18,4),

	Cab2_Speed_Grid[10]=(61,4,4), Cab2_Speed_Grid[9]=(61,5,4), Cab2_Speed_Grid[8]=(61,6,4), Cab2_Speed_Grid[7]=(61,7,4),
	Cab2_Speed_Grid[6]=(61,8,4), Cab2_Speed_Grid[5]=(61,9,4), Cab2_Speed_Grid[4]=(61,10,4), Cab2_Speed_Grid[3]=(61,11,4),
	Cab2_Speed_Grid[2]=(61,12,4), Cab2_Speed_Grid[1]=(61,13,4), Cab2_Speed_Grid[0]=(61,14,4),
	Cab2_Brake_Grid=(61,16,4),	
	Cab2_F_R_Indication_Grid=(61,18,4),
	Cab2_Direction_Grid=(61,18,4),	

	Cab3_Speed_Grid[10]=(63,4,4), Cab3_Speed_Grid[9]=(63,5,4), Cab3_Speed_Grid[8]=(63,6,4), Cab3_Speed_Grid[7]=(63,7,4),
	Cab3_Speed_Grid[6]=(63,8,4), Cab3_Speed_Grid[5]=(63,9,4), Cab3_Speed_Grid[4]=(63,10,4), Cab3_Speed_Grid[3]=(63,11,4),
	Cab3_Speed_Grid[2]=(63,12,4), Cab3_Speed_Grid[1]=(63,13,4), Cab3_Speed_Grid[0]=(63,14,4),
	Cab3_Brake_Grid=(63,16,4),	
	Cab3_F_R_Indication_Grid=(63,18,4),
	Cab3_Direction_Grid=(63,18,4),

'**	Initialize Cab to Block Pushbutton locations

	cab0_Block_Grid[1]=(57,21,4), cab0_Block_Grid[2]=(57,22,4), cab0_Block_Grid[3]=(57,23,4), cab0_Block_Grid[4]=(57,24,4),
	cab0_Block_Grid[5]=(57,25,4), cab0_Block_Grid[6]=(57,26,4), cab0_Block_Grid[7]=(57,27,4), cab0_Block_Grid[8]=(57,28,4),
	cab0_Block_Grid[9]=(57,29,4), cab0_Block_Grid[10]=(57,30,4), cab0_Block_Grid[11]=(57,31,4), cab0_Block_Grid[12]=(57,32,4),

	cab1_Block_Grid[1]=(59,21,4), cab1_Block_Grid[2]=(59,22,4), cab1_Block_Grid[3]=(59,23,4), cab1_Block_Grid[4]=(59,24,4),
	cab1_Block_Grid[5]=(59,25,4), cab1_Block_Grid[6]=(59,26,4), cab1_Block_Grid[7]=(59,27,4), cab1_Block_Grid[8]=(59,28,4),
	cab1_Block_Grid[9]=(59,29,4), cab1_Block_Grid[10]=(59,30,4), cab1_Block_Grid[11]=(59,31,4), cab1_Block_Grid[12]=(59,32,4),

	cab2_Block_Grid[1]=(61,21,4), cab2_Block_Grid[2]=(61,22,4), cab2_Block_Grid[3]=(61,23,4), cab2_Block_Grid[4]=(61,24,4),
	cab2_Block_Grid[5]=(61,25,4), cab2_Block_Grid[6]=(61,26,4), cab2_Block_Grid[7]=(61,27,4), cab2_Block_Grid[8]=(61,28,4),
	cab2_Block_Grid[9]=(61,29,4), cab2_Block_Grid[10]=(61,30,4), cab2_Block_Grid[11]=(61,31,4), cab2_Block_Grid[12]=(61,32,4),

	cab3_Block_Grid[1]=(63,21,4), cab3_Block_Grid[2]=(63,22,4), cab3_Block_Grid[3]=(63,23,4), cab3_Block_Grid[4]=(63,24,4),
	cab3_Block_Grid[5]=(63,25,4), cab3_Block_Grid[6]=(63,26,4), cab3_Block_Grid[7]=(63,27,4), cab3_Block_Grid[8]=(63,28,4),
	cab3_Block_Grid[9]=(63,29,4), cab3_Block_Grid[10]=(63,30,4), cab3_Block_Grid[11]=(63,31,4), cab3_Block_Grid[12]=(63,32,4),

	cab0_All_Blocks_Grid=(57,20,4), cab1_All_Blocks_Grid=(59,20,4), cab2_All_Blocks_Grid=(61,20,4), cab3_All_Blocks_Grid=(63,20,4),

	Initialize_Speed_Index()
	Initialize_Cab_Speed_And_Direction_On_Display()
	Initialize_Cab_Status()
	Initialize_Cab_Direction_Display()

	Assign_Cab_To_All_Blocks(1)
	Initialize_Detect_Initial_Blocks()

	Initialize_Set_All_Turnouts_To_Normal()



'**************************** END OF INITIALIZATION *********************************
InitStatus=Operating

'************************************************************************************
'					   MAIN PROGRAM							
'************************************************************************************


'*** 	Detect activation of Panic button
'		If set, stop all trains and reset panel indicators


'********************************************************************		
'*** 	Detect activation of Cab to Block assignment buttons

'*	All Block assignments

WHEN $leftmouse=cab0_All_Blocks_Grid DO Assign_Cab_To_All_Blocks(0)
WHEN $leftmouse=cab1_All_Blocks_Grid DO Assign_Cab_To_All_Blocks(1)
WHEN $leftmouse=cab2_All_Blocks_Grid DO Assign_Cab_To_All_Blocks(2)
WHEN $leftmouse=cab3_All_Blocks_Grid DO Assign_Cab_To_All_Blocks(3)

'*	Individual Block assignments

WHEN $leftmouse=cab0_block_grid[1] DO Assign_Cab_To_Block(0,1)
WHEN $leftmouse=cab0_block_grid[2] DO Assign_Cab_To_Block(0,2)
WHEN $leftmouse=cab0_block_grid[3] DO Assign_Cab_To_Block(0,3)
WHEN $leftmouse=cab0_block_grid[4] DO Assign_Cab_To_Block(0,4)
WHEN $leftmouse=cab0_block_grid[5] DO Assign_Cab_To_Block(0,5)
WHEN $leftmouse=cab0_block_grid[6] DO Assign_Cab_To_Block(0,6)
WHEN $leftmouse=cab0_block_grid[7] DO Assign_Cab_To_Block(0,7)
WHEN $leftmouse=cab0_block_grid[8] DO Assign_Cab_To_Block(0,8)
WHEN $leftmouse=cab0_block_grid[9] DO Assign_Cab_To_Block(0,9)
WHEN $leftmouse=cab0_block_grid[10] DO Assign_Cab_To_Block(0,10)
WHEN $leftmouse=cab0_block_grid[11] DO Assign_Cab_To_Block(0,11)
WHEN $leftmouse=cab0_block_grid[12] DO Assign_Cab_To_Block(0,12)

WHEN $leftmouse=cab1_block_grid[1] DO Assign_Cab_To_Block(1,1)
WHEN $leftmouse=cab1_block_grid[2] DO Assign_Cab_To_Block(1,2)
WHEN $leftmouse=cab1_block_grid[3] DO Assign_Cab_To_Block(1,3)
WHEN $leftmouse=cab1_block_grid[4] DO Assign_Cab_To_Block(1,4)
WHEN $leftmouse=cab1_block_grid[5] DO Assign_Cab_To_Block(1,5)
WHEN $leftmouse=cab1_block_grid[6] DO Assign_Cab_To_Block(1,6)
WHEN $leftmouse=cab1_block_grid[7] DO Assign_Cab_To_Block(1,7)
WHEN $leftmouse=cab1_block_grid[8] DO Assign_Cab_To_Block(1,8)
WHEN $leftmouse=cab1_block_grid[9] DO Assign_Cab_To_Block(1,9)
WHEN $leftmouse=cab1_block_grid[10] DO Assign_Cab_To_Block(1,10)
WHEN $leftmouse=cab1_block_grid[11] DO Assign_Cab_To_Block(1,11)
WHEN $leftmouse=cab1_block_grid[12] DO Assign_Cab_To_Block(1,12)

WHEN $leftmouse=cab2_block_grid[1] DO Assign_Cab_To_Block(2,1)
WHEN $leftmouse=cab2_block_grid[2] DO Assign_Cab_To_Block(2,2)
WHEN $leftmouse=cab2_block_grid[3] DO Assign_Cab_To_Block(2,3)
WHEN $leftmouse=cab2_block_grid[4] DO Assign_Cab_To_Block(2,4)
WHEN $leftmouse=cab2_block_grid[5] DO Assign_Cab_To_Block(2,5)
WHEN $leftmouse=cab2_block_grid[6] DO Assign_Cab_To_Block(2,6)
WHEN $leftmouse=cab2_block_grid[7] DO Assign_Cab_To_Block(2,7)
WHEN $leftmouse=cab2_block_grid[8] DO Assign_Cab_To_Block(2,8)
WHEN $leftmouse=cab2_block_grid[9] DO Assign_Cab_To_Block(2,9)
WHEN $leftmouse=cab2_block_grid[10] DO Assign_Cab_To_Block(2,10)
WHEN $leftmouse=cab2_block_grid[11] DO Assign_Cab_To_Block(2,11)
WHEN $leftmouse=cab2_block_grid[12] DO Assign_Cab_To_Block(2,12)

WHEN $leftmouse=cab3_block_grid[1] DO Assign_Cab_To_Block(3,1)
WHEN $leftmouse=cab3_block_grid[2] DO Assign_Cab_To_Block(3,2)
WHEN $leftmouse=cab3_block_grid[3] DO Assign_Cab_To_Block(3,3)
WHEN $leftmouse=cab3_block_grid[4] DO Assign_Cab_To_Block(3,4)
WHEN $leftmouse=cab3_block_grid[5] DO Assign_Cab_To_Block(3,5)
WHEN $leftmouse=cab3_block_grid[6] DO Assign_Cab_To_Block(3,6)
WHEN $leftmouse=cab3_block_grid[7] DO Assign_Cab_To_Block(3,7)
WHEN $leftmouse=cab3_block_grid[8] DO Assign_Cab_To_Block(3,8)
WHEN $leftmouse=cab3_block_grid[9] DO Assign_Cab_To_Block(3,9)
WHEN $leftmouse=cab3_block_grid[10] DO Assign_Cab_To_Block(3,10)
WHEN $leftmouse=cab3_block_grid[11] DO Assign_Cab_To_Block(3,11)
WHEN $leftmouse=cab3_block_grid[12] DO Assign_Cab_To_Block(3,12)
		
'********************************************************************
'*** 	Detect activation of Cab Speed Buttons


WHEN $LeftMouse = cab1_Speed_grid[0] DO Assign_Speed_To_Cab(1, 0)
WHEN $LeftMouse = cab1_Speed_grid[1] DO Assign_Speed_To_Cab(1, 1)
WHEN $LeftMouse = cab1_Speed_grid[2] DO Assign_Speed_To_Cab(1, 2)
WHEN $LeftMouse = cab1_Speed_grid[3] DO Assign_Speed_To_Cab(1, 3)
WHEN $LeftMouse = cab1_Speed_grid[4] DO Assign_Speed_To_Cab(1, 4)
WHEN $LeftMouse = cab1_Speed_grid[5] DO Assign_Speed_To_Cab(1, 5)
WHEN $LeftMouse = cab1_Speed_grid[6] DO Assign_Speed_To_Cab(1, 6)
WHEN $LeftMouse = cab1_Speed_grid[7] DO Assign_Speed_To_Cab(1, 7)
WHEN $LeftMouse = cab1_Speed_grid[8] DO Assign_Speed_To_Cab(1, 8)
WHEN $LeftMouse = cab1_Speed_grid[9] DO Assign_Speed_To_Cab(1, 9)
WHEN $LeftMouse = cab1_Speed_grid[10] DO Assign_Speed_To_Cab(1, 10)

WHEN $LeftMouse = cab2_Speed_grid[0] DO Assign_Speed_To_Cab(2, 0)
WHEN $LeftMouse = cab2_Speed_grid[1] DO Assign_Speed_To_Cab(2, 1)
WHEN $LeftMouse = cab2_Speed_grid[2] DO Assign_Speed_To_Cab(2, 2)
WHEN $LeftMouse = cab2_Speed_grid[3] DO Assign_Speed_To_Cab(2, 3)
WHEN $LeftMouse = cab2_Speed_grid[4] DO Assign_Speed_To_Cab(2, 4)
WHEN $LeftMouse = cab2_Speed_grid[5] DO Assign_Speed_To_Cab(2, 5)
WHEN $LeftMouse = cab2_Speed_grid[6] DO Assign_Speed_To_Cab(2, 6)
WHEN $LeftMouse = cab2_Speed_grid[7] DO Assign_Speed_To_Cab(2, 7)
WHEN $LeftMouse = cab2_Speed_grid[8] DO Assign_Speed_To_Cab(2, 8)
WHEN $LeftMouse = cab2_Speed_grid[9] DO Assign_Speed_To_Cab(2, 9)
WHEN $LeftMouse = cab2_Speed_grid[10] DO Assign_Speed_To_Cab(2, 10)

WHEN $LeftMouse = cab3_Speed_grid[0] DO Assign_Speed_To_Cab(3, 0)
WHEN $LeftMouse = cab3_Speed_grid[1] DO Assign_Speed_To_Cab(3, 1)
WHEN $LeftMouse = cab3_Speed_grid[2] DO Assign_Speed_To_Cab(3, 2)
WHEN $LeftMouse = cab3_Speed_grid[3] DO Assign_Speed_To_Cab(3, 3)
WHEN $LeftMouse = cab3_Speed_grid[4] DO Assign_Speed_To_Cab(3, 4)
WHEN $LeftMouse = cab3_Speed_grid[5] DO Assign_Speed_To_Cab(3, 5)
WHEN $LeftMouse = cab3_Speed_grid[6] DO Assign_Speed_To_Cab(3, 6)
WHEN $LeftMouse = cab3_Speed_grid[7] DO Assign_Speed_To_Cab(3, 7)
WHEN $LeftMouse = cab3_Speed_grid[8] DO Assign_Speed_To_Cab(3, 8)
WHEN $LeftMouse = cab3_Speed_grid[9] DO Assign_Speed_To_Cab(3, 9)
WHEN $LeftMouse = cab3_Speed_grid[10] DO Assign_Speed_To_Cab(3, 10)




				
'********************************************************************			
'** 	Detect activation of pushbuttons for cab brake		
'**						
				
WHEN $leftmouse = cab1_Brake_Grid DO *Cab_Brake_Pointer[1] = *Cab_Brake_Pointer[1]~
WHEN $leftmouse = cab2_Brake_Grid DO *Cab_Brake_Pointer[2] = *Cab_Brake_Pointer[2]~
WHEN $leftmouse = cab3_Brake_Grid DO *Cab_Brake_Pointer[3] = *Cab_Brake_Pointer[3]~
	
'********************************************************************			
'** 	Detect activation of pushbuttons for cab direction		
'**					
				
WHEN $leftmouse = cab1_Direction_Grid DO *Cab_Direction_Pointer[1] = *Cab_Direction_Pointer[1] ~
WHEN $leftmouse = cab2_Direction_Grid DO *Cab_Direction_Pointer[2] = *Cab_Direction_Pointer[2] ~
WHEN $leftmouse = cab3_Direction_Grid DO *Cab_Direction_Pointer[3] = *Cab_Direction_Pointer[3] ~

'********************  TURNOUTS  ********************			
'******** 	Throw Tortoise Switch and corresponding display on panel

SUB Throw_Turnout(TIndex,ctc_Grid)
	$Switch(ctc_Grid)=$Switch(ctc_Grid)~
	IF Turnout_Type[TIndex]=TORTOISE THEN
		*Turnout_Pointer[TIndex]=*Turnout_Pointer[TIndex]~,
		Turnout_Status[TIndex]=Turnout_Status[TIndex]~,
	ELSEIF Turnout_Type[TIndex]=ATLAS THEN
		IF Turnout_Status[TIndex]=TURNOUT_NORMAL THEN
			*Atlas_Turnout_Pointer_Diverging[TIndex]=PULSE 0.1,
			*Atlas_Turnout_LED_Pointer_Diverging[TIndex]=TURNOUT_DIVERGING
			Turnout_Status[TIndex]=TURNOUT_DIVERGING,
		ELSE 	*Atlas_Turnout_Pointer_Normal[TIndex]=PULSE 0.1,
		 	*Atlas_Turnout_led_Pointer_Normal[TIndex]=TURNOUT_NORMAL,
			Turnout_Status[TIndex]=TURNOUT_NORMAL
		ENDIF		
	ENDIF
ENDSUB



'**	Detect activation of turnouts on panel or Turnout Micro Switches		
'		Call subroutine	
'			Left click changes tortoise direction, indicating diverging route with red on panel, main route with green		
		
WHEN $Leftmouse=Turnout_Grid[1] or *Turnout_Button_Pointer[1]=on DO Throw_Turnout(1,Turnout_Grid[1])
WHEN $Leftmouse=Turnout_Grid[2] or *Turnout_Button_Pointer[2]=on DO Throw_Turnout(2,Turnout_Grid[2])
WHEN $Leftmouse=Turnout_Grid[3] or *Turnout_Button_Pointer[3]=on DO Throw_Turnout(3,Turnout_Grid[3])
WHEN $Leftmouse=Turnout_Grid[4] or *Turnout_Button_Pointer[4]=on DO Throw_Turnout(4,Turnout_Grid[4])
WHEN $Leftmouse=Turnout_Grid[5] or *Turnout_Button_Pointer[5]=on DO Throw_Turnout(5,Turnout_Grid[5])
WHEN $Leftmouse=Turnout_Grid[6] or *Turnout_Button_Pointer[6]=on DO Throw_Turnout(6,Turnout_Grid[6])
WHEN $Leftmouse=Turnout_Grid[7] or *Turnout_Button_Pointer[7]=on DO Throw_Turnout(7,Turnout_Grid[7])
WHEN $Leftmouse=Turnout_Grid[8] or *Turnout_Button_Pointer[8]=on DO Throw_Turnout(8,Turnout_Grid[8])
WHEN $Leftmouse=Turnout_Grid[9] or *Turnout_Button_Pointer[9]=on DO Throw_Turnout(9,Turnout_Grid[9])
WHEN $Leftmouse=Turnout_Grid[10] or *Turnout_Button_Pointer[10]=on DO Throw_Turnout(10,Turnout_Grid[10])
WHEN $Leftmouse=Turnout_Grid[11] or *Turnout_Button_Pointer[11]=on DO Throw_Turnout(11,Turnout_Grid[11])
WHEN $Leftmouse=Turnout_Grid[12] or *Turnout_Button_Pointer[12]=on DO Throw_Turnout(12,Turnout_Grid[12])
WHEN $Leftmouse=Turnout_Grid[13] or *Turnout_Button_Pointer[13]=on DO Throw_Turnout(13,Turnout_Grid[13])
WHEN $Leftmouse=Turnout_Grid[14] or *Turnout_Button_Pointer[14]=on DO Throw_Turnout(14,Turnout_Grid[14])
WHEN $Leftmouse=Turnout_Grid[15] or *Turnout_Button_Pointer[15]=on DO Throw_Turnout(15,Turnout_Grid[15])
WHEN $Leftmouse=Turnout_Grid[16] or *Turnout_Button_Pointer[16]=on DO Throw_Turnout(16,Turnout_Grid[16])
WHEN $Leftmouse=Turnout_Grid[17] or *Turnout_Button_Pointer[17]=on DO Throw_Turnout(17,Turnout_Grid[17])
WHEN $Leftmouse=Turnout_Grid[18] or *Turnout_Button_Pointer[18]=on DO Throw_Turnout(18,Turnout_Grid[18])

'********************************************************************
'**	LOOP through East and West current detectors to determine block occupancy

	WHEN *CD_East_Pointer[1]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[1], 
			Block_Color[1], 
			Train_E_Sprite[1]),
		Block_Sprite[1]=Arrow_East,
		Block_Status[1]=BLOCK_STATUS_OCCUPIED_EAST,
		Assign_Cab_To_Block(Block_Cab[1],1,BLOCK_STATUS_OCCUPIED_EAST),
	WHEN *CD_West_Pointer[1]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[1], 
			Block_Color[1], 
			Train_W_Sprite[1]),
		Block_Sprite[1]=Arrow_West,
		Block_Status[1]=BLOCK_STATUS_OCCUPIED_WEST,
		Assign_Cab_To_Block(Block_Cab[1],1,BLOCK_STATUS_OCCUPIED_WEST),
	WHEN  *CD_East_Pointer[1]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[1]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[1],
			Block_Color[1]),
			Block_Sprite[1]=Square,
		Block_Status[1]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[1],1,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[2]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[2], 
			Block_Color[2], 
			Train_E_Sprite[2]),
		Block_Sprite[2]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[2],2,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[2]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[2]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[2], 
			Block_Color[2], 
			Train_W_Sprite[2]),
		Block_Sprite[2]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[2],2,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[2]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[2]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[2]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[2],
			Block_Color[2]),
			Block_Sprite[2]=Square,
		Block_Status[2]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[2],2,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[3]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[3], 
			Block_Color[3], 
			Train_E_Sprite[3]),
		Block_Sprite[3]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[3],3,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[3]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[3]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[3], 
			Block_Color[3], 
			Train_W_Sprite[3]),
		Block_Sprite[3]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[3],3,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[3]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[3]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[3]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[3],
			Block_Color[3]),
			Block_Sprite[3]=Square,
		Block_Status[3]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[3],3,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[4]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[4], 
			Block_Color[4], 
			Train_E_Sprite[4]),
		Block_Sprite[4]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[4],4,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[4]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[4]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[4], 
			Block_Color[4], 
			Train_W_Sprite[4]),
		Block_Sprite[4]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[4],4,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[4]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[4]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[4]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[4],
			Block_Color[4]),
			Block_Sprite[4]=Square,
		Block_Status[4]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[4],4,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[5]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[5], 
			Block_Color[5], 
			Train_E_Sprite[5]),
		Block_Sprite[5]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[5],5,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[5]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[5]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[5], 
			Block_Color[5], 
			Train_W_Sprite[5]),
		Block_Sprite[5]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[5],5,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[5]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[5]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[5]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[5],
			Block_Color[5]),
			Block_Sprite[5]=Square,
		Block_Status[5]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[5],5,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[6]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[6], 
			Block_Color[6], 
			Train_E_Sprite[6]),
		Block_Sprite[6]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[6],6,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[6]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[6]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[6], 
			Block_Color[6], 
			Train_W_Sprite[6]),
		Block_Sprite[6]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[6],6,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[6]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[6]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[6]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[6],
			Block_Color[6]),
			Block_Sprite[6]=Square,
		Block_Status[6]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[6],6,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[7]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[7], 
			Block_Color[7], 
			Train_E_Sprite[7]),
		Block_Sprite[7]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[7],7,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[7]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[7]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[7], 
			Block_Color[7], 
			Train_W_Sprite[7]),
		Block_Sprite[7]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[7],7,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[7]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[7]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[7]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[7],
			Block_Color[7]),
			Block_Sprite[7]=Square,
		Block_Status[7]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[7],7,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[8]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[8], 
			Block_Color[8], 
			Train_E_Sprite[8]),
		Block_Sprite[8]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[8],8,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[8]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[8]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[8], 
			Block_Color[8], 
			Train_W_Sprite[8]),
		Block_Sprite[8]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[8],8,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[8]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[8]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[8]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[8],
			Block_Color[8]),
			Block_Sprite[8]=Square,
		Block_Status[8]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[8],8,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[9]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[9], 
			Block_Color[9], 
			Train_E_Sprite[9]),
		Block_Sprite[9]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[9],9,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[9]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[9]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[9], 
			Block_Color[9], 
			Train_W_Sprite[9]),
		Block_Sprite[9]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[9],9,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[9]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[9]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[9]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[9],
			Block_Color[9]),
			Block_Sprite[9]=Square,
		Block_Status[9]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[9],9,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[10]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[10], 
			Block_Color[10], 
			Train_E_Sprite[10]),
		Block_Sprite[10]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[10],10,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[10]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[10]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[10], 
			Block_Color[10], 
			Train_W_Sprite[10]),
		Block_Sprite[10]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[10],10,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[10]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[10]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[10]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[10],
			Block_Color[10]),
			Block_Sprite[10]=Square,
		Block_Status[10]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[10],10,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[11]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[11], 
			Block_Color[11], 
			Train_E_Sprite[11]),
		Block_Sprite[11]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[11],11,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[11]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[11]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[11], 
			Block_Color[11], 
			Train_W_Sprite[11]),
		Block_Sprite[11]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[11],11,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[11]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[11]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[11]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[11],
			Block_Color[11]),
			Block_Sprite[11]=Square,
		Block_Status[11]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[11],11,BLOCK_STATUS_VACANT),

	WHEN *CD_East_Pointer[12]=DETECTOR_BLOCK_OCCUPIED  do
		block_occupancy_on (block_Grid[12], 
			Block_Color[12], 
			Train_E_Sprite[12]),
		Block_Sprite[12]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[12],12,BLOCK_STATUS_OCCUPIED_EAST),
		Block_Status[12]=BLOCK_STATUS_OCCUPIED_EAST,
	WHEN *CD_West_Pointer[12]=DETECTOR_BLOCK_OCCUPIED DO
		block_occupancy_on (block_Grid[12], 
			Block_Color[12], 
			Train_W_Sprite[12]),
		Block_Sprite[12]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[12],12,BLOCK_STATUS_OCCUPIED_WEST),
		Block_Status[12]=BLOCK_STATUS_OCCUPIED_WEST,
	WHEN  *CD_East_Pointer[12]=DETECTOR_BLOCK_VACANT and *CD_West_Pointer[12]=DETECTOR_BLOCK_VACANT DO
		block_occupancy_off(block_Grid[12],
			Block_Color[12]),
			Block_Sprite[12]=Square,
		Block_Status[12]=BLOCK_STATUS_VACANT,
		Assign_Cab_To_Block(Block_Cab[12],12,BLOCK_STATUS_VACANT),

'********************************************************************
'	LOOP through East and West InfraRed detectors to determine block occupancy
		
'	IF IRD_East[OccupancyIndex]=DETECTOR_BLOCK_OCCUPIED THEN
'		$Draw Sprite(IR_Detector_Grid_E[OccupancyIndex])= IR_Detector_Shape_E[OccupancyIndex] in red
'	ELSE $Erase Sprite(IR_Detector_Grid_E[OccupancyIndex])
'	ENDIF
'
'	IF IRD_West[OccupancyIndex]=DETECTOR_BLOCK_OCCUPIED THEN
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
'	ALWAYS DO
'		IF OccupancyIndex<MAX_BLOCK then OccupancyIndex=+ 
'
'		ENDIF


'********************************************************************
'	LOOP through EOT InfraRed detectors to determine block occupancy

'	WHEN IR_EOT_Detector[0]=DETECTOR_BLOCK_OCCUPIED DO
'		$Draw Sprite(IR_EOT_Detector_Grid[0])= IR_EOT_Detector_Shape[0] in red
'	WHEN IR_EOT_Detector[0]=DETECTOR_BLOCK_VACANT DO
'		$Erase Sprite(IR_EOT_Detector_Grid[0])

'  ************** DCC CABS ****************

SUB Update_Dcc_Cab_Speed(DccCabIndex, {Local} NewSpeed)
	NewSpeed = *Dcc_Cab_Pointer[DccCabIndex].Speed
	IF NewSpeed > 100 THEN NewSpeed = 100 ENDIF

	*Cab_Pointer[DccCabIndex].Speed = NewSpeed
	Previous_Dcc_Cab_Speed[DccCabIndex] = *Dcc_Cab_Pointer[DccCabIndex].Speed
ENDSUB
SUB Update_Cab_Speed(CabIndex)
	*Dcc_Cab_Pointer[CabIndex].Speed = *Cab_Pointer[CabIndex].Speed
	Previous_Cab_Speed[CabIndex] = *Cab_Pointer[CabIndex].Speed
ENDSUB

WHEN *Dcc_Cab_Pointer[1].Speed <> Previous_Dcc_Cab_Speed[1] DO Update_Dcc_Cab_Speed(1)
WHEN *Dcc_Cab_Pointer[2].Speed <> Previous_Dcc_Cab_Speed[2] DO Update_Dcc_Cab_Speed(2)
WHEN *Dcc_Cab_Pointer[3].Speed <> Previous_Dcc_Cab_Speed[3] DO Update_Dcc_Cab_Speed(3)

WHEN *Dcc_Cab_Pointer[1].Brake = ON DO *Cab_Pointer[1].Brake = ON
WHEN *Dcc_Cab_Pointer[1].Brake = OFF DO *Cab_Pointer[1].Brake = OFF
WHEN *Dcc_Cab_Pointer[2].Brake = ON DO *Cab_Pointer[2].Brake = ON
WHEN *Dcc_Cab_Pointer[2].Brake = OFF DO *Cab_Pointer[2].Brake = OFF
WHEN *Dcc_Cab_Pointer[3].Brake = ON DO *Cab_Pointer[3].Brake = ON
WHEN *Dcc_Cab_Pointer[4].Brake = OFF DO *Cab_Pointer[3].Brake = OFF

WHEN *Dcc_Cab_Pointer[1].Direction = FORWARD DO *Cab_Pointer[1].Direction = FORWARD
WHEN *Dcc_Cab_Pointer[1].Direction = REVERSE DO *Cab_Pointer[1].Direction = REVERSE
WHEN *Dcc_Cab_Pointer[2].Direction = FORWARD DO *Cab_Pointer[2].Direction = FORWARD
WHEN *Dcc_Cab_Pointer[2].Direction = REVERSE DO *Cab_Pointer[2].Direction = REVERSE
WHEN *Dcc_Cab_Pointer[3].Direction = FORWARD DO *Cab_Pointer[3].Direction = FORWARD
WHEN *Dcc_Cab_Pointer[4].Direction = REVERSE DO *Cab_Pointer[3].Direction = REVERSE

' *** --- ***
WHEN *Cab_Pointer[1].Speed <> Previous_Cab_Speed[1] DO Update_Cab_Speed(1)
WHEN *Cab_Pointer[2].Speed <> Previous_Cab_Speed[2] DO Update_Cab_Speed(2)
WHEN *Cab_Pointer[3].Speed <> Previous_Cab_Speed[3] DO Update_Cab_Speed(3)

WHEN *Cab_Pointer[1].Brake = ON DO *Dcc_Cab_Pointer[1].Brake = ON
WHEN *Cab_Pointer[1].Brake = OFF DO *Dcc_Cab_Pointer[1].Brake = OFF
WHEN *Cab_Pointer[2].Brake = ON DO *Dcc_Cab_Pointer[2].Brake = ON
WHEN *Cab_Pointer[2].Brake = OFF DO *Dcc_Cab_Pointer[2].Brake = OFF
WHEN *Cab_Pointer[3].Brake = ON DO *Dcc_Cab_Pointer[3].Brake = ON
WHEN *Cab_Pointer[4].Brake = OFF DO *Dcc_Cab_Pointer[3].Brake = OFF

WHEN *Cab_Pointer[1].Direction = FORWARD DO *Dcc_Cab_Pointer[1].Direction = FORWARD
WHEN *Cab_Pointer[1].Direction = REVERSE DO *Dcc_Cab_Pointer[1].Direction = REVERSE
WHEN *Cab_Pointer[2].Direction = FORWARD DO *Dcc_Cab_Pointer[2].Direction = FORWARD
WHEN *Cab_Pointer[2].Direction = REVERSE DO *Dcc_Cab_Pointer[2].Direction = REVERSE
WHEN *Cab_Pointer[3].Direction = FORWARD DO *Dcc_Cab_Pointer[3].Direction = FORWARD
WHEN *Cab_Pointer[3].Direction = REVERSE DO *Dcc_Cab_Pointer[3].Direction = REVERSE

'
'
SUB Redraw_Cab_Speed(CabIndex, {Local} Index, DrawColor)
	Index = 0
	UNTIL Index >= MAX_SPEED_NOTCH_INDEX LOOP
		IF *Cab_Pointer[CabIndex].Speed >= Speed_Notch[Index] THEN
			DrawColor = Cab_Color[CabIndex]
		ELSE
			DrawColor = COLOR_UNSELECTED_SPEED
		ENDIF
		
		IF CabIndex = 1 THEN
			$Color Track(cab1_Speed_Grid[Index]) = DrawColor
		ELSEIF CabIndex = 2 THEN
			$Color Track(cab2_Speed_Grid[Index]) = DrawColor
		ELSEIF CabIndex = 3 THEN
			$Color Track(cab3_Speed_Grid[Index]) = DrawColor
		ENDIF
		
		Index = 1 +
	ENDLOOP
ENDSUB
SUB Redraw_Cab_Brake(CabIndex, {Local} DrawColor)
	IF *Cab_Pointer[CabIndex].Brake = ON THEN
		DrawColor = COLOR_BRAKE_ON
	ELSE
		DrawColor = COLOR_BRAKE_OFF
	ENDIF
	
	IF CabIndex = 1 THEN
		$Color Track(cab1_Brake_Grid) = DrawColor
	ELSEIF CabIndex = 2 THEN
		$Color Track(cab2_Brake_Grid) = DrawColor
	ELSEIF CabIndex = 3 THEN
		$Color Track(cab3_Brake_Grid) = DrawColor
	ENDIF
ENDSUB
SUB Redraw_Cab_Direction(CabIndex, {Local} DrawColor, DrawIcon)
	IF *Cab_Pointer[CabIndex].Direction = FORWARD THEN
		DrawColor = COLOR_DIRECTION_FORWARD
		DrawIcon = ICON_DIRECTION_FORWARD
	ELSE
		DrawColor = COLOR_DIRECTION_REVERSE
		DrawIcon = ICON_DIRECTION_REVERSE
	ENDIF
	
	IF CabIndex = 1 THEN
		$Draw Sprite(Cab1_F_R_Indication_Grid) = DrawIcon in DrawColor
	ELSEIF CabIndex = 2 THEN
		$Draw Sprite(Cab2_F_R_Indication_Grid) = DrawIcon in DrawColor
	ELSEIF CabIndex = 3 THEN
		$Draw Sprite(Cab3_F_R_Indication_Grid) = DrawIcon in DrawColor
	ENDIF
ENDSUB

WHEN *Cab_Pointer[1].Speed <> Previous_Cab_Speed[1] DO Redraw_Cab_Speed(1)
WHEN *Cab_Pointer[2].Speed <> Previous_Cab_Speed[2] DO Redraw_Cab_Speed(2)
WHEN *Cab_Pointer[3].Speed <> Previous_Cab_Speed[3] DO Redraw_Cab_Speed(3)


WHEN *Cab_Pointer[1].Brake = ON DO Redraw_Cab_Brake(1)
WHEN *Cab_Pointer[1].Brake = OFF DO Redraw_Cab_Brake(1)
WHEN *Cab_Pointer[2].Brake = ON DO Redraw_Cab_Brake(2)
WHEN *Cab_Pointer[2].Brake = OFF DO Redraw_Cab_Brake(2)
WHEN *Cab_Pointer[3].Brake = ON DO Redraw_Cab_Brake(3)
WHEN *Cab_Pointer[3].Brake = OFF DO Redraw_Cab_Brake(3)

WHEN *Cab_Pointer[1].Direction = FORWARD DO Redraw_Cab_Direction(1)
WHEN *Cab_Pointer[1].Direction = REVERSE DO Redraw_Cab_Direction(1)
WHEN *Cab_Pointer[2].Direction = FORWARD DO Redraw_Cab_Direction(2)
WHEN *Cab_Pointer[2].Direction = REVERSE DO Redraw_Cab_Direction(2)
WHEN *Cab_Pointer[3].Direction = FORWARD DO Redraw_Cab_Direction(3)
WHEN *Cab_Pointer[3].Direction = REVERSE DO Redraw_Cab_Direction(3)
