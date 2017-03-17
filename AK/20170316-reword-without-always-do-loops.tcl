'************************************************************************************
'														*
'						DECLARATIONS						*
'														*
'************************************************************************************

CONSTANTS:
	TURNOUT_NORMAL = Off ' (green)
	TURNOUT_DIVERGING = On ' (red)

	DETECTOR_BLOCK_OCCUPIED = True
	DETECTOR_BLOCK_VACANT = False

	COLOR_UNSELECTED_SPEED = $RGB_DFDFDF
	COLOR_MANUAL_CAB = $RGB_FF0000
	COLOR_CAB_1 = $RGB_2492FF
	COLOR_CAB_2 = $RGB_008000
	COLOR_CAB_3 = $RGB_005EBB

	INITIAL_BLOCK_INDEX = 1
	MAX_BLOCK_INDEX = 13
	INITIAL_TURNOUT_INDEX = 1
	MAX_TURNOUT_INDEX = 19

	MANUAL_CAB_INDEX = 0
	INITIAL_CAB_INDEX = 1
	MAX_CAB_INDEX = 4

	INITIALIZING = 0
	OPERATING = 1

	MAX_CAB_SPEED_INDEX = 12

	MAX_SPEED_NOTCH_INDEX = 11
	SPEED_NOTCH_INCREMENT = 6

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
''''''''''' Turnout Control Board "a"
'''''''''''
' YardMaster "1"
CONTROLS:YMC01TCa1, YMC02TCa1, YMC03TCa1, YMC04TCa1, YMC05TCa1, YMC06TCa1, YMC07TCa1, YMC08TCa1, YMC09TCa1, YMC10TCa1, YMC11TCa1, YMC12TCa1, YMC13TCa1, YMC14TCa1, YMC15TCa1, YMC16TCa1
' Sentry "1"
SENSORS:SES01TCa2, SES02TCa2, SES03TCa2, SES04TCa2, SES05TCa2, SES06TCa2, SES07TCa2, SES08TCa2, SES09TCa2, SES10TCa2, SES11TCa2, SES12TCa2, SES13TCa2, SES14TCa2, SES15TCa2, SES16TCa2

'''''''''''
''''''''''' Track Control board "a"
'''''''''''
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
'''''''''''
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
'''''''''''
' Train Brain "1"
CONTROLS: 	TBC01BCc1, TBC02BCc1, TBC03BCc1, TBC04BCc1
SENSORS:	TBS01BCc1#, TBS02BCc1#, TBS03BCc1#, TBS04BCc1#
' Train Brain "2"
CONTROLS: 	TBC01BCc2, TBC02BCc2, TBC03BCc2, TBC04BCc2
SENSORS:	TBS01BCc2#, TBS02BCc2#, TBS03BCc2#, TBS04BCc2#
'Dash-8 "1"
CONTROLS:	D8C01BCc3, D8C02BCc3, D8C03BCc3, D8C04BCc3, D8C05BCc3, D8C06BCc3, D8C07BCc3, D8C08BCc3

'''''''''''
''''''''''' Turnout Control Board "b"
'''''''''''
' YardMaster "1"
CONTROLS:YMC01TCb1, YMC02TCb1, YMC03TCb1, YMC04TCb1, YMC05TCb1, YMC06TCb1, YMC07TCb1, YMC08TCb1, YMC09TCb1, YMC10TCb1, YMC11TCb1, YMC12TCb1, YMC13TCb1, YMC14TCb1, YMC15TCb1, YMC16TCb1
' Sentry "1"
SENSORS:SES01TCb2, SES02TCb2, SES03TCb2, SES04TCb2, SES05TCb2, SES06TCb2, SES07TCb2, SES08TCb2, SES09TCb2, SES10TCb2, SES11TCb2, SES12TCb2, SES13TCb2, SES14TCb2, SES15TCb2, SES16TCb2

'''''''''''
''''''''''' Detection Board "a"
'''''''''''
' Sentry "1"
' SENSORS:	SES01DTa1, SES02DTa1, SES03DTa1, SES04DTa1, SES05DTa1, SES06DTa1, SES07DTa1, SES08DTa1, SES09DTa1, SES10DTa1, SES11DTa1, SES12DTa1, SES13DTa1, SES14DTa1, SES15DTa1, SES16DTa1

'''''''''''
''''''''''' Detection Board "b"
'''''''''''
' Sentry "1"
' SENSORS:	SES01DTb1, SES02DTb1, SES03DTb1, SES04DTb1, SES05DTb1, SES06DTb1, SES07DTb1, SES08DTb1, SES09DTb1, SES10DTb1, SES11DTb1, SES12DTb1, SES13DTb1, SES14DTb1, SES15DTb1, SES16DTb1

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

	BlockStatus[MAX_BLOCK_INDEX]

' Holds address for Tortoise Machine controls
	Tortoise_Pointer[MAX_TURNOUT_INDEX]

' Holds address of Sensors for Manual turnout buttons
	Turnout_Button_Pointer[MAX_TURNOUT_INDEX]

' Holds address of 3 smart cabs and their functions (cab[0] is placeholder for manual cab and functions)
	Cab_Pointer[MAX_CAB_INDEX]
	Cab_Speed_Pointer[MAX_CAB_INDEX]		'* holds address for speed for each cab
	Cab_Direction_Pointer[MAX_CAB_INDEX]	'* holds address for direction for each cab
	Cab_Momentum_Pointer[MAX_CAB_INDEX]		'* Holds address formomentum for each cab
	Cab_Brake_Pointer[MAX_CAB_INDEX]		'* Holds address for brake for each cab

' Indexes for loops
	BlockIndex ' BIndex
	SpeedIndex ' SIndex
	OccupancyIndex
	IR_Detector_Index	'LOOP counter for checking IR detectors status
	CurrentSensorIndex 	'LOOP counter for checking current sensors status
	QueryIndex
	CabAssignIndex
	TurnoutIndex
	CabIndex ' CIndex
	NotchIndex
	index

' Used in subroutines
	blocknum ' BNum
	cabnum ' CNum

	InitStatus
	x
	y
	Block_Color
	TempTurnoutIndex
' Status holders
	Tortoise_Status[MAX_TURNOUT_INDEX]	'holds status of each turnout
	TurnoutButton_Status
	Mouse_Status				' holds mouse status to prevent multiple actions on single click
	Block_Status[MAX_BLOCK_INDEX]
	Block_Cab[MAX_BLOCK_INDEX]		'* holds cab assignment for each block
	OccupyEast[MAX_BLOCK_INDEX]		'* holds status of current sensors
	OccupyWest[MAX_BLOCK_INDEX]		'* holds status of current sensors

'* Arrays to hold Grid coordinates for panel display
	Block_Grid[MAX_BLOCK_INDEX]
	Turnout_Grid[MAX_TURNOUT_INDEX]
		
	IR_Detector_Grid_E[12]
	IR_Detector_Grid_W[12]
	IR_EOT_Detector_Grid[3]
	
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
	IR_EOT_Detector_Shape[2]

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

'******** 	Throw Atlas Switch and corresponding display on panel

'SUB Throw_Atlas(TurnOutNum,onoff,ctc_Grid)
'	$Switch(ctc_Grid)=onoff
'	*tortoise_Pointer[TurnoutNum]=onoff
'ENDSUB

'******** 	Throw Tortoise Switch and corresponding display on panel

SUB Throw_Tortoise(TurnOutNum,ctc_Grid)
	$Switch(ctc_Grid)=$Switch(ctc_Grid)~
	*tortoise_Pointer[TurnoutNum]=*tortoise_Pointer[TurnoutNum]~
ENDSUB

'******** 	Assign selected cab to designated blocks)
'			Calls subroutine to configure corresponding trainbrain controls
'			Colors block sprite with selected cab color
'			Colors selected block buttons with selected cab color and shape on panel

SUB Assign_Cab_To_Block(CIndex,BIndex)
	Block_Cab[BIndex]=CIndex
	Configure_Cab_To_Block(BIndex,CIndex)
	$Color Sprite(Block_Grid[BIndex])=Cab_Color[CIndex]
	Block_Color[BIndex]=Cab_Color[CIndex]

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


'******** 	Assign selected speed to cab, and update panel buttons

SUB Assign_Speed_To_Cab(CIndex,SIndex)
	*Cab_Speed_Pointer[CIndex]=speed_notch[SIndex], 'Set Actual cab speed
		NotchIndex=10
		UNTIL NotchIndex=SIndex QUICKLOOP
			IF CIndex=1 THEN
				$color Track(cab1_Speed_Grid[NotchIndex]) = COLOR_UNSELECTED_SPEED
			ELSEIF CIndex=2 THEN
				$color Track(cab2_Speed_Grid[NotchIndex]) = COLOR_UNSELECTED_SPEED
			ELSEIF CIndex=3 THEN
				$color Track(cab3_Speed_Grid[NotchIndex]) = COLOR_UNSELECTED_SPEED
			ENDIF
			NotchIndex=-
		ENDLOOP

		NotchIndex=SIndex
		UNTIL NotchIndex=0 QUICKLOOP
			IF CIndex=1 THEN
				$color Track(cab1_Speed_Grid[NotchIndex]) = Cab_Color[1]
			ELSEIF CIndex=2 THEN
				$color Track(cab2_Speed_Grid[NotchIndex]) = Cab_Color[2]
			ELSEIF CIndex=3 THEN
				$color Track(cab3_Speed_Grid[NotchIndex]) = Cab_Color[3]
			ENDIF
			NotchIndex=-
		ENDLOOP
ENDSUB

'********   INIT
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
	*Cab_Speed_Pointer[1]=10
	*Cab_Direction_Pointer[1]=forward

	*Cab_Brake_Pointer[2]=on
	*Cab_Speed_Pointer[2]=10
	*Cab_Direction_Pointer[2]=forward
	
	*Cab_Brake_Pointer[2]=on
	*Cab_Speed_Pointer[2]=10
	*Cab_Direction_Pointer[2]=forward
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

	UNTIL BIndex = MAX_TURNOUT_INDEX QUICKLOOP
		IF OccupyEast[BIndex]=on then
			Block_Sprite[BIndex]=Arrow_East
			Block_Cab[BIndex]=CIndex
			Block_Color[BIndex]=cab_color[CIndex]
			Configure_Cab_To_Block(BIndex,CIndex)
			Block_occupancy_on (block_Grid[BIndex], Block_Color[BIndex], Train_E_Sprite[BIndex])
			Assign_Cab_To_Block(CIndex ,BIndex,BIndex)

			CIndex = 1+
		ELSE
			Block_Sprite[BIndex]=square
			Block_occupancy_off(block_Grid[BIndex], Block_Color[BIndex], lock)
			Assign_Cab_To_Block(CIndex ,BIndex,BIndex)
		ENDIF

		BIndex=+
	ENDLOOP
ENDSUB

SUB Initialize_Set_All_Turnouts_To_Normal({Local} TIndex)
	TIndex = INITIAL_TURNOUT_INDEX
	UNTIL TIndex >= MAX_TURNOUT_INDEX LOOP
		*tortoise_Pointer[TIndex]=on
		TIndex = 1+
	ENDLOOP
ENDSUB
	
'************************************************************************************
'					   INITIALIZATION
'************************************************************************************

WHEN InitStatus = INITIALIZING DO '(All lines must end in a comma to continue the initialization chain)

' set address pointers to cab selection controllers

	CAB_AorB_Pointer[8] = &TBC01BCa1, CAB_AorB_Pointer[5] = &TBC02BCa1, CAB_AorB_Pointer[1] = &TBC03BCa1, CAB_AorB_Pointer[9] = &TBC04BCa1
	CAB_CorD_Pointer[8] = &TBC01BCa2, CAB_CorD_Pointer[5] = &TBC02BCa2, CAB_CorD_Pointer[1] = &TBC03BCa2, CAB_CorD_Pointer[9] = &TBC04BCa2
	CAB_ABorCD_Pointer[8]=&D8C01BCa3, CAB_ABorCD_Pointer[5]=&D8C02BCa3, CAB_ABorCD_Pointer[1]=&D8C03BCa3, CAB_ABorCD_Pointer[9]=&D8C04BCa3
	' SPARE=&D8C05BCa3, SPARE=&D8C06BCa3, SPARE=&D8C07BCa3, SPARE=&D8C08BCa3

	CAB_AorB_Pointer[7] = &TBC01BCb1, CAB_AorB_Pointer[11] = &TBC02BCb1, CAB_AorB_Pointer[4] = &TBC03BCb1, 'CAB_AorB_Pointer[12] = &TBC04BCb1
	CAB_CorD_Pointer[7] = &TBC01BCb2, CAB_CorD_Pointer[11] = &TBC02BCb2, CAB_CorD_Pointer[4] = &TBC03BCb2, 'CAB_CorD_Pointer[12] = &TBC04BCb2
	CAB_ABorCD_Pointer[7]=&D8C01BCb3, CAB_ABorCD_Pointer[11]=&D8C02BCb3, CAB_ABorCD_Pointer[4]=&D8C03BCb3, 'CAB_ABorCD_Pointer[12]=&D8C04BCb3
	' SPARE=&D8C05BCb3, SPARE=&D8C06BCb3, SPARE=&D8C07BCb3, SPARE=&D8C08BCb3

	CAB_AorB_Pointer[2] = &TBC01BCc1, CAB_AorB_Pointer[6] = &TBC02BCc1, CAB_AorB_Pointer[10] = &TBC03BCc1, CAB_AorB_Pointer[3] = &TBC04BCc1
	CAB_CorD_Pointer[2] = &TBC01BCc2, CAB_CorD_Pointer[6] = &TBC02BCc2, CAB_CorD_Pointer[10] = &TBC03BCc2, CAB_CorD_Pointer[3] = &TBC04BCc2
	CAB_ABorCD_Pointer[2]=&D8C01BCc3, CAB_ABorCD_Pointer[6]=&D8C02BCc3, CAB_ABorCD_Pointer[10]=&D8C03BCc3, CAB_ABorCD_Pointer[3]=&D8C04BCc3
	' SPARE=&D8C05BCc3, SPARE=&D8C06BCc3, SPARE=&D8C07BCc3, SPARE=&D8C08BCc3

' set address pointers to Current Detector Sensors

	CD_East_Pointer[8]=&TBS01BCa1, CD_West_Pointer[8]=&TBS02BCa1, CD_East_Pointer[5]=&TBS03BCa1, CD_West_Pointer[5]=&TBS04BCa1
	CD_East_Pointer[1]=&TBS01BCa2, CD_West_Pointer[1]=&TBS02BCa2, CD_East_Pointer[9]=&TBS03BCa2, CD_West_Pointer[9]=&TBS04BCa2

	CD_East_Pointer[7]=&TBS01BCb1, CD_West_Pointer[7]=&TBS02BCb1, CD_East_Pointer[11]=&TBS03BCb1, CD_West_Pointer[11]=&TBS04BCb1
	CD_East_Pointer[4]=&TBS01BCb2, CD_West_Pointer[4]=&TBS02BCb2, 'CD_East_Pointer[12]=&TBS03BCb2, CD_West_Pointer[12]=&TBS04BCb2

	CD_East_Pointer[2] =&TBS01BCc1, CD_West_Pointer[2] =&TBS02BCc1, CD_East_Pointer[6]=&TBS03BCc1, CD_West_Pointer[6]=&TBS04BCc1
	CD_East_Pointer[10]=&TBS01BCc2, CD_West_Pointer[10]=&TBS02BCc2, CD_East_Pointer[3]=&TBS03BCc2, CD_West_Pointer[3]=&TBS04BCc2
	
	' set address pointers to Turnout_Button Controls

	'Tortoise_Pointer[1]=&YMC01TCa1
	'Tortoise_Pointer[2]=&YMC02TCa1
	'Tortoise_Pointer[3]=&YMC03TCa1
	'Tortoise_Pointer[12]=&YMC04TCa1
	'Tortoise_Pointer[13]=&YMC05TCa1
	'Tortoise_Pointer[14]=&YMC06TCa1
	'Tortoise_Pointer[15]=&YMC07TCa1
	'Tortoise_Pointer[16]=&YMC08TCa1
	'Spares YMC09TCa1,YMC10TCa1,YMC11TCa1,YMC12TCa1
	Tortoise_Pointer[5]=&YMC13TCa1
	Tortoise_Pointer[6]=&YMC14TCa1
	Tortoise_Pointer[7]=&YMC15TCa1
	Tortoise_Pointer[8]=&YMC16TCa1

	'Tortoise_Pointer[4]=&YMC01TCb1
	'Tortoise_Pointer[5]=&YMC02TCb1
	'Tortoise_Pointer[6]=&YMC03TCb1
	'Tortoise_Pointer[7]=&YMC04TCb1
	'Tortoise_Pointer[8]=&YMC05TCb1
	'Tortoise_Pointer[9]=&YMC06TCb1
	'Tortoise_Pointer[10]=&YMC07TCb1
	'Tortoise_Pointer[11]=&YMC08TCb1
	'Tortoise_Pointer[17]=&YMC09TCb1
	'Tortoise_Pointer[18]=&YMC10TCb1
	' SPARES YMC11TCb1,YMC12TCb1,YMC13TCb1,YMC14TCb1,YMC15TCb1,YMC16TCb1

' set address pointers to Turnout Push Button Sensors

	'Turnout_Button_Pointer[1]=&SES01TCa2
	'Turnout_Button_Pointer[2]=&SES02TCa2
	'Turnout_Button_Pointer[3]=&SES03TCa2
	'Turnout_Button_Pointer[12]=&SES04TCa2
	'Turnout_Button_Pointer[13]=&SES05TCa2
	'Turnout_Button_Pointer[14]=&SES06TCa2
	'Turnout_Button_Pointer[15]=&SES07TCa2
	'Turnout_Button_Pointer[16]=&SES08TCa2
	' SPARES SES09TCa2,SES10TCa2,SES11TCa2,SES12TCa2
	Turnout_Button_Pointer[5]=&SES13TCa2
	Turnout_Button_Pointer[6]=&SES14TCa2
	Turnout_Button_Pointer[7]=&SES15TCa2
	Turnout_Button_Pointer[8]=&SES16TCa2

	'Turnout_Button_Pointer[4]=&SES01TCb2
	'Turnout_Button_Pointer[5]=&SES02TCb2
	'Turnout_Button_Pointer[6]=&SES03TCb2
	'Turnout_Button_Pointer[7]=&SES04TCb2
	'Turnout_Button_Pointer[8]=&SES05TCb2
	'Turnout_Button_Pointer[9]=&SES06TCb2
	'Turnout_Button_Pointer[10]=&SES07TCb2
	'Turnout_Button_Pointer[11]=&SES08TCb2
	'Turnout_Button_Pointer[17]=&SES09TCb2
	'Turnout_Button_Pointer[18]=&SES10TCb2
	' SPARES SES11TCb2,SES12TCb2,SES13TCb2,SES14TCb2,SES15TCb2,SES16TCb2

' set address pointers to Cab Controls and Functions

	Cab_Pointer[1]=&SCP01PBa1
	Cab_Pointer[2]=&SCP01PBa2
	Cab_Pointer[3]=&SCP01PBa3

	Cab_Speed_Pointer[1]=&SCP01PBa1.speed
	Cab_Speed_Pointer[2]=&SCP01PBa2.speed
	Cab_Speed_Pointer[3]=&SCP01PBa3.speed

	Cab_Direction_Pointer[1]=&SCP01PBa1.Direction
	Cab_Direction_Pointer[2]=&SCP01PBa2.Direction
	Cab_Direction_Pointer[3]=&SCP01PBa3.Direction

	Cab_Brake_Pointer[1]=&SCP01PBa1.Brake
	Cab_Brake_Pointer[2]=&SCP01PBa2.Brake
	Cab_Brake_Pointer[3]=&SCP01PBa3.Brake

	Cab_Momentum_Pointer[1]=&SCP01PBa1.Momentum
	Cab_Momentum_Pointer[2]=&SCP01PBa2.Momentum
	Cab_Momentum_Pointer[3]=&SCP01PBa3.Momentum

'**	Initialize panel locations of IR Block Detectors - one at each end of block

	IR_Detector_Grid_E[1]=(46,14,4), IR_Detector_Grid_E[2]=(27,26,4), IR_Detector_Grid_E[3]=(7,18,4), IR_Detector_Grid_E[4]=(24,2,4)
	IR_Detector_Grid_E[5]=(50,17,4), IR_Detector_Grid_E[6]=(24,29,4), IR_Detector_Grid_E[7]=(4,15,4), IR_Detector_Grid_E[8]=(37,6,4)
	IR_Detector_Grid_E[9]=(45,14,4), IR_Detector_Grid_E[10]=(8,19,4), IR_Detector_Grid_E[11]=(6,15,4), 'IR_Detector_Grid_E[12]=

	IR_Detector_Grid_W[1]=(33,26,4), IR_Detector_Grid_W[2]=(7,22,4), IR_Detector_Grid_W[3]=(21,2,4), IR_Detector_Grid_W[4]=(50,13,4)
	IR_Detector_Grid_W[5]=(27,29,4), IR_Detector_Grid_W[6]=(4,21,4), IR_Detector_Grid_W[7]=(30,6,4), IR_Detector_Grid_W[8]=(46,10,4)
	IR_Detector_Grid_W[9]=(34,24,4), IR_Detector_Grid_W[10]=(21,3,4), IR_Detector_Grid_W[11]=(32,7,4), 'IR_Detector_Grid_W[12]=

	IR_EOT_Detector_Grid[0]=(16,5,4), IR_EOT_Detector_Grid[1]=(16,4,4)

'**	Initialize panel locations of tortoise controls

	Turnout_Grid[5]=(46,11,4), Turnout_Grid[6]=(46,16,4), Turnout_Grid[7]=(45,20,4), Turnout_Grid[8]=(29,26,4)
	Turnout_Grid[14]=(33,24,4), Turnout_Grid[9]=(7,21,4), Turnout_Grid[16]=(8,18,4), Turnout_Grid[15]=(7,11,4)
	Turnout_Grid[10]=(23,2,4), Turnout_Grid[11]=(20,2,4), Turnout_Grid[12]=(50,16,4), Turnout_Grid[13]=(50,20,4)
	Turnout_Grid[17]=(4,20,4), Turnout_Grid[1]=(4,18,4), Turnout_Grid[2]=(9,12,4), Turnout_Grid[3]=(32,6,4)
	Turnout_Grid[4]=(35,6,4)

'**	Initialize panel location of track blocks and sprite locations of corresponding sprites

	Block_Grid[1]=(42,26,4), Block_Grid[2]=(15,26,4), Block_Grid[3]=(7,4,4), Block_Grid[4]=(38,2,4)
	Block_Grid[5]=(42,29,4), Block_Grid[6]=(15,29,4), Block_Grid[7]=(13,6,4), Block_Grid[8]=(42,6,4)
	Block_Grid[9]=(42,24,4), Block_Grid[10]=(8,5,4), Block_Grid[11]=(13,7,4)

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
	
	IR_EOT_Detector_Shape[0]=Train_East, IR_EOT_Detector_Shape[1]=Train_East
'**	Initialize colors to indicate cab assignments on blocks and sprites

	Cab_Color[0] = COLOR_MANUAL_CAB
	Cab_Color[1] = COLOR_CAB_1
	Cab_Color[2] = COLOR_CAB_2
	Cab_Color[3] = COLOR_CAB_3

'**	Initialize Cab Speed Pushbutton locations

	Cab1_Speed_Grid[10]=(59,4,4)
	Cab1_Speed_Grid[9]=(59,5,4)
	Cab1_Speed_Grid[8]=(59,6,4)
	Cab1_Speed_Grid[7]=(59,7,4)
	Cab1_Speed_Grid[6]=(59,8,4)
	Cab1_Speed_Grid[5]=(59,9,4)
	Cab1_Speed_Grid[4]=(59,10,4)
	Cab1_Speed_Grid[3]=(59,11,4)
	Cab1_Speed_Grid[2]=(59,12,4)
	Cab1_Speed_Grid[1]=(59,13,4)
	Cab1_Speed_Grid[0]=(59,14,4)
	Cab1_Brake_Grid=(59,16,4)
	Cab1_F_R_Indication_Grid=(59,18,4)
	Cab1_Direction_Grid=(59,18,4)

	Cab2_Speed_Grid[10]=(61,4,4)
	Cab2_Speed_Grid[9]=(61,5,4)
	Cab2_Speed_Grid[8]=(61,6,4)
	Cab2_Speed_Grid[7]=(61,7,4)
	Cab2_Speed_Grid[6]=(61,8,4)
	Cab2_Speed_Grid[5]=(61,9,4)
	Cab2_Speed_Grid[4]=(61,10,4)
	Cab2_Speed_Grid[3]=(61,11,4)
	Cab2_Speed_Grid[2]=(61,12,4)
	Cab2_Speed_Grid[1]=(61,13,4)
	Cab2_Speed_Grid[0]=(61,14,4)
	Cab2_Brake_Grid=(61,16,4)
	Cab2_F_R_Indication_Grid=(61,18,4)
	Cab2_Direction_Grid=(61,18,4)

	Cab3_Speed_Grid[10]=(63,4,4)
	Cab3_Speed_Grid[9]=(63,5,4)
	Cab3_Speed_Grid[8]=(63,6,4)
	Cab3_Speed_Grid[7]=(63,7,4)
	Cab3_Speed_Grid[6]=(63,8,4)
	Cab3_Speed_Grid[5]=(63,9,4)
	Cab3_Speed_Grid[4]=(63,10,4)
	Cab3_Speed_Grid[3]=(63,11,4)
	Cab3_Speed_Grid[2]=(63,12,4)
	Cab3_Speed_Grid[1]=(63,13,4)
	Cab3_Speed_Grid[0]=(63,14,4)
	Cab3_Brake_Grid=(63,16,4)
	Cab3_F_R_Indication_Grid=(63,18,4)
	Cab3_Direction_Grid=(63,18,4)

'**	Initialize Cab to Block Pushbutton locations

	cab0_Block_Grid[1]=(57,21,4)
	cab0_Block_Grid[2]=(57,22,4)
	cab0_Block_Grid[3]=(57,23,4)
	cab0_Block_Grid[4]=(57,24,4)
	cab0_Block_Grid[5]=(57,25,4)
	cab0_Block_Grid[6]=(57,26,4)
	cab0_Block_Grid[7]=(57,27,4)
	cab0_Block_Grid[8]=(57,28,4)
	cab0_Block_Grid[9]=(57,29,4)
	cab0_Block_Grid[10]=(57,30,4)
	cab0_Block_Grid[11]=(57,31,4)

	cab1_Block_Grid[1]=(59,21,4)
	cab1_Block_Grid[2]=(59,22,4)
	cab1_Block_Grid[3]=(59,23,4)
	cab1_Block_Grid[4]=(59,24,4)
	cab1_Block_Grid[5]=(59,25,4)
	cab1_Block_Grid[6]=(59,26,4)
	cab1_Block_Grid[7]=(59,27,4)
	cab1_Block_Grid[8]=(59,28,4)
	cab1_Block_Grid[9]=(59,29,4)
	cab1_Block_Grid[10]=(59,30,4)
	cab1_Block_Grid[11]=(59,31,4)

	cab2_Block_Grid[1]=(61,21,4)
	cab2_Block_Grid[2]=(61,22,4)
	cab2_Block_Grid[3]=(61,23,4)
	cab2_Block_Grid[4]=(61,24,4)
	cab2_Block_Grid[5]=(61,25,4)
	cab2_Block_Grid[6]=(61,26,4)
	cab2_Block_Grid[7]=(61,27,4)
	cab2_Block_Grid[8]=(61,28,4)
	cab2_Block_Grid[9]=(61,29,4)
	cab2_Block_Grid[10]=(61,30,4)
	cab2_Block_Grid[11]=(61,31,4)

	cab3_Block_Grid[1]=(63,21,4)
	cab3_Block_Grid[2]=(63,22,4)
	cab3_Block_Grid[3]=(63,23,4)
	cab3_Block_Grid[4]=(63,24,4)
	cab3_Block_Grid[5]=(63,25,4)
	cab3_Block_Grid[6]=(63,26,4)
	cab3_Block_Grid[7]=(63,27,4)
	cab3_Block_Grid[8]=(63,28,4)
	cab3_Block_Grid[9]=(63,29,4)
	cab3_Block_Grid[10]=(63,30,4)
	cab3_Block_Grid[11]=(63,31,4)

	cab0_All_Blocks_Grid=(57,20,4)
	cab1_All_Blocks_Grid=(59,20,4)
	cab2_All_Blocks_Grid=(61,20,4)
	cab3_All_Blocks_Grid=(63,20,4)

	Initialize_Speed_Index()
	Initialize_Cab_Status()
	Initialize_Cab_Speed_And_Direction_On_Display()
	Initialize_Cab_Direction_Display()

	Assign_Cab_To_All_Blocks(1)
	Initialize_Detect_Initial_Blocks()

	Initialize_Set_All_Turnouts_To_Normal()

'**************************** END OF INITIALIZATION *********************************
	InitStatus = OPERATING

'************************************************************************************
'					   MAIN PROGRAM
'************************************************************************************

'********************************************************************
'*** 	Detect activation of Cab to Block assignment buttons

'*	All Block assignments

WHEN $leftmouse=cab0_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(MANUAL_CAB_INDEX)

WHEN $leftmouse=cab1_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(1)

WHEN $leftmouse=cab2_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(2)

WHEN $leftmouse=cab3_All_Blocks_Grid DO
	Assign_Cab_To_All_Blocks(3)

'*	Individual Block assignments

WHEN $leftmouse=cab0_block_grid[BlockIndex] DO
	Assign_Cab_To_Block(0,BlockIndex)

WHEN $leftmouse=cab1_block_grid[BlockIndex] DO
	Assign_Cab_To_Block(1,BlockIndex)

WHEN $leftmouse=cab2_block_grid[BlockIndex] DO
	Assign_Cab_To_Block(2,BlockIndex)

WHEN $leftmouse=cab3_block_grid[BlockIndex] DO
	Assign_Cab_To_Block(3,BlockIndex)

ALWAYS DO
	IF BlockIndex < MAX_BLOCK_INDEX THEN
		BlockIndex = 1+
	ELSE
		BlockIndex = INITIAL_BLOCK_INDEX
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

ALWAYS DO
	IF SpeedIndex<11 THEN
		SpeedIndex=+
	ELSE
		SpeedIndex=0
	ENDIF

				
'********************************************************************
'** 	Detect activation of pushbuttons for cab brake
'**
				
WHEN $leftmouse=cab1_Brake_Grid DO
	*Cab_Brake_Pointer[1] = *Cab_Brake_Pointer[1]~
	IF *Cab_Brake_Pointer[1]=on THEN
		$Color Track(Cab1_Brake_Grid)=red
	ELSE
		$Color Track(Cab1_Brake_Grid)=Black
	ENDIF
				
WHEN $leftmouse=cab2_Brake_Grid DO
	*Cab_Brake_Pointer[2] = *Cab_Brake_Pointer[2]~
	IF *Cab_Brake_Pointer[2]=on THEN
		$Color Track(Cab2_Brake_Grid)=red
	ELSE
		$Color Track(Cab2_Brake_Grid)=Black
	ENDIF
				
WHEN $leftmouse=cab3_Brake_Grid DO
	*Cab_Brake_Pointer[3] = *Cab_Brake_Pointer[3]~
	IF *Cab_Brake_Pointer[3]=on THEN
		$Color Track(Cab3_Brake_Grid)=red
	ELSE
		$Color Track(Cab3_Brake_Grid)=Black
	ENDIF
				
	
'********************************************************************
'** 	Detect activation of pushbuttons for cab direction
'**
				
WHEN $leftmouse = cab1_Direction_Grid DO
	*Cab_Direction_Pointer[1] = *Cab_Direction_Pointer[1]~
	IF *Cab_Direction_Pointer[1]=Reverse THEN
		$Draw Sprite(Cab1_F_R_Indication_Grid) = Arrow_South in Red
	ELSE
		$Draw Sprite(Cab1_F_R_Indication_Grid) = Arrow_North in Green
	ENDIF
				
WHEN $leftmouse = cab2_Direction_Grid DO
	*Cab_Direction_Pointer[2]=*Cab_Direction_Pointer[2]~
	IF *Cab_Direction_Pointer[2]=Reverse THEN
		$Draw Sprite(Cab2_F_R_Indication_Grid) = Arrow_South in Red
	ELSE
		$Draw Sprite(Cab2_F_R_Indication_Grid) = Arrow_North in Green
	ENDIF
				
WHEN $leftmouse = cab3_Direction_Grid DO
	*Cab_Direction_Pointer[3] = *Cab_Direction_Pointer[3]~
	IF *Cab_Direction_Pointer[3] = Reverse THEN
		$Draw Sprite(Cab3_F_R_Indication_Grid) = Arrow_South in Red
	ELSE
		$Draw Sprite(Cab3_F_R_Indication_Grid) = Arrow_North in Green
	ENDIF

'********************************************************************
'**	Detect activation of turnouts on panel or Turnout Micro Switches
'		Call subroutine
'			Left click changes tortoise direction, indicating diverging route with red on panel, main route with green
		
WHEN $Leftmouse = Turnout_Grid[TurnoutIndex] DO
	Mouse_Status = $LeftMouse
	Throw_Tortoise(TurnoutIndex,Turnout_Grid[TurnoutIndex])
	Tortoise_Status[TurnoutIndex] = *Tortoise_Pointer[TurnoutIndex]
	WAIT UNTIL Mouse_Status <> $LeftMouse THEN
		'Wait until mouse is released

WHEN *Turnout_Button_Pointer[TurnoutIndex] = on DO
	TempTurnoutIndex = TurnoutIndex

	Throw_Tortoise(tempTurnoutIndex,Turnout_Grid[tempTurnoutIndex])
	Tortoise_Status[tempTurnoutIndex] = *Tortoise_Pointer[tempTurnoutIndex]
	WAIT UNTIL *Turnout_Button_Pointer[TempTurnoutIndex] = off THEN

ALWAYS DO
	IF TurnoutIndex < MAX_TURNOUT_INDEX THEN
		TurnoutIndex = 1+
	ELSE
		TurnoutIndex = INITIAL_TURNOUT_INDEX
	ENDIF

'********************************************************************
'**	LOOP through East and West current detectors to determine block occupancy

	IF *CD_East_Pointer[OccupancyIndex] = DETECTOR_BLOCK_OCCUPIED THEN
		block_occupancy_on (block_Grid[OccupancyIndex], Block_Color[OccupancyIndex], Train_E_Sprite[OccupancyIndex])
		Block_Sprite[OccupancyIndex]=Arrow_East
		Assign_Cab_To_Block(Block_Cab[OccupancyIndex],OccupancyIndex,OccupancyIndex)
	ELSEIF *CD_West_Pointer[OccupancyIndex] = DETECTOR_BLOCK_OCCUPIED THEN
		block_occupancy_on (block_Grid[OccupancyIndex], Block_Color[OccupancyIndex], Train_W_Sprite[OccupancyIndex])
		Block_Sprite[OccupancyIndex] = Arrow_West
		Assign_Cab_To_Block(Block_Cab[OccupancyIndex],OccupancyIndex,OccupancyIndex)
	ELSE  block_occupancy_off(block_Grid[OccupancyIndex], Block_Color[OccupancyIndex])
		Block_Sprite[OccupancyIndex] = Square
		Assign_Cab_To_Block(Block_Cab[OccupancyIndex],OccupancyIndex,OccupancyIndex)
	ENDIF

ALWAYS DO
	IF OccupancyIndex < MAX_BLOCK_INDEX THEN
		OccupancyIndex = 1+
	ELSE
		OccupancyIndex = INITIAL_BLOCK_INDEX
	ENDIF