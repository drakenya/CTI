

CONSTANTS:
    {--
     -  Turnouts
     -}
    NUM_TURNOUTS = 4

    TURNOUT_DIRECTION_PRIMARY = OFF 'green on panel
    TURNOUT_DIRECTION_SECONDARY = ON 'red on panel

    TURNOUT_TORTOISE = 1
    TURNOUT_ATLAS = 2

SMARTCABS:
    SmartCab1
    SmartCab2
    SmartCab3

{--
 -  Tortoise, Board 1
 -
 -  YardMaster 1 (16 control)
 -  Sentry 1 (16 sensor)
 -}
CONTROLS:
    Turnout_05_Control 'YardMaster 1, Port 01
    Turnout_08_Control 'YardMaster 1, Port 02
    Turnout_14_Control 'YardMaster 1, Port 03
    Turnout_A1_Control 'YardMaster 1, Port 04
    Turnout_12_Control 'YardMaster 1, Port 05
    Turnout_19_Control 'YardMaster 1, Port 06
    Turnout_20_Control 'YardMaster 1, Port 07
    Turnout_06_Control 'YardMaster 1, Port 08
    Turnout_07_Control 'YardMaster 1, Port 09
    Turnout_A2_Control 'YardMaster 1, Port 10
    Turnout_A3_Control 'YardMaster 1, Port 11
    Turnout_A4_Control 'YardMaster 1, Port 12
    Turnout_A5_Control 'YardMaster 1, Port 13
    Turnout_A6_Control 'YardMaster 1, Port 14
    Turnout_A7_Control 'YardMaster 1, Port 15
    Turnout_A8_Control 'YardMaster 1, Port 16
SENSORS:
    Turnout_05_Sensor 'Sentry 1, Port 01
    Turnout_08_Sensor 'Sentry 1, Port 02
    Turnout_14_Sensor 'Sentry 1, Port 03
    Turnout_A1_Sensor 'Sentry 1, Port 04
    Turnout_12_Sensor 'Sentry 1, Port 05
    Turnout_19_Sensor 'Sentry 1, Port 06
    Turnout_20_Sensor 'Sentry 1, Port 07
    Turnout_06_Sensor 'Sentry 1, Port 08
    Turnout_07_Sensor 'Sentry 1, Port 09
    Turnout_A2_Sensor 'Sentry 1, Port 10
    Turnout_A3_Sensor 'Sentry 1, Port 11
    Turnout_A4_Sensor 'Sentry 1, Port 12
    Turnout_A5_Sensor 'Sentry 1, Port 13
    Turnout_A6_Sensor 'Sentry 1, Port 14
    Turnout_A7_Sensor 'Sentry 1, Port 15
    Turnout_A8_Sensor 'Sentry 1, Port 16

{--
 -  Block Control, Board 1

 -  TrainBrain 1 (4 control, 4 sensor)
 -  TrainBrain 2 (4 control, 4 sensor)
 -  Dash-8 1 (8 control)
 -}
CONTROLS:
    Block_08_Control_1 'TrainBrain 1, Port 1
    Block_01_Control_1 'TrainBrain 1, Port 2
    Block_05_Control_1 'TrainBrain 1, Port 3
    Block_09_Control_1 'TrainBrain 1, Port 4
SENSORS:
    Block_08_East_Sensor 'TrainBrain 1, Port 1
    Block_08_West_Sensor 'TrainBrain 1, Port 2
    Block_01_East_Sensor 'TrainBrain 1, Port 3
    Block_01_West_Sensor 'TrainBrain 1, Port 4
CONTROLS:
    Block_08_Control_2 'TrainBrain 2, Port 1
    Block_01_Control_2 'TrainBrain 2, Port 2
    Block_05_Control_2 'TrainBrain 2, Port 3
    Block_09_Control_2 'TrainBrain 2, Port 4
SENSORS:
    Block_05_East_Sensor 'TrainBrain 2, Port 1
    Block_05_West_Sensor 'TrainBrain 2, Port 2
    Block_09_East_Sensor 'TrainBrain 2, Port 3
    Block_09_West_Sensor 'TrainBrain 2, Port 4
CONTROLS:
    Block_08_Control_3 'Dash-8 1, port 1
    Block_01_Control_3 'Dash-8 1, port 2
    Block_05_Control_3 'Dash-8 1, port 3
    Block_09_Control_3 'Dash-8 1, port 4
    Block_B1_Control_3 'Dash-8 1, port 5
    Block_B2_Control_3 'Dash-8 1, port 6
    Block_B3_Control_3 'Dash-8 1, port 7
    Block_B4_Control_3 'Dash-8 1, port 8

{--
 -  Atlas Control, Board 1

 -  Switchman 1 (16 control)
 -}
CONTROLS:
    Turnout_19_Primary_Control 'Switchman 1, port 1
    Turnout_18_Secondary_Control 'Switchman 1, port 2
    Turnout_20_Primary_Control 'Switchman 1, port 3
    Turnout_20_Secondary_Control 'Switchman 1, port 4
    Turnout_C1_Control 'Switchman 1, port 5
    Turnout_C2_Control 'Switchman 1, port 6
    Turnout_C3_Control 'Switchman 1, port 7
    Turnout_C4_Control 'Switchman 1, port 8
    Turnout_C5_Control 'Switchman 1, port 9
    Turnout_C6_Control 'Switchman 1, port 10
    Turnout_C7_Control 'Switchman 1, port 11
    Turnout_C8_Control 'Switchman 1, port 12
    Turnout_C9_Control 'Switchman 1, port 13
    Turnout_CA_Control 'Switchman 1, port 14
    Turnout_CB_Control 'Switchman 1, port 15
    Turnout_CC_Control 'Switchman 1, port 16

{--
 -  Block Control, Board 2

 -  TrainBrain 1 (4 control, 4 sensor)
 -  TrainBrain 2 (4 control, 4 sensor)
 -  Dash-8 1 (8 control)
 -}
CONTROLS:
    Block_07_Control_1 'TrainBrain 1, Port 1
    Block_11_Control_1 'TrainBrain 1, Port 2
    Block_04_Control_1 'TrainBrain 1, Port 3
    Block_12_Control_1 'TrainBrain 1, Port 4
SENSORS:
    Block_07_East_Sensor 'TrainBrain 1, Port 1
    Block_07_West_Sensor 'TrainBrain 1, Port 2
    Block_11_East_Sensor 'TrainBrain 1, Port 3
    Block_11_West_Sensor 'TrainBrain 1, Port 4
CONTROLS:
    Block_07_Control_2 'TrainBrain 2, Port 1
    Block_11_Control_2 'TrainBrain 2, Port 2
    Block_04_Control_2 'TrainBrain 2, Port 3
    Block_12_Control_2 'TrainBrain 2, Port 4
SENSORS:
    Block_04_East_Sensor 'TrainBrain 2, Port 1
    Block_04_West_Sensor 'TrainBrain 2, Port 2
    Block_12_East_Sensor 'TrainBrain 2, Port 3
    Block_12_West_Sensor 'TrainBrain 2, Port 4
CONTROLS:
    Block_07_Control_3 'Dash-8 1, port 1
    Block_11_Control_3 'Dash-8 1, port 2
    Block_04_Control_3 'Dash-8 1, port 3
    Block_12_Control_3 'Dash-8 1, port 4
    Block_D1_Control_3 'Dash-8 1, port 5
    Block_D2_Control_3 'Dash-8 1, port 6
    Block_D3_Control_3 'Dash-8 1, port 7
    Block_D4_Control_3 'Dash-8 1, port 8

{--
 -  Atlas Control, Board 2

 -  Switchman 1 (16 control)
 -}
CONTROLS:
    Turnout_E1_Control 'Switchman 1, port 1
    Turnout_E2_Control 'Switchman 1, port 2
    Turnout_E3_Control 'Switchman 1, port 3
    Turnout_E4_Control 'Switchman 1, port 4
    Turnout_E5_Control 'Switchman 1, port 5
    Turnout_E6_Control 'Switchman 1, port 6
    Turnout_E7_Control 'Switchman 1, port 7
    Turnout_E8_Control 'Switchman 1, port 8
    Turnout_E9_Control 'Switchman 1, port 9
    Turnout_EA_Control 'Switchman 1, port 10
    Turnout_EB_Control 'Switchman 1, port 11
    Turnout_EC_Control 'Switchman 1, port 12
    Turnout_ED_Control 'Switchman 1, port 13
    Turnout_EE_Control 'Switchman 1, port 14
    Turnout_EF_Control 'Switchman 1, port 15
    Turnout_EG_Control 'Switchman 1, port 16

{--
 -  Tortoise, Board 2

 -  YardMaster 1 (16 control)
 -  Sentry 1 (16 sensor)
 -}
CONTROLS:
    Turnout_FX_Control 'YardMaster 1, Port 01
    Turnout_02_Control 'YardMaster 1, Port 02
    Turnout_01_Control 'YardMaster 1, Port 03
    Turnout_04_Control 'YardMaster 1, Port 04
    Turnout_09_Control 'YardMaster 1, Port 05
    Turnout_10_Control 'YardMaster 1, Port 06
    Turnout_17_Control 'YardMaster 1, Port 07
    Turnout_16_Control 'YardMaster 1, Port 08
    Turnout_03_Control 'YardMaster 1, Port 09
    Turnout_18_Control 'YardMaster 1, Port 10
    Turnout_15_Control 'YardMaster 1, Port 11
    Turnout_F0_Control 'YardMaster 1, Port 12
    Turnout_F1_Control 'YardMaster 1, Port 13
    Turnout_F2_Control 'YardMaster 1, Port 14
    Turnout_F3_Control 'YardMaster 1, Port 15
    Turnout_F4_Control 'YardMaster 1, Port 16
SENSORS:
    Turnout_FX_Sensor 'Sentry 1, Port 01
    Turnout_02_Button_Sensor 'Sentry 1, Port 02
    Turnout_01_Button_Sensor 'Sentry 1, Port 03
    Turnout_04_Button_Sensor 'Sentry 1, Port 04
    Turnout_09_Sensor 'Sentry 1, Port 05
    Turnout_10_Sensor 'Sentry 1, Port 06
    Turnout_17_Sensor 'Sentry 1, Port 07
    Turnout_16_Sensor 'Sentry 1, Port 08
    Turnout_03_Button_Sensor 'Sentry 1, Port 09
    Turnout_18_Sensor 'Sentry 1, Port 10
    Turnout_15_Sensor 'Sentry 1, Port 11
    Turnout_F0_Sensor 'Sentry 1, Port 12
    Turnout_F1_Sensor 'Sentry 1, Port 13
    Turnout_F2_Sensor 'Sentry 1, Port 14
    Turnout_F3_Sensor 'Sentry 1, Port 15
    Turnout_F4_Sensor 'Sentry 1, Port 16

{--
 -  Block Control, Board 3

 -  TrainBrain 1 (4 control, 4 sensor)
 -  TrainBrain 2 (4 control, 4 sensor)
 -  Dash-8 1 (8 control)
 -}
CONTROLS:
    Block_02_Control_1 'TrainBrain 1, Port 1
    Block_06_Control_1 'TrainBrain 1, Port 2
    Block_10_Control_1 'TrainBrain 1, Port 3
    Block_03_Control_1 'TrainBrain 1, Port 4
SENSORS:
    Block_02_East_Sensor 'TrainBrain 1, Port 1
    Block_02_West_Sensor 'TrainBrain 1, Port 2
    Block_06_East_Sensor 'TrainBrain 1, Port 3
    Block_06_West_Sensor 'TrainBrain 1, Port 4
CONTROLS:
    Block_02_Control_2 'TrainBrain 2, Port 1
    Block_06_Control_2 'TrainBrain 2, Port 2
    Block_10_Control_2 'TrainBrain 2, Port 3
    Block_03_Control_2 'TrainBrain 2, Port 4
SENSORS:
    Block_10_East_Sensor 'TrainBrain 2, Port 1
    Block_10_West_Sensor 'TrainBrain 2, Port 2
    Block_03_East_Sensor 'TrainBrain 2, Port 3
    Block_03_West_Sensor 'TrainBrain 2, Port 4
CONTROLS:
    Block_02_Control_3 'Dash-8 1, port 1
    Block_06_Control_3 'Dash-8 1, port 2
    Block_10_Control_3 'Dash-8 1, port 3
    Block_03_Control_3 'Dash-8 1, port 4
    Block_G1_Control_3 'Dash-8 1, port 5
    Block_G2_Control_3 'Dash-8 1, port 6
    Block_G3_Control_3 'Dash-8 1, port 7
    Block_G4_Control_3 'Dash-8 1, port 8

VARIABLES:
    PANEL_1_TURNOUTS[NUM_TURNOUTS]
    TURNOUT_STATUSES[NUM_TURNOUTS]
    {

    ' Holds address for Turnout Machine controls
	Turnout_Pointer[NUM_TURNOUTS]

    ' Holds address of Sensors for Manual turnout buttons
	Turnout_Button_Pointer[NUM_TURNOUTS]

    ' Holds address of Controls for Atlas turnouts
	Atlas_Turnout_Pointer_Primary[NUM_TURNOUTS]
	Atlas_Turnout_Pointer_Secondary[NUM_TURNOUTS]
	Atlas_Turnout_LED_Pointer_Primary[NUM_TURNOUTS]
	Atlas_Turnout_LED_Pointer_Secondary[NUM_TURNOUTS]	
    }

ACTIONS:

SUB Redraw_Turnout(TurnoutIndex)
    $SWITCH(PANEL_1_TURNOUTS[TurnoutIndex]) = $SWITCH(PANEL_1_TURNOUTS[TurnoutIndex]) ~
ENDSUB

SUB ResetInit_Set_Turnouts_On_Panels()
    PANEL_1_TURNOUTS[0] = (27,29,1)
    PANEL_1_TURNOUTS[1] = (30,30,1)
    PANEL_1_TURNOUTS[2] = (43,33,1)
    PANEL_1_TURNOUTS[3] = (36,29,1)
ENDSUB

SUB ResetInit_Set_Turnouts_To_Primary({local} TurnoutIndex)
    TurnoutIndex = 0
    UNTIL TurnoutIndex > NUM_TURNOUTS QUICKLOOP
        TURNOUT_STATUSES[TurnoutIndex] = TURNOUT_DIRECTION_PRIMARY
        Redraw_Turnout(TurnoutIndex)

        TurnoutIndex = 1 +
    ENDLOOP
ENDSUB

SUB Throw_Turnout(TurnoutIndex)
    ' Invert status of turnout, from thrown to straight or vice versa
    TURNOUT_STATUSES[TurnoutIndex] = TURNOUT_STATUSES[TurnoutIndex] ~

    ' Redraw turnout on panel
    Redraw_Turnout(TurnoutIndex)
ENDSUB

WHEN $RESET = TRUE DO
    ResetInit_Set_Turnouts_On_Panels()
    ResetInit_Set_Turnouts_To_Primary()

WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[0] OR Turnout_01_Button_Sensor = ON DO Throw_Turnout(0)
WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[1] OR Turnout_02_Button_Sensor = ON DO Throw_Turnout(1)
WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[2] OR Turnout_03_Button_Sensor = ON DO Throw_Turnout(2)
WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[3] OR Turnout_04_Button_Sensor = ON DO Throw_Turnout(3)

{
SUB Throw_Turnout(TIndex,ctc_Grid)
	$Switch(ctc_Grid)=$Switch(ctc_Grid)~	'Throw turnout on panel display
	*Turnout_Pointer[TIndex]=*Turnout_Pointer[TIndex]~, 'Reverse power to Tortoise & LED or to Atlas LED only
	Turnout_Status[TIndex]=Turnout_Status[TIndex]~,	'Change direction status of turnout
	IF Turnout_Type[TIndex]=ATLAS THEN
		IF Turnout_Status[TIndex]=TURNOUT_DIRECTION_PRIMARY THEN	'Determine new status of Atlas turnout
			*Atlas_Turnout_Pointer_Secondary[TIndex]=PULSE 0.25,	' Pulse power to proper Atlas leg
			*Atlas_Turnout_LED_Pointer_Secondary[TIndex]=TURNOUT_DIRECTION_SECONDARY	'NOT USED?
		ELSE 	*Atlas_Turnout_Pointer_Primary[TIndex]=PULSE 0.25,
		 	*Atlas_Turnout_led_Pointer_Primary[TIndex]=TURNOUT_DIRECTION_PRIMARY,	'NOT USED?
		ENDIF		
	ENDIF
ENDSUB

SUB Initialize_Set_All_Turnouts_To_Primary_Direction(Local TIndex)
	TIndex = INITIAL_TURNOUT_INDEX
	UNTIL TIndex >= MAX_TURNOUT_INDEX LOOP
		$Switch(TurnOut_Grid[TIndex])=TURNOUT_DIRECTION_PRIMARY	'Throw Panel Display
		*Turnout_Pointer[TIndex]=TURNOUT_DIRECTION_PRIMARY	' Throw power to Tortoise/LED or Atlas LED only
		IF Turnout_Type[TIndex]=ATLAS THEN
			*Atlas_Turnout_Pointer_Primary[TIndex]=PULSE 0.25	'throw power to Atlas Turnout
		ENDIF
		Turnout_Status[TIndex]=TURNOUT_DIRECTION_PRIMARY

		TIndex = 1+
	ENDLOOP
ENDSUB

' set address pointers to Turnout_Controls

	Turnout_Pointer[5]=&TurnoutBd1_1YardMstr01_t05,
       Turnout_Pointer[8]=&TurnoutBd1_1YardMstr02_t08,
	'Turnout_Pointer[14]=&TurnoutBd1_1YardMstr03_t14,
	'TBD Turnout_Pointer[atlas_TBD]=&TurnoutBd1_1YardMstr04_TBD,
	Turnout_Pointer[12]=&TurnoutBd1_1YardMstr05_t12,
	Turnout_Pointer[19]=&TurnoutBd1_1YardMstr06_t19,
	Turnout_Pointer[20]=&TurnoutBd1_1YardMstr07_t20,
	Turnout_Pointer[6]=&TurnoutBd1_1YardMstr08_t06,
	'Turnout_Pointer[7]=&TurnoutBd1_1YardMstr09_t07,
	'TBD Turnout_Pointer[atlas_TBD]=&TurnoutBd1_1YardMstr10_TBD,
	'TBD Turnout_Pointer[atlas_TBD]=&TurnoutBd1_1YardMstr11_TBD,
	'SPARE Turnout_Pointer[Spare]=&TurnoutBd1_1YardMstr12_spare,
	'Turnout_Pointer[13]=&TurnoutBd1_1YardMstr13_t13,
	'TBD Turnout_Pointer[atlas TBD]=&TurnoutBd1_1YardMstr14_TBD,
	'TBD Turnout_Pointer[atlas TBD]=&TurnoutBd1_1YardMstr15_TBD,
	'SPARE Turnout_Pointer[Spare]=&TurnoutBd1_1YardMstr16_spare,

	'DEFECTIVE? Turnout_Pointer[X]=&TurnoutBd2_1YardMstr01_x,
	Turnout_Pointer[2]=&TurnoutBd2_1YardMstr02_t02,
	Turnout_Pointer[1]=&TurnoutBd2_1YardMstr03_t01,
	Turnout_Pointer[4]=&TurnoutBd2_1YardMstr04_t04,
	Turnout_Pointer[9]=&TurnoutBd2_1YardMstr05_t09,
	Turnout_Pointer[10]=&TurnoutBd2_1YardMstr06_t10,
	Turnout_Pointer[17]=&TurnoutBd2_1YardMstr07_t17,
	Turnout_Pointer[16]=&TurnoutBd2_1YardMstr08_t16,
	Turnout_Pointer[3]=&TurnoutBd2_1YardMstr09_t03,
	Turnout_Pointer[18]=&TurnoutBd2_1YardMstr10_t18,
	'NIS Turnout_Pointer[15]=&TurnoutBd2_1YardMstr11_T15,
       'TBD Turnout_Pointer[atlas TBD]=&TurnoutBd2_1YardMstr12_TBD
       'NIS Turnout_Pointer[11]=&TurnoutBd2_1YardMstr13_t11
       'TBD Turnout_Pointer[atlas TBD]=&TurnoutBd2_1YardMstr14_TBD
       'TBD Turnout_Pointer[atlas TBD]=&TurnoutBd2_1YardMstr15_TBD
       'SPARE TurnoutBd2_1YardMstr16,

' set address pointers to Turnout Push Button Sensors

	Turnout_Button_Pointer[5]=&TurnoutBd1_2Sentry01_t05,
	Turnout_Button_Pointer[8]=&TurnoutBd1_2Sentry02_t08,
	'Turnout_Button_Pointer[14]=&TurnoutBd1_2Sentry03_t14,
	'TBD Turnout_Button_Pointer[atlas_TBD]=&TurnoutBd1_2Sentry04_TBD,
	Turnout_Button_Pointer[12]=&TurnoutBd1_2Sentry05_t12,
	Turnout_Button_Pointer[19]=&TurnoutBd1_2Sentry06_t19,
	Turnout_Button_Pointer[20]=&TurnoutBd1_2Sentry07_t20,
	Turnout_Button_Pointer[6]=&TurnoutBd1_2Sentry08_t06,
	'Turnout_Button_Pointer[7]=&TurnoutBd1_2Sentry09_t07,
	'TBD Turnout_Button_Pointer[atlas_TBD]=&TurnoutBd1_2Sentry10_TBD,
	'TBD Turnout_Button_Pointer[atlas_TBD]=&TurnoutBd1_2Sentry11_TBD,
	'SPARE Turnout_Button_Pointer[Spare]=&TurnoutBd1_2Sentry12_spare,
	'Turnout_Button_Pointer[13]=&TurnoutBd1_2Sentry13_t13,
	'TBD Turnout_Button_Pointer[atlas_TBD]=&TurnoutBd1_2Sentry14_TBD,
	'TBD Turnout_Button_Pointer[atlas_TBD]=&TurnoutBd1_2Sentry15_TBD,
	' SPARE Turnout_Button_Pointer[spare]=&TurnoutBd1_2Sentry16_Spare,

	'DEFECTIVE? Turnout_Button_Pointer[X]=&TurnoutBd2_2Sentry01_x,
	Turnout_Button_Pointer[2]=&TurnoutBd2_2Sentry02_t02,
	Turnout_Button_Pointer[1]=&TurnoutBd2_2Sentry03_t01,
	Turnout_Button_Pointer[4]=&TurnoutBd2_2Sentry04_t04,
	Turnout_Button_Pointer[9]=&TurnoutBd2_2Sentry05_t09,
	Turnout_Button_Pointer[10]=&TurnoutBd2_2Sentry06_t10,
	Turnout_Button_Pointer[17]=&TurnoutBd2_2Sentry07_t17,
	Turnout_Button_Pointer[16]=&TurnoutBd2_2Sentry08_t16,
	Turnout_Button_Pointer[3]=&TurnoutBd2_2Sentry09_t03,
	Turnout_Button_Pointer[18]=&TurnoutBd2_2Sentry10_t18,
	' NIS Turnout_Button_Pointer[15]=&TurnoutBd2_2Sentry11_t15,
	'TBD Turnout_Button_Pointer[Atlas TBD]=&TurnoutBd2_2Sentry12_TBD,
	'NIS Turnout_Button_Pointer[11]=&TurnoutBd2_2Sentry13_t11,
       'TBD Turnout_Button_Pointer[Atlas TBD]=&TurnoutBd2_2Sentry14_TBD,
       'TBD Turnout_Button_Pointer[Atlas TBD]=&TurnoutBd2_2Sentry15_TBD,
       'SPARE Turnout_Button_Pointer[Spare]=&TurnoutBd2_2Sentry16_Spare,
       
       
Atlas_Turnout_Pointer_Primary[19]=&Atlas1_Switchman01_t19Prim,
Atlas_Turnout_Pointer_Secondary[19]=&Atlas1_Switchman02_t19Sec, 
Atlas_Turnout_Pointer_Primary[20]=&Atlas1_Switchman03_t20Prim, 
Atlas_Turnout_Pointer_Secondary[20]=&Atlas1_Switchman04_t20Sec,
       'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman05_TBDPrim, 
       'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman06_TBDSec, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman07_TBDPrim, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman08_TBDSec, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman09_TBDPrim, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman10_TBDSec, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman11_TBDPrim, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman12_TBDSec,
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman13_TBDPrim, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas1_Switchman14_TBDSec, 
'SPARES Atlas1_Switchman15_Spare, Atlas1_Switchman16_Spare
       
       'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas2_Switchman01_TBDPrim, 
       'TBD Atlas_Turnout_Pointer_Secondary[TBD]=&Atlas2_Switchman02_TBDSec, 
       'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas_Turnout_Pointer_Primary[TBD]=&Atlas2_Switchman03_TBDPrim,
'TBD Atlas_Turnout_Pointer_Secondary[TBD]=&Atlas_Turnout_Pointer_Secondary[TBD]=&Atlas2_Switchman04_TBDSec, 
'TBD Atlas_Turnout_Pointer_Primary[TBD]=&Atlas_Turnout_Pointer_Primary[TBD]=&Atlas2_Switchman05_TBDPrim, 
'TBD Atlas_Turnout_Pointer_Secondary[TBD]=&Atlas_Turnout_Pointer_Primary[TBD]=&Atlas2_Switchman06_TBDSec,
'SPARES Atlas2_Switchman07_Spare, Atlas2_Switchman08_Spare, 
'SPARES Atlas2_Switchman09_Spare, Atlas2_Switchman10_Spare, 
'SPARES Atlas2_Switchman11_Spare, Atlas2_Switchman12_Spare,
'SPARES Atlas2_Switchman13_Spare, Atlas2_Switchman14_Spare, 
'SPARES Atlas2_Switchman15_Spare, Atlas2_Switchman16_Spare

	PANEL_1_TURNOUTS[1]=(4,20,4), PANEL_1_TURNOUTS[2]=(9,14,4), PANEL_1_TURNOUTS[3]=(34,8,4), Turnout_PANEL_1_TURNOUTSGrid[4]=(35,8,4),
	Turnout_Grid[5]=(46,13,4), Turnout_Grid[6]=(46,18,4), Turnout_Grid[7]=(45,22,4), Turnout_Grid[8]=(34,28,4),
	Turnout_Grid[9]=(7,21,4),Turnout_Grid[10]=(20,4,4), Turnout_Grid[11]=(23,4,4), Turnout_Grid[12]=(50,18,4),
	Turnout_Grid[13]=(50,22,4), Turnout_Grid[14]=(35,27,4), Turnout_Grid[15]=(7,18,4), Turnout_Grid[16]=(8,17,4),
	Turnout_Grid[17]=(4,25,4),Turnout_Grid[18]=(31,6,4),Turnout_Grid[19]=(51,17,4),Turnout_Grid[20]=(52,16,4),
	
	Turnout_Grid[25]=(16,17,4),Turnout_Grid[26]=(17,18,4),

    	Turnout_Type[1]=TORTOISE, Turnout_Type[2]=TORTOISE, Turnout_Type[3]=TORTOISE, Turnout_Type[4]=TORTOISE,
	Turnout_Type[5]=TORTOISE, Turnout_Type[6]=TORTOISE, Turnout_Type[7]=TORTOISE, Turnout_Type[8]=TORTOISE,
	Turnout_Type[9]=TORTOISE, Turnout_Type[10]=TORTOISE, Turnout_Type[11]=TORTOISE, Turnout_Type[12]=TORTOISE,
	Turnout_Type[13]=TORTOISE, Turnout_Type[14]=TORTOISE, Turnout_Type[15]=TORTOISE, Turnout_Type[16]=TORTOISE,
	Turnout_Type[17]=TORTOISE, Turnout_Type[18]=TORTOISE,Turnout_Type[19]=ATLAS, Turnout_Type[20]=ATLAS,
	Turnout_Type[21]=ATLAS, Turnout_Type[22]=ATLAS,Turnout_Type[23]=ATLAS, Turnout_Type[24]=ATLAS,
	Turnout_Type[25]=TORTOISE, Turnout_Type[26]=TORTOISE, Turnout_Type[27]=TORTOISE, Turnout_Type[28]=TORTOISE, 
	Turnout_Type[29]=TORTOISE, Turnout_Type[30]=TORTOISE, Turnout_Type[31]=ATLAS, Turnout_Type[32]=ATLAS,

    WHEN $Leftmouse=Turnout_Grid[1] or *Turnout_Button_Pointer[1]=on DO Throw_Turnout(1,Turnout_Grid[1])
WHEN $Leftmouse=Turnout_Grid[2] or *Turnout_Button_Pointer[2]=on DO Throw_Turnout(2,Turnout_Grid[2])
WHEN $Leftmouse=Turnout_Grid[3] or *Turnout_Button_Pointer[3]=on DO Throw_Turnout(3,Turnout_Grid[3]), Redraw_Extra_Blocks_On_Grid()
WHEN $Leftmouse=Turnout_Grid[4] or *Turnout_Button_Pointer[4]=on DO Throw_Turnout(4,Turnout_Grid[4])
WHEN $Leftmouse=Turnout_Grid[5] or *Turnout_Button_Pointer[5]=on DO Throw_Turnout(5,Turnout_Grid[5])
WHEN $Leftmouse=Turnout_Grid[6] or *Turnout_Button_Pointer[6]=on DO Throw_Turnout(6,Turnout_Grid[6])
WHEN $Leftmouse=Turnout_Grid[7] or *Turnout_Button_Pointer[7]=on DO Throw_Turnout(7,Turnout_Grid[7])
WHEN $Leftmouse=Turnout_Grid[8] or *Turnout_Button_Pointer[8]=on DO Throw_Turnout(8,Turnout_Grid[8])
WHEN $Leftmouse=Turnout_Grid[9] or *Turnout_Button_Pointer[9]=on DO Throw_Turnout(9,Turnout_Grid[9])
WHEN $Leftmouse=Turnout_Grid[10] or *Turnout_Button_Pointer[10]=on DO Throw_Turnout(10,Turnout_Grid[10])
WHEN $Leftmouse=Turnout_Grid[11] or *Turnout_Button_Pointer[11]=on DO Throw_Turnout(11,Turnout_Grid[11])
WHEN $Leftmouse=Turnout_Grid[12] or *Turnout_Button_Pointer[12]=on DO Throw_Turnout(12,Turnout_Grid[12]), Redraw_Extra_Blocks_On_Grid()
WHEN $Leftmouse=Turnout_Grid[13] or *Turnout_Button_Pointer[13]=on DO Throw_Turnout(13,Turnout_Grid[13])
WHEN $Leftmouse=Turnout_Grid[14] or *Turnout_Button_Pointer[14]=on DO Throw_Turnout(14,Turnout_Grid[14])
WHEN $Leftmouse=Turnout_Grid[15] or *Turnout_Button_Pointer[15]=on DO Throw_Turnout(15,Turnout_Grid[15])
WHEN $Leftmouse=Turnout_Grid[16] or *Turnout_Button_Pointer[16]=on DO Throw_Turnout(16,Turnout_Grid[16])
WHEN $Leftmouse=Turnout_Grid[17] or *Turnout_Button_Pointer[17]=on DO Throw_Turnout(17,Turnout_Grid[17])
WHEN $Leftmouse=Turnout_Grid[18] or *Turnout_Button_Pointer[18]=on DO Throw_Turnout(18,Turnout_Grid[18]), Redraw_Extra_Blocks_On_Grid()
WHEN $Leftmouse=Turnout_Grid[19] or *Turnout_Button_Pointer[19]=on DO Throw_Turnout(19,Turnout_Grid[19])
WHEN $Leftmouse=Turnout_Grid[20] or *Turnout_Button_Pointer[20]=on DO Throw_Turnout(20,Turnout_Grid[20])

WHEN $Leftmouse=Turnout_Grid[25] or *Turnout_Button_Pointer[19]=on DO Throw_Turnout(25,Turnout_Grid[25])
WHEN $Leftmouse=Turnout_Grid[26] or *Turnout_Button_Pointer[20]=on DO Throw_Turnout(26,Turnout_Grid[26])
}

