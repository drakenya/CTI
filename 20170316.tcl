'************************************************************************************
'														*
'						DECLARATIONS						*
'														*
'************************************************************************************

CONSTANTS:
	Maxblocks=12		'* Max number of blocks for LOOPs, etc
	MaxBlocksPlusOne=13
	MaxTurnouts=17
	MaxTurnoutsPlusOne=18
	MaxCabs=3
	start=21

	mygray=$RGB_DFDFDF	'* Color for unselected speed buttons
	normal=off			'* Normal (green)  position of turnout
	Diverting=on		'* Diverting (red) position of turnout
	Occupied=on		'* For block occupancy
	Vacant=off		'* For block occupancy

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
SENSORS:	TBS_BCa1_01_8E#, TBS_BCa1_02#, TBS_BCa1_03_5E#, TBS_BCa1_04# 

' Train Brain "a2"
CONTROLS: 	TBC_BCa2_01, TBC_BCa2_02, TBC_BCa2_03, TBC_BCa2_04
SENSORS:	TBS_BCa2_01_1E#, TBS_BCa2_02#, TBS_BCa2_03_9E#, TBS_BCa2_04#

'Dash-8 "a3"
CONTROLS:	D8C_BCa3_01, D8C_BCa3_02, D8C_BCa3_03, D8C_BCa3_04, D8C_BCa3_05, D8C_BCa3_06, D8C_BCa3_07, D8C_BCa3_08



'''''''''''
''''''''''' Track Control board "b"
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
''''''''''' Track Control board "c"
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
''''''''''' Turnout Control Bobrd "b"
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
	CAB_AorB_Pointer[MaxBlocksPlusOne]
	CAB_CorD_Pointer[MaxBlocksPlusOne]
	CAB_ABorCD_Pointer[MaxBlocksPlusOne]

' Holds addresses of Current Detector Sensors for each block
	CD_East_Pointer[MaxBlocksPlusOne]
	CD_West_Pointer[MaxBlocksPlusOne]

	BlockStatus[MaxBlocksPlusOne]

' Holds address for Tortoise Machine controls
	Tortoise_Pointer[MaxTurnoutsPlusOne]

' Holds address of Sensors for Manual turnout buttons
	Turnout_Button_Pointer[MaxTurnoutsPlusOne]

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
	Tortoise_Status[MaxTurnoutsPlusOne]	'holds status of each turnout
	Mouse_Status				' holds mouse status to prevent multiple actions on single click
	Block_Status[MaxBlocksPlusOne]
	Block_Cab[MaxBlocksPlusOne]		'* holds cab assignment for each block
	OccupyEast[maxblocksplusOne]		'* holds status of current sensors
	OccupyWest[maxblocksplusOne]		'* holds status of current sensors

'* Arrays to hold Grid coordinates for panel display
	Block_Grid[MaxBlocksPlusOne]
	Turnout_Grid[MaxTurnoutsPlusOne]
		
	IR_Detector_Grid_E[MaxBlocksPlusOne]
	IR_Detector_Grid_W[MaxBlocksPlusOne]
	IR_EOT_Detector_Grid[3]
	
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
	IR_Detector_Shape_E[MaxBlocksPlusOne]
	IR_Detector_Shape_W[MaxBlocksPlusOne]
	IR_EOT_Detector_Shape[2]




'* Speed Control
	Previous_Cab_Speed[MaxCabs]
	Speed_Notch[11]		'* holds throttle speeds for each step		



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

'SUB Throw_Atlas(TurnOutNum,onoff,ctc_Grid)
'	$Switch(ctc_Grid)=onoff
'	*tortoise_Pointer[TurnoutNum]=onoff
'ENDSUB


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

	IF Block_Status[BlockIndex]=1 THEN $color Block(Block_Grid[blockIndex]) = Block_Color[BlockIndex],
	ELSEIF Block_Status[BlockIndex]=0 THEN $color Block(Block_Grid[blockIndex]) = BLACK,
	ENDIF,

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


'******** 	Assign selected speed to cab

SUB Assign_Speed_To_Cab(CabIndex,SpeedIndex)
	*Cab_Speed_Pointer[CabIndex]=speed_notch[SpeedIndex], 'Set Actual cab speed	
ENDSUB

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
endsub


	
'************************************************************************************
'					   INITIALIZATION							
'************************************************************************************

WHEN init=0 do '(All lines must end in a comma to continue the initialization chain)

' set address pointers to cab selection controllers
''	board "a",
	CAB_AorB_Pointer[8]=&TBC_BCa1_01,
	CAB_AorB_Pointer[5]=&TBC_BCa1_02,
	CAB_AorB_Pointer[1]=&TBC_BCa1_03,
	CAB_AorB_Pointer[9]=&TBC_BCa1_04,

	CAB_CorD_Pointer[8]=&TBC_BCa2_01,
	CAB_CorD_Pointer[5]=&TBC_BCa2_02,
	CAB_CorD_Pointer[1]=&TBC_BCa2_03,
	CAB_CorD_Pointer[9]=&TBC_BCa2_04,

	CAB_ABorCD_Pointer[8]=&D8C_BCa3_01,
	CAB_ABorCD_Pointer[5]=&D8C_BCa3_02,
	CAB_ABorCD_Pointer[1]=&D8C_BCa3_03,
	CAB_ABorCD_Pointer[9]=&D8C_BCa3_04,
	' SPARE=&D8C_BCa3_05,
	' SPARE=&D8C_BCa3_06,
	' SPARE=&D8C_BCa3_07,
	' SPARE=&D8C_BCa3_08,

''	board "b"
	CAB_AorB_Pointer[7]=&TBC_BCb1_01,
	CAB_AorB_Pointer[11]=&TBC_BCb1_02,
	CAB_AorB_Pointer[4]=&TBC_BCb1_03,
	CAB_AorB_Pointer[12]=&TBC_BCb1_04,

	CAB_CorD_Pointer[7]=&TBC_BCb2_01,
	CAB_CorD_Pointer[11]=&TBC_BCb2_02,
	CAB_CorD_Pointer[4]=&TBC_BCb2_03,
	CAB_CorD_Pointer[12]=&TBC_BCb2_04,

	CAB_ABorCD_Pointer[7]=&D8C_BCb3_01,
	CAB_ABorCD_Pointer[11]=&D8C_BCb3_02,
	CAB_ABorCD_Pointer[4]=&D8C_BCb3_03,
	CAB_ABorCD_Pointer[12]=&D8C_BCb3_04,
	' SPARE=&D8C_BCb3_05,
	' SPARE=&D8C_BCb3_06,
	' SPARE=&D8C_BCb3_07,
	' SPARE=&D8C_BCb3_08,

''	board "c"
	CAB_AorB_Pointer[2]=&TBC_BCc1_01,
	CAB_AorB_Pointer[6]=&TBC_BCc1_02,
	CAB_AorB_Pointer[10]=&TBC_BCc1_02,
	CAB_AorB_Pointer[3]=&TBC_BCc1_02,

	CAB_CorD_Pointer[2]=&TBC_BCc2_01,
	CAB_CorD_Pointer[6]=&TBC_BCc2_02,
	CAB_CorD_Pointer[10]=&TBC_BCc2_03,
	CAB_CorD_Pointer[3]=&TBC_BCc2_04,

	CAB_ABorCD_Pointer[2]=&D8C_BCc3_01,
	CAB_ABorCD_Pointer[6]=&D8C_BCc3_02,
	CAB_ABorCD_Pointer[10]=&D8C_BCc3_03,
	CAB_ABorCD_Pointer[3]=&D8C_BCc3_04,
	' SPARE=&D8C_BCc3_05,
	' SPARE=&D8C_BCc3_06,
	' SPARE=&D8C_BCc3_07,
	' SPARE=&D8C_BCc3_08,


' set address pointers to Current Detector Sensors

	CD_East_Pointer[8]=&TBS_BCa1_01_8E, 
	CD_West_Pointer[8]=&TBS_BCa1_02,
	CD_East_Pointer[5]=&TBS_BCa1_03_5E,
	CD_West_Pointer[5]=&TBS_BCa1_04,

	CD_East_Pointer[1]=&TBS_BCa2_01_1E,
	CD_West_Pointer[1]=&TBS_BCa2_02,
	CD_East_Pointer[9]=&TBS_BCa2_03_9E,
	CD_West_Pointer[9]=&TBS_BCa2_04,


	CD_East_Pointer[7]=&TBS_BCb1_01_7E,
	CD_West_Pointer[7]=&TBS_BCb1_02,
	CD_East_Pointer[11]=&TBS_BCb1_03_11E,
	CD_West_Pointer[11]=&TBS_BCb1_04,

	CD_East_Pointer[4]=&TBS_BCb2_01_4E,
	CD_West_Pointer[4]=&TBS_BCb2_02,
	CD_East_Pointer[12]=&TBS_BCb2_03_12E,
	CD_West_Pointer[12]=&TBS_BCb2_04,


	CD_East_Pointer[2]=&TBS_BCc1_01_2E,
	CD_West_Pointer[2]=&TBS_BCc1_02,
	CD_East_Pointer[6]=&TBS_BCc1_03_6E,
	CD_West_Pointer[6]=&TBS_BCc1_04,

	CD_East_Pointer[10]=&TBS_BCc2_01_10E,
	CD_West_Pointer[10]=&TBS_BCc2_02,
	CD_East_Pointer[3]=&TBS_BCc2_03_3E,
	CD_West_Pointer[3]=&TBS_BCc2_04,


' set address pointers to Turnout_Controls

	'Tortoise_Pointer[5]=&YMC_TCa1_01,
	'Tortoise_Pointer[6]=&YMC_TCa1_02,
	'Tortoise_Pointer[3]=&YMC_TCa1_03,
	'Tortoise_Pointer[12]=&YMC_TCa1_04,
	'Tortoise_Pointer[1]=&YMC_TCa1_05,
	'Tortoise_Pointer[14]=&YMC_TCa1_06,
	'Tortoise_Pointer[15]=&YMC_TCa1_07,
	'Tortoise_Pointer[2]=&YMC_TCa1_08,
	' SPARES YMC_TCa1_09,YMC_TCa1_10,YMC_TCa1_11,YMC_TCa1_12,YMC_TCa1_13,YMC_TCa1_14,YMC_TCa1_15,YMC_TCa1_16,

	'Tortoise_Pointer[4]=&YMC_TCb1_01,
	'Tortoise_Pointer[5]=&YMC_TCb1_02,
	'Tortoise_Pointer[6]=&YMC_TCb1_03,
	'Tortoise_Pointer[7]=&YMC_TCb1_04,
	'Tortoise_Pointer[8]=&YMC_TCb1_05,
	'Tortoise_Pointer[9]=&YMC_TCb1_06,
	'Tortoise_Pointer[10]=&YMC_TCb1_07,
	'Tortoise_Pointer[11]=&YMC_TCb1_08,
	'Tortoise_Pointer[17]=&YMC_TCb1_09,
	'Tortoise_Pointer[18]=&YMC_TCb1_10,
	' SPARES YMC_TCb1_11,YMC_TCb1_12,,YMC_TCb1_13,YMC_TCb1_14,YMC_TCb1_15,YMC_TCb1_16,

' set address pointers to Turnout Push Button Sensors

	'Tortoise_Button_Pointer[5]=&SES_TCa2_01,
	'Tortoise_Button_Pointer[6]=&SES_TCa2_02,
	'Tortoise_Button_Pointer[3]=&SES_TCa2_03,
	'Tortoise_Button_Pointer[12]=&SES_TCa2_04,
	'Tortoise_Button_Pointer[1]=&SES_TCa2_05,
	'Tortoise_Button_Pointer[14]=&SES_TCa2_06,
	'Tortoise_Button_Pointer[15]=&SES_TCa2_07,
	'Tortoise_Button_Pointer[2]=&SES_TCa2_08,
	' SPARES SES_TCa2_09,SES_TCa2_10,SES_TCa2_11,SES_TCa2_12,SES_TCa2_13,SES_TCa2_14,SES_TCa2_15,SES_TCa2_16,

	'Tortoise_Button_Pointer[4]=&SES_TCb2_01,
	'Tortoise_Button_Pointer[5]=&SES_TCb2_02,
	'Tortoise_Button_Pointer[6]=&SES_TCb2_03,
	'Tortoise_Button_Pointer[7]=&SES_TCb2_04,
	'Tortoise_Button_Pointer[8]=&SES_TCb2_05,
	'Tortoise_Button_Pointer[9]=&SES_TCb2_06,
	'Tortoise_Button_Pointer[10]=&SES_TCb2_07,
	'Tortoise_Button_Pointer[11]=&SES_TCb2_08,
	'Tortoise_Button_Pointer[17]=&SES_TCb2_09,
	'Tortoise_Button_Pointer[18]=&SES_TCb2_10,
	' SPARES SES_TCb2_11,SES_TCb2_12,,SES_TCb2_13,SES_TCb2_14,SES_TCb2_15,SES_TCb2_16,

' set address pointers to Cab Controls and Functions

	Cab_Pointer[1]=&SCP_PBa1_01,
	Cab_Pointer[2]=&SCP_PBa1_02,
	Cab_Pointer[3]=&SCP_PBa1_03,

	Cab_Speed_Pointer[1]=&SCP_PBa1_01.speed
	Cab_Speed_Pointer[2]=&SCP_PBa1_02.speed,
	Cab_Speed_Pointer[3]=&SCP_PBa1_03.speed,

	Cab_Direction_Pointer[1]=&SCP_PBa1_01.Direction,
	Cab_Direction_Pointer[2]=&SCP_PBa1_02.Direction,
	Cab_Direction_Pointer[3]=&SCP_PBa1_03.Direction,

	Cab_Brake_Pointer[1]=&SCP_PBa1_01.Brake,
	Cab_Brake_Pointer[2]=&SCP_PBa1_02.Brake,
	Cab_Brake_Pointer[3]=&SCP_PBa1_03.Brake,

	Cab_Momentum_Pointer[1]=&SCP_PBa1_01.Momentum,
	Cab_Momentum_Pointer[2]=&SCP_PBa1_02.Momentum,
	Cab_Momentum_Pointer[3]=&SCP_PBa1_03.Momentum,

'**	Initialize panel locations of IR Block Detectors - one at each end of block		

	IR_Detector_Grid_E[1]=(46,14,4),
	IR_Detector_Grid_E[2]=(27,26,4),
	IR_Detector_Grid_E[3]=(7,18,4),
	IR_Detector_Grid_E[4]=(24,2,4),
	IR_Detector_Grid_E[5]=(50,17,4),
	IR_Detector_Grid_E[6]=(24,29,4),
	IR_Detector_Grid_E[7]=(4,15,4),
	IR_Detector_Grid_E[8]=(37,6,4),
	IR_Detector_Grid_E[9]=(45,14,4),
	IR_Detector_Grid_E[10]=(8,19,4),
	IR_Detector_Grid_E[11]=(6,15,4),
	'IR_Detector_Grid_E[12]=

	IR_Detector_Grid_W[1]=(33,26,4),
	IR_Detector_Grid_W[2]=(7,22,4),
	IR_Detector_Grid_W[3]=(21,2,4),
	IR_Detector_Grid_W[4]=(50,13,4),
	IR_Detector_Grid_W[5]=(27,29,4),
	IR_Detector_Grid_W[6]=(4,21,4),
	IR_Detector_Grid_W[7]=(30,6,4),
	IR_Detector_Grid_W[8]=(46,10,4),
	IR_Detector_Grid_W[9]=(34,24,4),
	IR_Detector_Grid_W[10]=(21,3,4),
	IR_Detector_Grid_W[11]=(32,7,4),
	'IR_Detector_Grid_W[12]=

	IR_EOT_Detector_Grid[0]=(16,5,4),
	IR_EOT_Detector_Grid[1]=(16,4,4),



'**	Initialize panel locations of tortoise controls

	Turnout_Grid[5]=(46,11,4),
	Turnout_Grid[6]=(46,16,4),
	Turnout_Grid[7]=(45,20,4),
	Turnout_Grid[8]=(29,26,4),
	Turnout_Grid[14]=(33,24,4),
	Turnout_Grid[9]=(7,21,4),
	Turnout_Grid[16]=(8,18,4),
	Turnout_Grid[15]=(7,11,4),
	Turnout_Grid[10]=(23,2,4),
	Turnout_Grid[11]=(20,2,4),
	Turnout_Grid[12]=(50,16,4),
	Turnout_Grid[13]=(50,20,4),
	Turnout_Grid[17]=(4,20,4),
	Turnout_Grid[1]=(4,18,4),
	Turnout_Grid[2]=(9,12,4),
	Turnout_Grid[3]=(32,6,4),
	Turnout_Grid[4]=(35,6,4),
	Turnout_Grid[1]=(30,5,4),

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

Index=1,
	*Cab_Speed_Pointer[index]=10,
	*Cab_Direction_Pointer[index]=forward,
	*Cab_Brake_Pointer[index]=on,
Index=2,
	*Cab_Speed_Pointer[index]=10,
	*Cab_Direction_Pointer[index]=forward,
	*Cab_Brake_Pointer[index]=on,
Index=3,
	*Cab_Speed_Pointer[index]=10,
	*Cab_Direction_Pointer[index]=forward,
	*Cab_Brake_Pointer[index]=on,
'

'**	Initialize cab speed and direction display on panel

	index=10,
	UNTIL index<0 QUICKLOOP,
		$color Track(cab1_Speed_Grid[index])=mygray,
		$color Track(cab2_Speed_Grid[index])=mygray,
		$color Track(cab3_Speed_Grid[index])=mygray,
		index=-,
	ENDLOOP,


	$Color Track(cab1_Brake_Grid)=red,
	$Draw Sprite(cab1_F_R_Indication_grid)=Arrow_North in Green,
	$Color Track(cab2_Brake_Grid)=red,
	$Draw Sprite(cab2_F_R_Indication_grid)=Arrow_North in Green,		
	$Color Track(cab3_Brake_Grid)=red,
	$Draw Sprite(cab3_F_R_Indication_grid)=Arrow_North in Green,


'**	Initialize all blocks to Cab[1] 'to detect occupancy and so trains are halted

	Assign_Cab_To_Block(1,1,maxblocks),	

'**	Detect occupancy at each block
'		Assign cab to corresponding block, then call subroutine
'		Call subroutine to Indicate cab assignment on panel by assigning cab color to block
'		Call Subroutine to Color occupied block track with cab color and draw occupied sprite 
'		IF block is not occupied, designate cab #0 to block


	cabindex=1,
	blockindex=1,
	UNTIL blockindex=MaxblocksPlusOne QUICKLOOP,
		IF OccupyEast[blockindex]=on then,
			Block_Sprite[blockindex]=Arrow_East,
				Block_Cab[blockindex]=cabindex,
		Block_Color[blockindex]=cab_color[cabindex],
			Configure_Cab_To_Block(blockindex,cabindex),
			Block_occupancy_on (block_Grid[blockindex], Block_Color[blockindex], Train_E_Sprite[blockindex]),
			Assign_Cab_To_Block(1,blockindex,blockindex),
		ELSE 	Block_Sprite[blockindex]=square,
			Block_occupancy_off(block_Grid[blockindex], Block_Color[blockindex], lock),
			Assign_Cab_To_Block(1,blockindex,blockindex),
		ENDIF,
	blockindex=+,
	ENDLOOP,

	wait 3,

'**	Initialize all blocks to Cab[1] 'to detect occupancy and so trains are halted

	Assign_Cab_To_Block(1,1,maxblocks),	
	


'**************************** END OF INITIALIZATION *********************************
	init=1

'************************************************************************************
'					   MAIN PROGRAM							
'************************************************************************************


'*** 	Detect activation of Panic button
'		If set, stop all trains and reset panel indicators


'	while Panic=true DO
'		$Emergency=true,
'		Cab[0].brake=on,
'		*Cab[2].brake=on,
'		*Cab[3].brake=on,
'		cab[0].speed=speed_notch[0],
'			index=10,
'			UNTIL index<0 QUICKLOOP,
'				$color Track(cab0_Speed_Grid[index])=mygray,
'				index=-,
'			ENDLOOP,
'
'			*Cab[2].speed=speed_notch[0],
'			index=10,
'			UNTIL index<0 QUICKLOOP,
'				$color Track(cab1_Speed_Grid[index])=mygray,
'				index=-,
'			ENDLOOP,
'
'			*Cab[3].speed=speed_notch[0],
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

	WHEN $leftmouse=cab0_block_grid[1] DO
		Assign_Cab_To_Block(0,1)
	WHEN $leftmouse=cab0_block_grid[2] DO
		Assign_Cab_To_Block(0,2)
	WHEN $leftmouse=cab0_block_grid[3] DO
		Assign_Cab_To_Block(0,3)
	WHEN $leftmouse=cab0_block_grid[4] DO
		Assign_Cab_To_Block(0,4)
	WHEN $leftmouse=cab0_block_grid[5] DO
		Assign_Cab_To_Block(0,5)
	WHEN $leftmouse=cab0_block_grid[6] DO
		Assign_Cab_To_Block(0,6)
	WHEN $leftmouse=cab0_block_grid[7] DO
		Assign_Cab_To_Block(0,7)
	WHEN $leftmouse=cab0_block_grid[8] DO
		Assign_Cab_To_Block(0,8)
	WHEN $leftmouse=cab0_block_grid[9] DO
		Assign_Cab_To_Block(0,9)
	WHEN $leftmouse=cab0_block_grid[10] DO
		Assign_Cab_To_Block(0,10)
	WHEN $leftmouse=cab0_block_grid[11] DO
		Assign_Cab_To_Block(0,11)
	WHEN $leftmouse=cab0_block_grid[12] DO
		Assign_Cab_To_Block(0,12)

	WHEN $leftmouse=cab1_block_grid[1] DO
		Assign_Cab_To_Block(1,1)
	WHEN $leftmouse=cab1_block_grid[2] DO
		Assign_Cab_To_Block(1,2)
	WHEN $leftmouse=cab1_block_grid[3] DO
		Assign_Cab_To_Block(1,3)
	WHEN $leftmouse=cab1_block_grid[4] DO
		Assign_Cab_To_Block(1,4)
	WHEN $leftmouse=cab1_block_grid[5] DO
		Assign_Cab_To_Block(1,5)
	WHEN $leftmouse=cab1_block_grid[6] DO
		Assign_Cab_To_Block(1,6)
	WHEN $leftmouse=cab1_block_grid[7] DO
		Assign_Cab_To_Block(1,7)
	WHEN $leftmouse=cab1_block_grid[8] DO
		Assign_Cab_To_Block(1,8)
	WHEN $leftmouse=cab1_block_grid[9] DO
		Assign_Cab_To_Block(1,9)
	WHEN $leftmouse=cab1_block_grid[10] DO
		Assign_Cab_To_Block(1,11)
	WHEN $leftmouse=cab1_block_grid[11] DO
		Assign_Cab_To_Block(1,11)
	WHEN $leftmouse=cab1_block_grid[12] DO
		Assign_Cab_To_Block(1,12)

	WHEN $leftmouse=cab2_block_grid[1] DO
		Assign_Cab_To_Block(2,1)
	WHEN $leftmouse=cab2_block_grid[2] DO
		Assign_Cab_To_Block(2,2)
	WHEN $leftmouse=cab2_block_grid[3] DO
		Assign_Cab_To_Block(2,3)
	WHEN $leftmouse=cab2_block_grid[4] DO
		Assign_Cab_To_Block(2,4)
	WHEN $leftmouse=cab2_block_grid[5] DO
		Assign_Cab_To_Block(2,5)
	WHEN $leftmouse=cab2_block_grid[6] DO
		Assign_Cab_To_Block(2,6)
	WHEN $leftmouse=cab2_block_grid[7] DO
		Assign_Cab_To_Block(2,7)
	WHEN $leftmouse=cab2_block_grid[8] DO
		Assign_Cab_To_Block(2,8)
	WHEN $leftmouse=cab2_block_grid[9] DO
		Assign_Cab_To_Block(2,9)
	WHEN $leftmouse=cab2_block_grid[10] DO
		Assign_Cab_To_Block(2,12)
	WHEN $leftmouse=cab2_block_grid[11] DO
		Assign_Cab_To_Block(2,11)
	WHEN $leftmouse=cab2_block_grid[12] DO
		Assign_Cab_To_Block(2,12)

	WHEN $leftmouse=cab3_block_grid[1] DO
		Assign_Cab_To_Block(3,1)
	WHEN $leftmouse=cab3_block_grid[2] DO
		Assign_Cab_To_Block(3,2)
	WHEN $leftmouse=cab3_block_grid[3] DO
		Assign_Cab_To_Block(3,3)
	WHEN $leftmouse=cab3_block_grid[4] DO
		Assign_Cab_To_Block(3,4)
	WHEN $leftmouse=cab3_block_grid[5] DO
		Assign_Cab_To_Block(3,5)
	WHEN $leftmouse=cab3_block_grid[6] DO
		Assign_Cab_To_Block(3,6)
	WHEN $leftmouse=cab3_block_grid[7] DO
		Assign_Cab_To_Block(3,7)
	WHEN $leftmouse=cab3_block_grid[8] DO
		Assign_Cab_To_Block(3,8)
	WHEN $leftmouse=cab3_block_grid[9] DO
		Assign_Cab_To_Block(3,9)
	WHEN $leftmouse=cab3_block_grid[10] DO
		Assign_Cab_To_Block(3,13)
	WHEN $leftmouse=cab3_block_grid[11] DO
		Assign_Cab_To_Block(3,11)
	WHEN $leftmouse=cab3_block_grid[12] DO
		Assign_Cab_To_Block(3,12)
		
'********************************************************************
'*** 	Detect activation of Cab Speed Buttons


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
				
	WHEN $leftmouse=cab1_Brake_Grid DO			
		*Cab_Brake_Pointer[1]=	*Cab_Brake_Pointer[1]~,		
		IF *Cab_Brake_Pointer[1]=on then,		
			$Color Track(Cab1_Brake_Grid)=red,	
		ELSE,		
			$Color Track(Cab1_Brake_Grid)=Black,	
				
		ENDIF		
				
	WHEN $leftmouse=cab2_Brake_Grid DO			
		*Cab_Brake_Pointer[2]=	*Cab_Brake_Pointer[2]~,		
		IF *Cab_Brake_Pointer[2]=on then,		
			$Color Track(Cab2_Brake_Grid)=red,	
		ELSE,		
			$Color Track(Cab2_Brake_Grid)=Black,	
				
		ENDIF		
				
	WHEN $leftmouse=cab3_Brake_Grid DO			
		*Cab_Brake_Pointer[3]=	*Cab_Brake_Pointer[3]~,		
		IF *Cab_Brake_Pointer[3]=on then,			
			$Color Track(Cab3_Brake_Grid)=red,	
		ELSE,		
			$Color Track(Cab3_Brake_Grid)=Black,	
				
		ENDIF		
				
	
'********************************************************************			
'** 	Detect activation of pushbuttons for cab direction		
'**					
				
	WHEN $leftmouse=cab1_Direction_Grid DO			
		*Cab_Direction_Pointer[1]=*Cab_Direction_Pointer[1]~,		
		IF *Cab_Direction_Pointer[1]=Reverse then,		
			$Draw Sprite(Cab1_F_R_Indication_Grid)=Arrow_South in Red,	
		ELSE,		
			$Draw Sprite(Cab1_F_R_Indication_Grid)=Arrow_North in Green,	
				
		ENDIF		
				
	WHEN $leftmouse=cab2_Direction_Grid DO			
		*Cab_Direction_Pointer[2]=*Cab_Direction_Pointer[2]~,		
		IF *Cab_Direction_Pointer[2]=Reverse then,	
			$Draw Sprite(Cab2_F_R_Indication_Grid)=Arrow_South in Red,	
		ELSE,		
			$Draw Sprite(Cab2_F_R_Indication_Grid)=Arrow_North in Green,	
				
		ENDIF		
				
	WHEN $leftmouse=cab3_Direction_Grid DO			
		*Cab_Direction_Pointer[3]=*Cab_Direction_Pointer[3]~,		
		IF *Cab_Direction_Pointer[3]=Reverse then,	
			$Draw Sprite(Cab3_F_R_Indication_Grid)=Arrow_South in Red,	
		ELSE,		
			$Draw Sprite(Cab3_F_R_Indication_Grid)=Arrow_North in Green,	
				
		ENDIF		
				
				

'********************  TURNOUTS  ********************			
'******** 	Throw Tortoise Switch and corresponding display on panel

SUB Throw_Tortoise(TurnOutNum,ctc_Grid)
	$Switch(ctc_Grid)=$Switch(ctc_Grid)~
	*tortoise_Pointer[TurnoutNum]=*tortoise_Pointer[TurnoutNum]~
ENDSUB



'**	Detect activation of turnouts on panel or Turnout Micro Switches		
'		Call subroutine	
'			Left click changes tortoise direction, indicating diverging route with red on panel, main route with green		
		
	WHEN $Leftmouse=Turnout_Grid[1] or *Turnout_Button_Pointer[1]=on DO
		Throw_Tortoise(1,Turnout_Grid[1])
		Tortoise_Status[1]=*Tortoise_Pointer[1]
						
	WHEN $Leftmouse=Turnout_Grid[2] or *Turnout_Button_Pointer[2]=on DO
		Throw_Tortoise(2,Turnout_Grid[2])
		Tortoise_Status[2]=*Tortoise_Pointer[2]
		
	WHEN $Leftmouse=Turnout_Grid[3] or *Turnout_Button_Pointer[3]=on DO
		Throw_Tortoise(1,Turnout_Grid[3])
		Tortoise_Status[3]=*Tortoise_Pointer[3]
						
	WHEN $Leftmouse=Turnout_Grid[4] or *Turnout_Button_Pointer[4]=on DO
		Throw_Tortoise(2,Turnout_Grid[4])
		Tortoise_Status[4]=*Tortoise_Pointer[4]	
		
	WHEN $Leftmouse=Turnout_Grid[5] or *Turnout_Button_Pointer[5]=on DO
		Throw_Tortoise(1,Turnout_Grid[5])
		Tortoise_Status[5]=*Tortoise_Pointer[5]
						
	WHEN $Leftmouse=Turnout_Grid[6] or *Turnout_Button_Pointer[6]=on DO
		Throw_Tortoise(2,Turnout_Grid[6])
		Tortoise_Status[6]=*Tortoise_Pointer[6]
		
	WHEN $Leftmouse=Turnout_Grid[7] or *Turnout_Button_Pointer[7]=on DO
		Throw_Tortoise(1,Turnout_Grid[7])
		Tortoise_Status[7]=*Tortoise_Pointer[7]
						
	WHEN $Leftmouse=Turnout_Grid[8] or *Turnout_Button_Pointer[8]=on DO
		Throw_Tortoise(2,Turnout_Grid[8])
		Tortoise_Status[8]=*Tortoise_Pointer[8]
		
	WHEN $Leftmouse=Turnout_Grid[9] or *Turnout_Button_Pointer[9]=on DO
		Throw_Tortoise(1,Turnout_Grid[9])
		Tortoise_Status[9]=*Tortoise_Pointer[9]
		
	WHEN $Leftmouse=Turnout_Grid[10] or *Turnout_Button_Pointer[10]=on DO
		Throw_Tortoise(1,Turnout_Grid[10])
		Tortoise_Status[10]=*Tortoise_Pointer[10]
		
	WHEN $Leftmouse=Turnout_Grid[11] or *Turnout_Button_Pointer[11]=on DO
		Throw_Tortoise(1,Turnout_Grid[11])
		Tortoise_Status[11]=*Tortoise_Pointer[11]
		
	WHEN $Leftmouse=Turnout_Grid[12] or *Turnout_Button_Pointer[12]=on DO
		Throw_Tortoise(1,Turnout_Grid[12])
		Tortoise_Status[12]=*Tortoise_Pointer[12]
		
	WHEN $Leftmouse=Turnout_Grid[13] or *Turnout_Button_Pointer[13]=on DO
		Throw_Tortoise(1,Turnout_Grid[13])
		Tortoise_Status[13]=*Tortoise_Pointer[13]
		
	WHEN $Leftmouse=Turnout_Grid[14] or *Turnout_Button_Pointer[14]=on DO
		Throw_Tortoise(1,Turnout_Grid[14])
		Tortoise_Status[14]=*Tortoise_Pointer[14]
		
	WHEN $Leftmouse=Turnout_Grid[15] or *Turnout_Button_Pointer[15]=on DO
		Throw_Tortoise(1,Turnout_Grid[15])
		Tortoise_Status[15]=*Tortoise_Pointer[15]
		
	WHEN $Leftmouse=Turnout_Grid[16] or *Turnout_Button_Pointer[16]=on DO
		Throw_Tortoise(1,Turnout_Grid[16])
		Tortoise_Status[16]=*Tortoise_Pointer[16]
		
	WHEN $Leftmouse=Turnout_Grid[17] or *Turnout_Button_Pointer[17]=on DO
		Throw_Tortoise(1,Turnout_Grid[17])
		Tortoise_Status[17]=*Tortoise_Pointer[17]
		
	WHEN $Leftmouse=Turnout_Grid[18] or *Turnout_Button_Pointer[18]=on DO
		Throw_Tortoise(1,Turnout_Grid[18])
		Tortoise_Status[18]=*Tortoise_Pointer[18]

'********************************************************************
'**	LOOP through East and West current detectors to determine block occupancy

	WHEN *CD_East_Pointer[1]=occupied DO
		block_occupancy_on (block_Grid[1], 
			Block_Color[1], 
			Train_E_Sprite[1]),
		Block_Sprite[1]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[1],1),
		Block_Status[1]=1,
	WHEN *CD_West_Pointer[1]=occupied DO
		block_occupancy_on (block_Grid[1], 
			Block_Color[1], 
			Train_W_Sprite[1]),
		Block_Sprite[1]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[1],1),
		Block_Status[1]=1,
	WHEN  *CD_East_Pointer[1]=vacant and *CD_West_Pointer[1]=vacant DO
		block_occupancy_off(block_Grid[1],
			Block_Color[1]),
			Block_Sprite[1]=Square,
		Block_Status[1]=0,

	WHEN *CD_East_Pointer[2]=occupied  do
		block_occupancy_on (block_Grid[2], 
			Block_Color[2], 
			Train_E_Sprite[2]),
		Block_Sprite[2]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[2],2),
		Block_Status[2]=1,
	WHEN *CD_West_Pointer[2]=occupied DO
		block_occupancy_on (block_Grid[2], 
			Block_Color[2], 
			Train_W_Sprite[2]),
		Block_Sprite[2]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[2],2),
		Block_Status[2]=1,
	WHEN  *CD_East_Pointer[2]=vacant and *CD_West_Pointer[2]=vacant DO
		block_occupancy_off(block_Grid[2],
			Block_Color[2]),
			Block_Sprite[2]=Square,
		Block_Status[2]=0,

	WHEN *CD_East_Pointer[3]=occupied  do
		block_occupancy_on (block_Grid[3], 
			Block_Color[3], 
			Train_E_Sprite[3]),
		Block_Sprite[3]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[3],3),
		Block_Status[3]=1,
	WHEN *CD_West_Pointer[3]=occupied DO
		block_occupancy_on (block_Grid[3], 
			Block_Color[3], 
			Train_W_Sprite[3]),
		Block_Sprite[3]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[3],3),
		Block_Status[3]=1,
	WHEN  *CD_East_Pointer[3]=vacant and *CD_West_Pointer[3]=vacant DO
		block_occupancy_off(block_Grid[3],
			Block_Color[3]),
			Block_Sprite[3]=Square,
		Block_Status[3]=0,

	WHEN *CD_East_Pointer[4]=occupied  do
		block_occupancy_on (block_Grid[4], 
			Block_Color[4], 
			Train_E_Sprite[4]),
		Block_Sprite[4]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[4],4),
		Block_Status[4]=1,
	WHEN *CD_West_Pointer[4]=occupied DO
		block_occupancy_on (block_Grid[4], 
			Block_Color[4], 
			Train_W_Sprite[4]),
		Block_Sprite[4]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[4],4),
		Block_Status[4]=1,
	WHEN  *CD_East_Pointer[4]=vacant and *CD_West_Pointer[4]=vacant DO
		block_occupancy_off(block_Grid[4],
			Block_Color[4]),
			Block_Sprite[4]=Square,
		Block_Status[4]=0,

	WHEN *CD_East_Pointer[5]=occupied  do
		block_occupancy_on (block_Grid[5], 
			Block_Color[5], 
			Train_E_Sprite[5]),
		Block_Sprite[5]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[5],5),
		Block_Status[5]=1,
	WHEN *CD_West_Pointer[5]=occupied DO
		block_occupancy_on (block_Grid[5], 
			Block_Color[5], 
			Train_W_Sprite[5]),
		Block_Sprite[5]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[5],5),
		Block_Status[5]=1,
	WHEN  *CD_East_Pointer[5]=vacant and *CD_West_Pointer[5]=vacant DO
		block_occupancy_off(block_Grid[5],
			Block_Color[5]),
			Block_Sprite[5]=Square,
		Block_Status[5]=0,

	WHEN *CD_East_Pointer[6]=occupied  do
		block_occupancy_on (block_Grid[6], 
			Block_Color[6], 
			Train_E_Sprite[6]),
		Block_Sprite[6]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[6],6),
		Block_Status[6]=1,
	WHEN *CD_West_Pointer[6]=occupied DO
		block_occupancy_on (block_Grid[6], 
			Block_Color[6], 
			Train_W_Sprite[6]),
		Block_Sprite[6]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[6],6),
		Block_Status[6]=1,
	WHEN  *CD_East_Pointer[6]=vacant and *CD_West_Pointer[6]=vacant DO
		block_occupancy_off(block_Grid[6],
			Block_Color[6]),
			Block_Sprite[6]=Square,
		Block_Status[6]=0,

	WHEN *CD_East_Pointer[7]=occupied  do
		block_occupancy_on (block_Grid[7], 
			Block_Color[7], 
			Train_E_Sprite[7]),
		Block_Sprite[7]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[7],7),
		Block_Status[7]=1,
	WHEN *CD_West_Pointer[7]=occupied DO
		block_occupancy_on (block_Grid[7], 
			Block_Color[7], 
			Train_W_Sprite[7]),
		Block_Sprite[7]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[7],7),
		Block_Status[7]=1,
	WHEN  *CD_East_Pointer[7]=vacant and *CD_West_Pointer[7]=vacant DO
		block_occupancy_off(block_Grid[7],
			Block_Color[7]),
			Block_Sprite[7]=Square,
		Block_Status[7]=0,

	WHEN *CD_East_Pointer[8]=occupied  do
		block_occupancy_on (block_Grid[8], 
			Block_Color[8], 
			Train_E_Sprite[8]),
		Block_Sprite[8]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[8],8),
		Block_Status[8]=1,
	WHEN *CD_West_Pointer[8]=occupied DO
		block_occupancy_on (block_Grid[8], 
			Block_Color[8], 
			Train_W_Sprite[8]),
		Block_Sprite[8]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[8],8),
		Block_Status[8]=1,
	WHEN  *CD_East_Pointer[8]=vacant and *CD_West_Pointer[8]=vacant DO
		block_occupancy_off(block_Grid[8],
			Block_Color[8]),
			Block_Sprite[8]=Square,
		Block_Status[8]=0,

	WHEN *CD_East_Pointer[9]=occupied  do
		block_occupancy_on (block_Grid[9], 
			Block_Color[9], 
			Train_E_Sprite[9]),
		Block_Sprite[9]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[9],9),
		Block_Status[9]=1,
	WHEN *CD_West_Pointer[9]=occupied DO
		block_occupancy_on (block_Grid[9], 
			Block_Color[9], 
			Train_W_Sprite[9]),
		Block_Sprite[9]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[9],9),
		Block_Status[9]=1,
	WHEN  *CD_East_Pointer[9]=vacant and *CD_West_Pointer[9]=vacant DO
		block_occupancy_off(block_Grid[9],
			Block_Color[9]),
			Block_Sprite[9]=Square,
		Block_Status[9]=0,

	WHEN *CD_East_Pointer[10]=occupied  do
		block_occupancy_on (block_Grid[10], 
			Block_Color[10], 
			Train_E_Sprite[10]),
		Block_Sprite[10]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[10],10),
		Block_Status[10]=1,
	WHEN *CD_West_Pointer[10]=occupied DO
		block_occupancy_on (block_Grid[10], 
			Block_Color[10], 
			Train_W_Sprite[10]),
		Block_Sprite[10]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[10],10),
		Block_Status[10]=1,
	WHEN  *CD_East_Pointer[10]=vacant and *CD_West_Pointer[10]=vacant DO
		block_occupancy_off(block_Grid[10],
			Block_Color[10]),
			Block_Sprite[10]=Square,
		Block_Status[10]=0,

	WHEN *CD_East_Pointer[11]=occupied  do
		block_occupancy_on (block_Grid[11], 
			Block_Color[11], 
			Train_E_Sprite[11]),
		Block_Sprite[11]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[11],11),
		Block_Status[11]=1,
	WHEN *CD_West_Pointer[11]=occupied DO
		block_occupancy_on (block_Grid[11], 
			Block_Color[11], 
			Train_W_Sprite[11]),
		Block_Sprite[11]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[11],11),
		Block_Status[11]=1,
	WHEN  *CD_East_Pointer[11]=vacant and *CD_West_Pointer[11]=vacant DO
		block_occupancy_off(block_Grid[11],
			Block_Color[11]),
			Block_Sprite[11]=Square,
		Block_Status[11]=0,

	WHEN *CD_East_Pointer[12]=occupied  do
		block_occupancy_on (block_Grid[12], 
			Block_Color[12], 
			Train_E_Sprite[12]),
		Block_Sprite[12]=Arrow_East,
		Assign_Cab_To_Block(Block_Cab[12],12),
		Block_Status[12]=1,
	WHEN *CD_West_Pointer[12]=occupied DO
		block_occupancy_on (block_Grid[12], 
			Block_Color[12], 
			Train_W_Sprite[12]),
		Block_Sprite[12]=Arrow_West,
		Assign_Cab_To_Block(Block_Cab[12],12),
		Block_Status[12]=1,
	WHEN  *CD_East_Pointer[12]=vacant and *CD_West_Pointer[12]=vacant DO
		block_occupancy_off(block_Grid[12],
			Block_Color[12]),
			Block_Sprite[12]=Square,
		Block_Status[12]=0,

'********************************************************************
'	LOOP through East and West InfraRed detectors to determine block occupancy
		
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


'********************************************************************
'	LOOP through EOT InfraRed detectors to determine block occupancy

'	WHEN IR_EOT_Detector[0]=occupied DO
'		$Draw Sprite(IR_EOT_Detector_Grid[0])= IR_EOT_Detector_Shape[0] in red
'	WHEN IR_EOT_Detector[0]=VACANT DO
'		$Erase Sprite(IR_EOT_Detector_Grid[0])



