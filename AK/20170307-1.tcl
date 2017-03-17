'************************************************************************************
'														*
'						DECLARATIONS						*
'														*
'************************************************************************************

CONSTANTS:
	Maxblocks=11		'* Max number of blocks for lLOOPs, etc
	MaxBlocksPlusOne=12
	MaxTurnouts=17
	MaxTurnoutsPlusOne=18
	start=21

	mygray=$RGB_DFDFDF	'* Color for unselected speed buttons
	normal=off			'* Normal (green)  position of turnout
	Diverting=on		'* Diverting (red) position of turnout
	Occupied=true		'* For block occupancy
	Vacant=false		'* For block occupancy

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
''''''''''' Turnout Control Board "a"
'''''''''''

' YardMaster "1"
CONTROLS:YMC01TCa1, YMC02TCa1, YMC03TCa1, YMC04TCa1, YMC05TCa1, YMC06TCa1, YMC07TCa1, YMC08TCa1, YMC09TCa1, YMC10TCa1, YMC11TCa1, YMC12TCa1, YMC13TCa1, YMC14TCa1, YMC15TCa1, YMC16TCa1

' Sentry "1"
SENSORS:SES01TCa2, SES02TCa2, SES03TCa2, SES04TCa2, SES05TCa2, SES06TCa2, SES07TCa2, SES08TCa2, SES09TCa2, SES10TCa2, SES11TCa2, SES12TCa2, SES13TCa2, SES14TCa2, SES15TCa2, SES16TCa2


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
	Tortoise_Status[MaxturnoutsPlusOne]	'holds status of each turnout
	Mouse_Status				' holds mouse status to prevent multiple actions on single click
	Block_Status[MaxBlocksPlusOne]
	Block_Cab[MaxBlocksPlusOne]		'* holds cab assignment for each block
	OccupyEast[maxblocksplusOne]		'* holds status of current sensors
	OccupyWest[maxblocksplusOne]		'* holds status of current sensors

'* Arrays to hold Grid coordinates for panel display
	Block_Grid[MaxBlocksPlusOne]
	Turnout_Grid[MaxTurnoutsPlusOne]
		
	IR_Detector_Grid_E[12]
	IR_Detector_Grid_W[12]
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

'******** 	Throw Tortoise Switch and corresponding display on panel

SUB Throw_Tortoise(TurnOutNum,ctc_Grid)
	$Switch(ctc_Grid)=$Switch(ctc_Grid)~
	*tortoise_Pointer[TurnoutNum]=*tortoise_Pointer[TurnoutNum]~
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

SUB Assign_Cab_To_Block(cabnum,startindex,stopindex)
	Stopindex=+
	UNTIL startindex=stopindex QUICKLOOP,
		Block_Cab[startindex]=cabnum,
		Configure_Cab_To_Block(startindex,cabnum),	
		$Color Sprite(Block_Grid[startindex])=Cab_Color[cabnum],
		Block_Color[startindex]=Cab_Color[cabnum],
'			IF cabnum=0 THEN $color Track(cab0_Block_Grid[startindex])=Cab_Color[0],
			IF cabnum=0 THEN $Draw Sprite(cab0_Block_Grid[startindex])=Block_Sprite[startindex] in Cab_Color[0],
'			ELSE $color Track(cab0_Block_Grid[startindex])=mygray,
			ELSE $DRAW SPRITE(cab0_Block_Grid[startindex])=SQUARE in mygray,
			ENDIF,

'			IF cabnum=1 THEN $color Track(cab1_Block_Grid[startindex])=Cab_Color[1],
			IF cabnum=1 THEN $Draw Sprite(cab1_Block_Grid[startindex])=Block_Sprite[startindex] in Cab_Color[1],
'			ELSE $color Track(cab1_Block_Grid[startindex])=mygray,
			ELSE $DRAW SPRITE(cab1_Block_Grid[startindex])=SQUARE in mygray,
			ENDIF,

'			IF cabnum=2 THEN $color Track(cab2_Block_Grid[startindex])=Cab_Color[2],
			IF cabnum=2 THEN $Draw Sprite(cab2_Block_Grid[startindex])=Block_Sprite[startindex] in Cab_Color[2],
'			ELSE $color Track(cab2_Block_Grid[startindex])=mygray,
			ELSE $DRAW SPRITE(cab2_Block_Grid[startindex])=SQUARE in mygray,
			ENDIF,

'			IF cabnum=3 THEN $color Track(cab3_Block_Grid[startindex])=Cab_Color[3],
			IF cabnum=3 THEN $Draw Sprite(cab3_Block_Grid[startindex])=Block_Sprite[startindex] in Cab_Color[3],
'			ELSE $color Track(cab3_Block_Grid[startindex])=mygray,
			ELSE $DRAW SPRITE(cab3_Block_Grid[startindex])=SQUARE in mygray,
			ENDIF,

		startindex=+,
	ENDLOOP
ENDSUB


'******** 	Assign selected speed to cab, and update panel buttons

SUB Assign_Speed_To_Cab(CabIndex,SpeedIndex)
		
	*Cab_Speed_Pointer[CabIndex]=speed_notch[SpeedIndex], 'Set Actual cab speed	
		NotchIndex=10,	
		UNTIL NotchIndex=SpeedIndex QUICKLOOP,	
			IF CabIndex=1 THEN
				$color Track(cab1_Speed_Grid[NotchIndex])=mygray,
			ELSEIF CabIndex=2 THEN
				$color Track(cab2_Speed_Grid[NotchIndex])=mygray,
			ELSEIF CabIndex=3 THEN
				$color Track(cab3_Speed_Grid[NotchIndex])=mygray,
			ENDIF
			NotchIndex=-,
		ENDLOOP,	
			
		NotchIndex=SpeedIndex,	
		UNTIL NotchIndex=0 QUICKLOOP,	
			IF CabIndex=1 THEN
				$color Track(cab1_Speed_Grid[NotchIndex])=Cab_Color[1],
			ELSEIF CabIndex=2 THEN
				$color Track(cab2_Speed_Grid[NotchIndex])=Cab_Color[2],
			ELSEIF CabIndex=3 THEN
				$color Track(cab3_Speed_Grid[NotchIndex])=Cab_Color[3],
			ENDIF
			NotchIndex=-,
		ENDLOOP
ENDSUB
	
'************************************************************************************
'					   INITIALIZATION							
'************************************************************************************

WHEN init=0 do '(All lines must end in a comma to continue the initialization chain)

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
	' SPARE=&D8C05BCa3,
	' SPARE=&D8C06BCa3,
	' SPARE=&D8C07BCa3,
	' SPARE=&D8C08BCa3,

	CAB_AorB_Pointer[7]=&TBC01BCb1,
	CAB_AorB_Pointer[11]=&TBC02BCb1,
	CAB_AorB_Pointer[4]=&TBC03BCb1,
	' SPARE CAB_AorB_Pointer[xx]=&TBC04BCb1,
	CAB_CorD_Pointer[7]=&TBC01BCb2,
	CAB_CorD_Pointer[11]=&TBC02BCb2,
	CAB_CorD_Pointer[4]=&TBC03BCb2,
	' SPARE CAB_CorD_Pointer[xx]=&TBC04BCb2,
	CAB_ABorCD_Pointer[7]=&D8C01BCb3,
	CAB_ABorCD_Pointer[11]=&D8C02BCb3,
	CAB_ABorCD_Pointer[4]=&D8C03BCb3,
	' SPARE CAB_ABorCD_Pointer[xx]=&D8C04BCb3,
	' SPARE=&D8C05BCb3,
	' SPARE=&D8C06BCb3,
	' SPARE=&D8C07BCb3,
	' SPARE=&D8C08BCb3,

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
	' SPARE=&D8C05BCc3,
	' SPARE=&D8C06BCc3,
	' SPARE=&D8C07BCc3,
	' SPARE=&D8C08BCc3,

' set address pointers to Current Detector Sensors

	CD_East_Pointer[8]=&TBS01BCa1,
	CD_West_Pointer[8]=&TBS02BCa1,
	CD_East_Pointer[5]=&TBS03BCa1,
	CD_West_Pointer[5]=&TBS04BCa1,
	CD_East_Pointer[1]=&TBS01BCa2,
	CD_West_Pointer[1]=&TBS02BCa2,
	CD_East_Pointer[9]=&TBS03BCa2,
	CD_West_Pointer[9]=&TBS04BCa2,

	CD_East_Pointer[7]=&TBS01BCb1,
	CD_West_Pointer[7]=&TBS02BCb1,
	CD_East_Pointer[11]=&TBS03BCb1,
	CD_West_Pointer[11]=&TBS04BCb1,
	CD_East_Pointer[4]=&TBS01BCb2,
	CD_West_Pointer[4]=&TBS02BCb2,
	' SPARE CD_East_Pointer[xx]=&TBS03BCb2,
	' SPARE CD_West_Pointer[xx]=&TBS04BCb2,

	CD_East_Pointer[2]=&TBS01BCc1,
	CD_West_Pointer[2]=&TBS02BCc1,
	CD_East_Pointer[6]=&TBS03BCc1,
	CD_West_Pointer[6]=&TBS04BCc1,
	CD_East_Pointer[10]=&TBS01BCc2,
	CD_West_Pointer[10]=&TBS02BCc2,
	CD_East_Pointer[3]=&TBS03BCc2,
	CD_West_Pointer[3]=&TBS04BCc2,

' set address pointers to Turnout_Button Controls

	'Tortoise_Pointer[1]=&YMC01TCa1,
	'Tortoise_Pointer[2]=&YMC02TCa1,
	'Tortoise_Pointer[3]=&YMC03TCa1,
	'Tortoise_Pointer[12]=&YMC04TCa1,
	'Tortoise_Pointer[13]=&YMC05TCa1,
	'Tortoise_Pointer[14]=&YMC06TCa1,
	'Tortoise_Pointer[15]=&YMC07TCa1,
	'Tortoise_Pointer[16]=&YMC08TCa1,
	' SPARES YMC09TCa1,YMC10TCa1,YMC11TCa1,YMC12TCa1,YMC13TCa1,YMC14TCa1,YMC15TCa1,YMC16TCa1

	'Tortoise_Pointer[4]=&YMC01TCb1,
	'Tortoise_Pointer[5]=&YMC02TCb1,
	'Tortoise_Pointer[6]=&YMC03TCb1,
	'Tortoise_Pointer[7]=&YMC04TCb1,
	'Tortoise_Pointer[8]=&YMC05TCb1,
	'Tortoise_Pointer[9]=&YMC06TCb1,
	'Tortoise_Pointer[10]=&YMC07TCb1,
	'Tortoise_Pointer[11]=&YMC08TCb1,
	'Tortoise_Pointer[17]=&YMC09TCb1,
	'Tortoise_Pointer[18]=&YMC10TCb1,
	' SPARES YMC11TCb1,YMC12TCb1,YMC13TCb1,YMC14TCb1,YMC15TCb1,YMC16TCb1

' set address pointers to Turnout Push Button Sensors

	'Turnout_Button_Pointer[1]=&SES01TCa2,
	'Turnout_Button_Pointer[2]=&SES02TCa2,
	'Turnout_Button_Pointer[3]=&SES03TCa2,
	'Turnout_Button_Pointer[12]=&SES04TCa2,
	'Turnout_Button_Pointer[13]=&SES05TCa2,
	'Turnout_Button_Pointer[14]=&SES06TCa2,
	'Turnout_Button_Pointer[15]=&SES07TCa2,
	'Turnout_Button_Pointer[16]=&SES08TCa2,
	' SPARES SES09TCa2,SES10TCa2,SES11TCa2,SES12TCa2,SES13TCa2,SES14TCa2,SES15TCa2,SES16TCa2

	'Turnout_Button_Pointer[4]=&SES01TCb2,
	'Turnout_Button_Pointer[5]=&SES02TCb2,
	'Turnout_Button_Pointer[6]=&SES03TCb2,
	'Turnout_Button_Pointer[7]=&SES04TCb2,
	'Turnout_Button_Pointer[8]=&SES05TCb2,
	'Turnout_Button_Pointer[9]=&SES06TCb2,
	'Turnout_Button_Pointer[10]=&SES07TCb2,
	'Turnout_Button_Pointer[11]=&SES08TCb2,
	'Turnout_Button_Pointer[17]=&SES09TCb2,
	'Turnout_Button_Pointer[18]=&SES10TCb2,
	' SPARES SES11TCb2,SES12TCb2,SES13TCb2,SES14TCb2,SES15TCb2,SES16TCb2

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
		Assign_Cab_To_Block(0,1,maxblocks)

	WHEN $leftmouse=cab1_All_Blocks_Grid DO
		Assign_Cab_To_Block(1,1,maxblocks)

	WHEN $leftmouse=cab2_All_Blocks_Grid DO
		Assign_Cab_To_Block(2,1,maxblocks)

	WHEN $leftmouse=cab3_All_Blocks_Grid DO 
		Assign_Cab_To_Block(3,1,maxblocks)

'*	Individual Block assignments

	WHEN $leftmouse=cab0_block_grid[BLOCKINDEX] DO
		Assign_Cab_To_Block(0,BlockIndex,BlockIndex)

	WHEN $leftmouse=cab1_block_grid[BLOCKINDEX] DO
		Assign_Cab_To_Block(1,BlockIndex,BlockIndex)

	WHEN $leftmouse=cab2_block_grid[BLOCKINDEX] DO
		Assign_Cab_To_Block(2,BlockIndex,BlockIndex)
	
	WHEN $leftmouse=cab3_block_grid[BLOCKINDEX] DO
		Assign_Cab_To_Block(3,BlockIndex,BlockIndex)

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

	ALWAYS DO
		IF SpeedIndex<11 then SpeedIndex=+ 
		ELSE SpeedIndex=0
		ENDIF

				
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
				
				
'*****************************************************************************			
'** Check all blocks for user change of cab assignments
'			
'	WHEN $Leftmouse=Block_Grid[CabAssignIndex] DO			
'		Mouse_Status=$LeftMouse	
'		Block_Cab[CabAssignIndex]=+,		
'		IF Block_Cab[CabAssignIndex]>3 then, 		
'			Block_Cab[CabAssignIndex]=0,	
'		ELSE blocktemp=Block_Cab[CabAssignIndex],		
'		ENDIF,		
'		blocktemp=Block_Cab[CabAssignIndex],		
'			block_color[CabAssignIndex]=Cab_Color[blocktemp],	
'			Configure_Cab_To_Block(CabAssignIndex,blocktemp),	
'			$Color Sprite(Block_Grid[CabAssignIndex])=block_color[CabAssignIndex]	
'		Wait until Mouse_Status<> $LeftMouse Then	'Wait until mouse is released	
'
'	
'	ALWAYS DO
'		IF CabAssignIndex<MaxBlocks then CabAssignIndex=+ 
'		ELSE CabAssignIndex=0
'		ENDIF			
		
				
'********************************************************************			
'**	Detect activation of turnouts on panel or Turnout Micro Switches		
'		Call subroutine	
'			Left click changes tortoise direction, indicating diverging route with red on panel, main route with green		
		
	WHEN $Leftmouse=Turnout_Grid[TurnoutIndex] DO  
	Mouse_Status=$LeftMouse	
		Throw_Tortoise(TurnoutIndex,Turnout_Grid[TurnoutIndex])
		Tortoise_Status[TurnoutIndex]=*Tortoise_Pointer[TurnoutIndex]
	Wait until Mouse_Status<> $LeftMouse Then	'Wait until mouse is released

 	ALWAYS DO
		IF TurnoutIndex<MaxTurnouts then TurnoutIndex=+ 
		ELSE TurnoutIndex=0
		ENDIF				


'********************************************************************
'**	LOOP through East and West current detectors to determine block occupancy

SUB Set_Block_Occupied_East(BlockIndex)
	block_occupancy_on (block_Grid[BlockIndex],
		Block_Color[BlockIndex],
		Train_E_Sprite[BlockIndex])
	Block_Sprite[BlockIndex]=Arrow_East,
	Assign_Cab_To_BLock(Block_Cab[BlockIndex],BlockIndex,BlockIndex),
ENDSUB
SUB Set_Block_Occupied_West(BlockIndex)
	block_occupancy_on (block_Grid[BlockIndex], 
			Block_Color[BlockIndex], 
			Train_W_Sprite[BlockIndex])
		Block_Sprite[BlockIndex]=Arrow_West
		Assign_Cab_To_Block(Block_Cab[BlockIndex],BlockIndex,BlockIndex)
ENDSUB
SUB Set_Block_Not_Occupied(BlockIndex)
	block_occupancy_off(block_Grid[BlockIndex],
		Block_Color[BlockIndex])
		Block_Sprite[BlockIndex]=Square
		Assign_Cab_To_Block(Block_Cab[BlockIndex],BlockIndex,BlockIndex)
ENDSUB

WHEN *CD_East_Pointer[1]=occupied DO Set_Block_Occupied_East(1)
WHEN *CD_West_Pointer[1]=occupied DO Set_Block_Occupied_West(1)
WHEN *CD_East_Pointer[1]=vacant,*CD_West_Pointer[1]=vacant DO Set_Block_Not_Occupied(1)


'	IF *CD_East_Pointer[OccupancyIndex]=occupied  THEN
'		block_occupancy_on (block_Grid[OccupancyIndex], 
'			Block_Color[OccupancyIndex], 
'			Train_E_Sprite[OccupancyIndex]),
'		Block_Sprite[OccupancyIndex]=Arrow_East,
'		Assign_Cab_To_Block(Block_Cab[OccupancyIndex],OccupancyIndex,OccupancyIndex),
'	ELSEIF *CD_West_Pointer[OccupancyIndex]=occupied THEN
'		block_occupancy_on (block_Grid[OccupancyIndex], 
'			Block_Color[OccupancyIndex], 
'			Train_W_Sprite[OccupancyIndex]),
'		Block_Sprite[OccupancyIndex]=Arrow_West,
'		Assign_Cab_To_Block(Block_Cab[OccupancyIndex],OccupancyIndex,OccupancyIndex),
'	ELSE  block_occupancy_off(block_Grid[OccupancyIndex],
'		Block_Color[OccupancyIndex]),
'		Block_Sprite[OccupancyIndex]=Square
'		Assign_Cab_To_Block(Block_Cab[OccupancyIndex],OccupancyIndex,OccupancyIndex),
'	ENDIF


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
'	ALWAYS DO
'		IF OccupancyIndex<MaxBlocks then OccupancyIndex=+ 
'		ELSE OccupancyIndex=0
'		ENDIF


'********************************************************************
'	LOOP through EOT InfraRed detectors to determine block occupancy

'	WHEN IR_EOT_Detector[0]=occupied DO
'		$Draw Sprite(IR_EOT_Detector_Grid[0])= IR_EOT_Detector_Shape[0] in red
'	WHEN IR_EOT_Detector[0]=VACANT DO
'		$Erase Sprite(IR_EOT_Detector_Grid[0])




