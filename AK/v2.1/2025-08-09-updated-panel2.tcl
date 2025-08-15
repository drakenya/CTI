

CONSTANTS:
    {--
     -  Turnouts
     -}
    NUM_TURNOUTS = 30

    TURNOUT_DIRECTION_PRIMARY = OFF
    TURNOUT_DIRECTION_SECONDARY = ON

    TURNOUT_TYPE_TORTOISE = 1
    TURNOUT_TYPE_ATLAS = 2

    TURNOUT_01 = 0
    TURNOUT_02 = 1
    TURNOUT_03 = 2
    TURNOUT_04 = 3
    TURNOUT_05 = 4
    TURNOUT_06 = 5
    TURNOUT_07 = 6
    TURNOUT_08 = 7
    TURNOUT_09 = 8
    TURNOUT_10 = 9
    TURNOUT_11 = 10
    TURNOUT_12 = 11
    TURNOUT_13 = 12
    TURNOUT_14 = 13
    TURNOUT_15 = 14
    TURNOUT_16 = 15
    TURNOUT_17 = 16
    TURNOUT_18 = 17
    TURNOUT_19 = 18
    TURNOUT_20 = 19
    TURNOUT_21 = 20
    TURNOUT_22 = 21
    TURNOUT_23 = 22
    TURNOUT_24 = 23
    TURNOUT_25 = 24
    TURNOUT_26 = 25
    TURNOUT_27 = 26
    TURNOUT_28 = 27
    TURNOUT_29 = 28
    TURNOUT_30 = 29
    TURNOUT_31 = 30
    TURNOUT_32 = 31
    TURNOUT_33 = 32
    TURNOUT_34 = 33

    {--
     - Blocks
     -}
    NUM_BLOCKS = 14
    NUM_MAINLINE_BLOCKS = 8

    POWER_OPTION_FIRST_CHOICE = OFF
    POWER_OPTION_SECOND_CHOICE = ON

    BLOCK_DETECTOR_ACTIVITY_DETECTED = ON
    BLOCK_DETECTOR_NO_ACTIVITY = OFF

    BLOCK_UNOCCUPIED = 0
    BLOCK_OCCUPIED = 1
    BLOCK_OCCUPIED_EAST = 2
    BLOCK_OCCUPIED_WEST = 4
    BLOCK_UNDER_MANUAL_HOLD = 8
    BLOCK_UNDER_SYSTEM_HOLD = 16
    BLOCK_UNDER_MAINLINE_HOLD = 32

    BLOCK_01 = 0
    BLOCK_02 = 1
    BLOCK_03 = 2
    BLOCK_04 = 3
    BLOCK_05 = 4
    BLOCK_06 = 5
    BLOCK_07 = 6
    BLOCK_08 = 7
    BLOCK_09 = 8
    BLOCK_10 = 9
    BLOCK_11 = 10
    BLOCK_12 = 11
    BLOCK_13 = 12
    BLOCK_14 = 13
    BLOCK_15 = 14
    BLOCK_16 = 15

    {--
     - Cabs
     -}
    NUM_CABS = 4

    CAB_UNASSIGNED = -1
    CAB_MANUAL = 0
    CAB_ORANGE = 1
    CAB_GREEN = 2
    CAB_BROWN = 3

    {--
     - Mainline Automation
     -}
    

SMARTCABS:
    ORANGE_CAB
    GREEN_CAB
    BROWN_CAB

{--
 -  Tortoise, Board 1
 -
 -  YardMaster 1 (16 control)
 -  Sentry 1 (16 sensor)
 -}
CONTROLS:
    Turnout_05_Control 'YardMaster 1, Port 01
    Turnout_08_Control 'YardMaster 1, Port 02
    Turnout_13_Control 'YardMaster 1, Port 03
    Turnout_21_Control 'YardMaster 1, Port 04
    Turnout_12_Control 'YardMaster 1, Port 05
    Turnout_19_Control 'YardMaster 1, Port 06
    Turnout_20_Control 'YardMaster 1, Port 07
    Turnout_06_Control 'YardMaster 1, Port 08
    Turnout_07_Control 'YardMaster 1, Port 09
    Turnout_33_Control 'YardMaster 1, Port 10
    Turnout_34_Control 'YardMaster 1, Port 11
    Turnout_AA_Control 'YardMaster 1, Port 12
    Turnout_14_Control 'YardMaster 1, Port 13
    Turnout_22_Control 'YardMaster 1, Port 14
    Turnout_23_Control 'YardMaster 1, Port 15
    Turnout_24_Control 'YardMaster 1, Port 16
SENSORS:
    Turnout_05_Button_Sensor 'Sentry 1, Port 01
    Turnout_08_Button_Sensor 'Sentry 1, Port 02
    Turnout_13_Button_Sensor 'Sentry 1, Port 03
    Turnout_21_Button_Sensor 'Sentry 1, Port 04
    Turnout_12_Button_Sensor 'Sentry 1, Port 05
    Turnout_19_Button_Sensor 'Sentry 1, Port 06
    Turnout_20_Button_Sensor 'Sentry 1, Port 07
    Turnout_06_Button_Sensor 'Sentry 1, Port 08
    Turnout_07_Button_Sensor 'Sentry 1, Port 09
    Turnout_33_Button_Sensor 'Sentry 1, Port 10
    Turnout_34_Button_Sensor 'Sentry 1, Port 11
    Turnout_AA_Button_Sensor 'Sentry 1, Port 12
    Turnout_14_Button_Sensor 'Sentry 1, Port 13
    Turnout_22_Button_Sensor 'Sentry 1, Port 14
    Turnout_23_Button_Sensor 'Sentry 1, Port 15
    Turnout_24_Button_Sensor 'Sentry 1, Port 16

{--
 -  Block Control, Board 1

 -  TrainBrain 1 (4 control, 4 sensor)
 -  TrainBrain 2 (4 control, 4 sensor)
 -  Dash-8 1 (8 control)
 -}
CONTROLS:
    Block_08_Power_1or2 'TrainBrain 1, Port 1
    Block_01_Power_1or2 'TrainBrain 1, Port 2
    Block_05_Power_1or2 'TrainBrain 1, Port 3
    Block_09_Power_1or2 'TrainBrain 1, Port 4
SENSORS:
    Block_08_East_Sensor# 'TrainBrain 1, Port 1
    Block_08_West_Sensor# 'TrainBrain 1, Port 2
    Block_01_East_Sensor# 'TrainBrain 1, Port 3
    Block_01_West_Sensor# 'TrainBrain 1, Port 4
CONTROLS:
    Block_08_Power_3or4 'TrainBrain 2, Port 1
    Block_01_Power_3or4 'TrainBrain 2, Port 2
    Block_05_Power_3or4 'TrainBrain 2, Port 3
    Block_09_Power_3or4 'TrainBrain 2, Port 4
SENSORS:
    Block_05_East_Sensor# 'TrainBrain 2, Port 1
    Block_05_West_Sensor# 'TrainBrain 2, Port 2
    Block_09_East_Sensor# 'TrainBrain 2, Port 3
    Block_09_West_Sensor# 'TrainBrain 2, Port 4
CONTROLS:
    Block_08_Power_12or34 'Dash-8 1, port 1
    Block_01_Power_12or34 'Dash-8 1, port 2
    Block_05_Power_12or34 'Dash-8 1, port 3
    Block_09_Power_12or34 'Dash-8 1, port 4
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
    Turnout_19_Secondary_Control 'Switchman 1, port 2
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
    Block_07_Power_1or2 'TrainBrain 1, Port 1
    Block_11_Power_1or2 'TrainBrain 1, Port 2
    Block_04_Power_1or2 'TrainBrain 1, Port 3
    Block_12_Power_1or2 'TrainBrain 1, Port 4
SENSORS:
    Block_07_East_Sensor# 'TrainBrain 1, Port 1
    Block_07_West_Sensor# 'TrainBrain 1, Port 2
    Block_11_East_Sensor# 'TrainBrain 1, Port 3
    Block_11_West_Sensor# 'TrainBrain 1, Port 4
CONTROLS:
    Block_07_Power_3or4 'TrainBrain 2, Port 1
    Block_11_Power_3or4 'TrainBrain 2, Port 2
    Block_04_Power_3or4 'TrainBrain 2, Port 3
    Block_12_Power_3or4 'TrainBrain 2, Port 4
SENSORS:
    Block_04_East_Sensor# 'TrainBrain 2, Port 1
    Block_04_West_Sensor# 'TrainBrain 2, Port 2
    Block_12_East_Sensor# 'TrainBrain 2, Port 3
    Block_12_West_Sensor# 'TrainBrain 2, Port 4
CONTROLS:
    Block_07_Power_12or34 'Dash-8 1, port 1
    Block_11_Power_12or34 'Dash-8 1, port 2
    Block_04_Power_12or34 'Dash-8 1, port 3
    Block_12_Power_12or34 'Dash-8 1, port 4
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
 - IR Detection, Board 1
 -
 - Sentry 1 (16 sensor)
 -}
SENSORS:
    
    Staging_Rear_Warning_Detector 'Sentry 1, Port 01
    Staging_Front_Warning_Detector 'Sentry 1, Port 02
    Bottom_Island_Warning_Detector 'Sentry 1, Port 03
    Yard_Lead_Warning_Detector 'Sentry 1, Port 04
    IR_Port_05 'Sentry 1, Port 05
    IR_Port_06 'Sentry 1, Port 06
    IR_Port_07 'Sentry 1, Port 07
    IR_Port_08 'Sentry 1, Port 08
    IR_Port_09 'Sentry 1, Port 09
    IR_Port_10 'Sentry 1, Port 10
    IR_Port_11 'Sentry 1, Port 11
    IR_Port_12 'Sentry 1, Port 12
    IR_Port_13 'Sentry 1, Port 13
    IR_Port_14 'Sentry 1, Port 14
    IR_Port_15~ 'Sentry 1, Port 15
    IR_Port_16 'Sentry 1, Port 16

{--
 -  Tortoise, Board 2

 -  YardMaster 1 (16 control)
 -  Sentry 1 (16 sensor)
 -}
CONTROLS:
    Turnout_ya_Control 'YardMaster 1, Port 01
    Turnout_02_Control 'YardMaster 1, Port 02
    Turnout_01_Control 'YardMaster 1, Port 03
    Turnout_04_Control 'YardMaster 1, Port 04
    Turnout_09_Control 'YardMaster 1, Port 05
    Turnout_10_Control 'YardMaster 1, Port 06
    Turnout_16_Control 'YardMaster 1, Port 07
    Turnout_17_Control 'YardMaster 1, Port 08
    Turnout_03_Control 'YardMaster 1, Port 09
    Turnout_18_Control 'YardMaster 1, Port 10
    Turnout_15_Control 'YardMaster 1, Port 11
    Turnout_11_Control 'YardMaster 1, Port 12
    Turnout_31_Control 'YardMaster 1, Port 13
    Turnout_32_Control 'YardMaster 1, Port 14
    Turnout_yo_Control 'YardMaster 1, Port 15
    Turnout_yp_Control 'YardMaster 1, Port 16

SENSORS:
    Turnout_ya_Button_Sensor 'Sentry 1, Port 01
    Turnout_02_Button_Sensor 'Sentry 1, Port 02
    Turnout_01_Button_Sensor 'Sentry 1, Port 03
    Turnout_04_Button_Sensor 'Sentry 1, Port 04
    Turnout_09_Button_Sensor 'Sentry 1, Port 05
    Turnout_10_Button_Sensor 'Sentry 1, Port 06
    Turnout_16_Button_Sensor 'Sentry 1, Port 07
    Turnout_17_Button_Sensor 'Sentry 1, Port 08
    Turnout_03_Button_Sensor 'Sentry 1, Port 09
    Turnout_18_Button_Sensor 'Sentry 1, Port 10
    Turnout_15_Button_Sensor 'Sentry 1, Port 11
    Turnout_11_Button_Sensor 'Sentry 1, Port 12
    Turnout_31_Button_Sensor 'Sentry 1, Port 13
    Turnout_32_Button_Sensor 'Sentry 1, Port 14
    Turnout_yo_Button_Sensor 'Sentry 1, Port 15
    Turnout_yp_Button_Sensor 'Sentry 1, Port 16

{--
 -  Block Control, Board 3

 -  TrainBrain 1 (4 control, 4 sensor)
 -  TrainBrain 2 (4 control, 4 sensor)
 -  Dash-8 1 (8 control)
 -}
CONTROLS:
    Block_02_Power_1or2 'TrainBrain 1, Port 1
    Block_06_Power_1or2 'TrainBrain 1, Port 2
    Block_10_Power_1or2 'TrainBrain 1, Port 3
    Block_03_Power_1or2 'TrainBrain 1, Port 4
SENSORS:
    Block_02_East_Sensor# 'TrainBrain 1, Port 1
    Block_02_West_Sensor# 'TrainBrain 1, Port 2
    Block_06_East_Sensor# 'TrainBrain 1, Port 3
    Block_06_West_Sensor# 'TrainBrain 1, Port 4
CONTROLS:
    Block_02_Power_3or4 'TrainBrain 2, Port 1
    Block_06_Power_3or4 'TrainBrain 2, Port 2
    Block_10_Power_3or4 'TrainBrain 2, Port 3
    Block_03_Power_3or4 'TrainBrain 2, Port 4
SENSORS:
    Block_10_East_Sensor# 'TrainBrain 2, Port 1
    Block_10_West_Sensor# 'TrainBrain 2, Port 2
    Block_03_East_Sensor# 'TrainBrain 2, Port 3
    Block_03_West_Sensor# 'TrainBrain 2, Port 4
CONTROLS:
    Block_02_Power_12or34 'Dash-8 1, port 1
    Block_06_Power_12or34 'Dash-8 1, port 2
    Block_10_Power_12or34 'Dash-8 1, port 3
    Block_03_Power_12or34 'Dash-8 1, port 4
    Block_G1_Control_3 'Dash-8 1, port 5
    Block_G2_Control_3 'Dash-8 1, port 6
    Block_G3_Control_3 'Dash-8 1, port 7
    Block_G4_Control_3 'Dash-8 1, port 8

{--
 -  Tortoise, Board 3
 -
 -  YardMaster 1 (16 control)
 -  Sentry 1 (16 sensor)
 -}
CONTROLS:
    Turnout_za_Control 'YardMaster 1, Port 01
    Turnout_zb_Control 'YardMaster 1, Port 02
    Turnout_25_Control 'YardMaster 1, Port 03
    Turnout_26_Control 'YardMaster 1, Port 04
    Turnout_28_Control 'YardMaster 1, Port 05
    Turnout_29_Control 'YardMaster 1, Port 06
    Turnout_30_Control 'YardMaster 1, Port 07
    Turnout_27_Control 'YardMaster 1, Port 08
    Turnout_zi_Control 'YardMaster 1, Port 09
    Turnout_zj_Control 'YardMaster 1, Port 10
    Turnout_zk_Control 'YardMaster 1, Port 11
    Turnout_zl_Control 'YardMaster 1, Port 12
    Turnout_zm_Control 'YardMaster 1, Port 13
    Turnout_zn_Control 'YardMaster 1, Port 14
    Turnout_zo_Control 'YardMaster 1, Port 15
    Turnout_zp_Control 'YardMaster 1, Port 16
SENSORS:
    Turnout_za_Button_Sensor 'Sentry 1, Port 01
    Turnout_zb_Button_Sensor 'Sentry 1, Port 02
    Turnout_25_Button_Sensor 'Sentry 1, Port 03
    Turnout_26_Button_Sensor 'Sentry 1, Port 04
    Turnout_28_Button_Sensor 'Sentry 1, Port 05
    Turnout_29_Button_Sensor 'Sentry 1, Port 06
    Turnout_30_Button_Sensor 'Sentry 1, Port 07
    Turnout_27_Button_Sensor 'Sentry 1, Port 08
    Turnout_zi_Button_Sensor 'Sentry 1, Port 09
    Turnout_zj_Button_Sensor 'Sentry 1, Port 10
    Turnout_zk_Button_Sensor 'Sentry 1, Port 11
    Turnout_zl_Button_Sensor 'Sentry 1, Port 12
    Turnout_zm_Button_Sensor 'Sentry 1, Port 13
    Turnout_zn_Button_Sensor 'Sentry 1, Port 14
    Turnout_zo_Button_Sensor 'Sentry 1, Port 15
    Turnout_zp_Button_Sensor 'Sentry 1, Port 16

{--
 -  Block Control, Board 4 (v2)

 -  Dash-8 1 (8 control)
 -  TrainBrain 1 (4 control, 4 sensor)
 -  Watchman 1 (8 sensor)
 -}
CONTROLS:
    Block_13_Power_1or2 'Dash-8 1, port 1
    Block_14_Power_1or2 'Dash-8 1, port 2
    Block_15_Power_1or2 'Dash-8 1, port 3
    Block_DD_Power_1or2 'Dash-8 1, port 4
    Block_13_Power_12or34 'Dash-8 1, port 5
    Block_14_Power_12or34 'Dash-8 1, port 6
    Block_15_Power_12or34 'Dash-8 1, port 7
    Block_DD_power_12or34 'Dash-8 1, port 8
CONTROLS:
    Block_13_Power_3or4 'TrainBrain 1, port 1
    Block_14_Power_3or4 'TrainBrain 1, port 2
    Block_15_Power_3or4 'TrainBrain 1, port 3
    Block_DD_Power_3or4 'TrainBrain 1, port 4
SENSORS:
    Block_ZA_East_Sensor# 'TrainBrain 1, Port 1
    Block_ZB_West_Sensor# 'TrainBrain 1, Port 2
    Block_ZC_East_Sensor# 'TrainBrain 1, Port 3
    Block_ZD_West_Sensor# 'TrainBrain 1, Port 4
SENSORS:
    Block_13_East_Sensor# 'Watchman 1, Port 1
    Block_13_West_Sensor# 'Watchman 1, Port 2
    Block_14_East_Sensor# 'Watchman 1, Port 3
    Block_14_West_Sensor# 'Watchman 1, Port 4
    Block_15_East_Sensor# 'Watchman 1, Port 5
    Block_15_West_Sensor# 'Watchman 1, Port 6
    Block_DD_East_Sensor# 'Watchman 1, Port 7
    Block_DD_West_Sensor# 'Watchman 1, Port 8

VARIABLES:
    {--
     - Turnouts
     -}
    PANEL_1_TURNOUTS[NUM_TURNOUTS]  ' Coordinate location of turnouts on panel 1 (F5)
    TURNOUT_TYPES[NUM_TURNOUTS]     ' Type of each turnout (TURNOUT_TYPE_TORTOISE / TURNOUT_TYPE_ATLAS)
    TURNOUT_STATUSES[NUM_TURNOUTS]  ' Current status of each turnout (TURNOUT_DIRECTION_PRIMARY / TURNOUT_DIRECTION_SECONDARY)
    
    TURNOUT_CONTROLS[NUM_TURNOUTS]          ' Board controls for each turnout (led + direction for tortoise, led for atlas)
    ATLAS_PRIMARY_CONTROLS[NUM_TURNOUTS]    ' Board controls for throwing an atlas turnout in the primary direction)
    ATLAS_SECONDARY_CONTROLS[NUM_TURNOUTS]  ' Board control for throwing an atlas turnout in the secondary direction)

    {--
     - Blocks
     -}
    BLOCK_CONTROLS_1or2[NUM_BLOCKS]
    BLOCK_CONTROLS_3or4[NUM_BLOCKS]
    BLOCK_CONTROLS_12or34[NUM_BLOCKS]

    BLOCK_CAB_ASSIGNMENTS[NUM_BLOCKS]
    BLOCK_STATUSES[NUM_BLOCKS]

    PANEL_1_BLOCK_LABELS[NUM_BLOCKS]
    PANEL_1_BLOCK_TRACKS[NUM_BLOCKS]
    PANEL_1_BLOCK_DIRECTIONS[NUM_BLOCKS]
    PANEL_1_BLOCK_SIGNAL_INDICATORS[NUM_BLOCKS]

    {--
     - Cabs
     -}
    CAB_COLORS[NUM_CABS]

    {--
     - Mainline Automation
     -}
    MAINLINE_AUTOMATION
    AUTOMATION_BLOCK_CAB_RESERVATIONS[NUM_BLOCKS]

    {--
     - Debugging Panel
     -}
    BLOCK_DEBUGGING_CAB_STATUS[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_STATUS[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[NUM_BLOCKS]
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[NUM_BLOCKS]


ACTIONS:

{-- TURNOUTS --}

SUB Redraw_Turnout(TurnoutIndex)
    $SWITCH(PANEL_1_TURNOUTS[TurnoutIndex]) = $SWITCH(PANEL_1_TURNOUTS[TurnoutIndex]) ~
ENDSUB

SUB ResetInit_Set_Turnout_Types()
    TURNOUT_TYPES[TURNOUT_01] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_02] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_03] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_04] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_05] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_06] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_07] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_08] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_09] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_10] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_11] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_12] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_13] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_14] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_15] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_16] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_17] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_18] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_19] = TURNOUT_TYPE_ATLAS
    TURNOUT_TYPES[TURNOUT_20] = TURNOUT_TYPE_ATLAS
    ' TURNOUT_TYPES[TURNOUT_21] = TURNOUT_TYPE_ATLAS
    ' TURNOUT_TYPES[TURNOUT_22] = TURNOUT_TYPE_TORTOISE
    ' TURNOUT_TYPES[TURNOUT_23] = TURNOUT_TYPE_TORTOISE
    ' TURNOUT_TYPES[TURNOUT_24] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_25] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_26] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_27] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_28] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_29] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[TURNOUT_30] = TURNOUT_TYPE_TORTOISE
    ' TURNOUT_TYPES[TURNOUT_31] = TURNOUT_TYPE_ATLAS
    ' TURNOUT_TYPES[TURNOUT_32] = TURNOUT_TYPE_ATLAS
    ' TURNOUT_TYPES[TURNOUT_33] = TURNOUT_TYPE_TORTOISE
    ' TURNOUT_TYPES[TURNOUT_34] = TURNOUT_TYPE_TORTOISE
ENDSUB

SUB ResetInit_Set_Turnout_Controls()
    TURNOUT_CONTROLS[TURNOUT_01] = &Turnout_01_Control
    TURNOUT_CONTROLS[TURNOUT_02] = &Turnout_02_Control
    TURNOUT_CONTROLS[TURNOUT_03] = &Turnout_03_Control
    TURNOUT_CONTROLS[TURNOUT_04] = &Turnout_04_Control
    TURNOUT_CONTROLS[TURNOUT_05] = &Turnout_05_Control
    TURNOUT_CONTROLS[TURNOUT_06] = &Turnout_06_Control
    TURNOUT_CONTROLS[TURNOUT_07] = &Turnout_07_Control
    TURNOUT_CONTROLS[TURNOUT_08] = &Turnout_08_Control
    TURNOUT_CONTROLS[TURNOUT_09] = &Turnout_09_Control
    TURNOUT_CONTROLS[TURNOUT_10] = &Turnout_10_Control
    TURNOUT_CONTROLS[TURNOUT_11] = &Turnout_11_Control
    TURNOUT_CONTROLS[TURNOUT_12] = &Turnout_12_Control
    TURNOUT_CONTROLS[TURNOUT_13] = &Turnout_13_Control
    TURNOUT_CONTROLS[TURNOUT_14] = &Turnout_14_Control
    TURNOUT_CONTROLS[TURNOUT_15] = &Turnout_15_Control
    TURNOUT_CONTROLS[TURNOUT_16] = &Turnout_16_Control
    TURNOUT_CONTROLS[TURNOUT_17] = &Turnout_17_Control
    TURNOUT_CONTROLS[TURNOUT_18] = &Turnout_18_Control
    TURNOUT_CONTROLS[TURNOUT_19] = &Turnout_19_Control
    TURNOUT_CONTROLS[TURNOUT_20] = &Turnout_20_Control
    ' TURNOUT_CONTROLS[TURNOUT_21] = &Turnout_21_Control
    ' TURNOUT_CONTROLS[TURNOUT_22] = &Turnout_22_Control
    ' TURNOUT_CONTROLS[TURNOUT_23] = &Turnout_23_Control
    ' TURNOUT_CONTROLS[TURNOUT_24] = &Turnout_24_Control
    TURNOUT_CONTROLS[TURNOUT_25] = &Turnout_25_Control
    TURNOUT_CONTROLS[TURNOUT_26] = &Turnout_26_Control
    TURNOUT_CONTROLS[TURNOUT_27] = &Turnout_27_Control
    TURNOUT_CONTROLS[TURNOUT_28] = &Turnout_28_Control
    TURNOUT_CONTROLS[TURNOUT_29] = &Turnout_29_Control
    TURNOUT_CONTROLS[TURNOUT_30] = &Turnout_30_Control
    ' TURNOUT_CONTROLS[TURNOUT_31] = &Turnout_31_Control
    ' TURNOUT_CONTROLS[TURNOUT_32] = &Turnout_32_Control
    ' TURNOUT_CONTROLS[TURNOUT_33] = &Turnout_33_Control
    ' TURNOUT_CONTROLS[TURNOUT_34] = &Turnout_34_Control

    ATLAS_PRIMARY_CONTROLS[TURNOUT_19] = &Turnout_19_Primary_Control
    ATLAS_PRIMARY_CONTROLS[TURNOUT_20] = &Turnout_20_Primary_Control
    ' ATLAS_PRIMARY_CONTROLS[TURNOUT_21] = &Turnout_21_Primary_Control
    ' ATLAS_PRIMARY_CONTROLS[TURNOUT_31] = &Turnout_31_Primary_Control
    ' ATLAS_PRIMARY_CONTROLS[TURNOUT_32] = &Turnout_32_Primary_Control
    ATLAS_SECONDARY_CONTROLS[TURNOUT_19] = &Turnout_19_Secondary_Control
    ATLAS_SECONDARY_CONTROLS[TURNOUT_20] = &Turnout_20_Secondary_Control
    ' ATLAS_SECONDARY_CONTROLS[TURNOUT_21] = &Turnout_21_Secondary_Control
    ' ATLAS_SECONDARY_CONTROLS[TURNOUT_31] = &Turnout_31_Secondary_Control
    ' ATLAS_SECONDARY_CONTROLS[TURNOUT_32] = &Turnout_32_Secondary_Control
ENDSUB

SUB ResetInit_Set_Turnouts_On_Panels()
    PANEL_1_TURNOUTS[TURNOUT_01] = (5,18,1)
    PANEL_1_TURNOUTS[TURNOUT_02] = (8,19,1)
    PANEL_1_TURNOUTS[TURNOUT_03] = (29,18,1)
    PANEL_1_TURNOUTS[TURNOUT_04] = (15,18,1)
    PANEL_1_TURNOUTS[TURNOUT_05] = (35,18,1)
    PANEL_1_TURNOUTS[TURNOUT_06] = (42,18,1)
    PANEL_1_TURNOUTS[TURNOUT_07] = (7,8,1)
    PANEL_1_TURNOUTS[TURNOUT_08] = (45,18,1)
    PANEL_1_TURNOUTS[TURNOUT_09] = (5,5,1)
    PANEL_1_TURNOUTS[TURNOUT_10] = (15,5,1)
    PANEL_1_TURNOUTS[TURNOUT_11] = (29,5,1)
    PANEL_1_TURNOUTS[TURNOUT_12] = (38,5,1)
    PANEL_1_TURNOUTS[TURNOUT_13] = (42,5,1)
    PANEL_1_TURNOUTS[TURNOUT_14] = (41,19,1)
    PANEL_1_TURNOUTS[TURNOUT_15] = (12,5,1)
    PANEL_1_TURNOUTS[TURNOUT_16] = (8,6,1)
    PANEL_1_TURNOUTS[TURNOUT_17] = (60,5,1)
    PANEL_1_TURNOUTS[TURNOUT_18] = (27,16,1)
    PANEL_1_TURNOUTS[TURNOUT_19] = (37,4,1)
    PANEL_1_TURNOUTS[TURNOUT_20] = (36,3,1)
    PANEL_1_TURNOUTS[TURNOUT_21] = (43,4,1)
    ' PANEL_1_TURNOUTS[TURNOUT_22] = (51,22,1)
    ' PANEL_1_TURNOUTS[TURNOUT_23] = (55,22,1)
    ' PANEL_1_TURNOUTS[TURNOUT_24] = (56,23,1)
    PANEL_1_TURNOUTS[TURNOUT_25] = (59,12,1)
    PANEL_1_TURNOUTS[TURNOUT_26] = (58,11,1)
    PANEL_1_TURNOUTS[TURNOUT_27] = (7,10,1)
    PANEL_1_TURNOUTS[TURNOUT_28] = (9,12,1)
    PANEL_1_TURNOUTS[TURNOUT_29] = (10,12,1)
    PANEL_1_TURNOUTS[TURNOUT_30] = (11,12,1)
    ' PANEL_1_TURNOUTS[TURNOUT_31] = (28,4,1)
    ' PANEL_1_TURNOUTS[TURNOUT_32] = (26,4,1)
    ' PANEL_1_TURNOUTS[TURNOUT_33] = (37,21,1)
    ' PANEL_1_TURNOUTS[TURNOUT_34] = (36,21,1)
ENDSUB

SUB Set_Turnout(TurnoutIndex, Direction)
    ' Invert status of turnout, from thrown to straight or vice versa
    TURNOUT_STATUSES[TurnoutIndex] = Direction

    *TURNOUT_CONTROLS[TurnoutIndex] = TURNOUT_STATUSES[TurnoutIndex]

    IF TURNOUT_TYPES[TurnoutIndex] = TURNOUT_TYPE_ATLAS THEN
        IF TURNOUT_STATUSES[TurnoutIndex] = TURNOUT_DIRECTION_PRIMARY THEN
            *ATLAS_SECONDARY_CONTROLS[TurnoutIndex] = PULSE 0.25
        ELSE
            *ATLAS_PRIMARY_CONTROLS[TurnoutIndex] = PULSE 0.25
        ENDIF
    ENDIF

    ' Redraw turnout on panel
    Redraw_Turnout(TurnoutIndex)
ENDSUB

SUB ResetInit_Set_Turnouts_To_Primary({local} TurnoutIndex)
    TurnoutIndex = 0
    UNTIL TurnoutIndex >= NUM_TURNOUTS QUICKLOOP
        Set_Turnout(TurnoutIndex, TURNOUT_DIRECTION_PRIMARY)

        TurnoutIndex = 1 +
    ENDLOOP
ENDSUB

SUB Throw_Turnout(TurnoutIndex)
    Set_Turnout(TurnoutIndex, TURNOUT_STATUSES[TurnoutIndex] ~)
ENDSUB



{-- BLOCKS --}

SUB Redraw_Debugging(BlockIndex, {local} SignalStatus)
    IF BlockIndex > BLOCK_04 THEN RETURN ENDIF

$LOG = "DEBUGGING Redraw_Debugging(@BlockIndex)"
$LOG = "Status:"
$LOG = (BLOCK_STATUSES[BlockIndex])

    ' Signal
    SignalStatus = BLOCK_STATUSES[BlockIndex]
    SignalStatus = BLOCK_OCCUPIED &
    IF SignalStatus THEN $Signal (BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex]) = "xYxxxx" ELSE BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex] = "x*xxxx" ENDIF

    SignalStatus = BLOCK_STATUSES[BlockIndex]
    SignalStatus = BLOCK_OCCUPIED_EAST &
    IF SignalStatus THEN $Signal (BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex]) = "Gxxxxx" ELSE BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex] = "*xxxxx" ENDIF

    SignalStatus = BLOCK_STATUSES[BlockIndex]
    SignalStatus = BLOCK_OCCUPIED_WEST &
    IF SignalStatus THEN $Signal (BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex]) = "xxGxxx" ELSE BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex] = "xx*xxx" ENDIF

    SignalStatus = BLOCK_STATUSES[BlockIndex]
    SignalStatus = BLOCK_UNDER_MANUAL_HOLD &
    IF SignalStatus THEN $Signal (BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex]) = "xxxRxx" ELSE BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex] = "xxx*xx" ENDIF

    SignalStatus = BLOCK_STATUSES[BlockIndex]
    SignalStatus = BLOCK_UNDER_SYSTEM_HOLD &
    IF SignalStatus THEN $Signal (BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex]) = "xxxxRx" ELSE BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex] = "xxxx*x" ENDIF

    SignalStatus = BLOCK_STATUSES[BlockIndex]
    SignalStatus = BLOCK_UNDER_MAINLINE_HOLD &
    IF SignalStatus THEN $Signal (BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex]) = "xxxxxR" ELSE BLOCK_DEBUGGING_BLOCK_STATUS[BlockIndex] = "xxxxx*" ENDIF

{-
    BLOCK_UNOCCUPIED = 0
    BLOCK_OCCUPIED = 1
    BLOCK_OCCUPIED_EAST = 2
    BLOCK_OCCUPIED_WEST = 4
    BLOCK_UNDER_MANUAL_HOLD = 8
    BLOCK_UNDER_SYSTEM_HOLD = 16
    BLOCK_UNDER_MAINLINE_HOLD = 32
-}

{-

    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_01] = (10, 31, 1)
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_02] = (10, 32, 1)
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_03] = (10, 33, 1)
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_04] = (10, 34, 1)

    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_01] = (11, 31, 1)
    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_02] = (11, 32, 1)
    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_03] = (11, 33, 1)
    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_04] = (11, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_01] = (12, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_02] = (12, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_03] = (12, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_04] = (12, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_01] = (13, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_02] = (13, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_03] = (13, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_04] = (13, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_01] = (14, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_02] = (14, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_03] = (14, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_04] = (14, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_01] = (15, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_02] = (15, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_03] = (15, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_04] = (15, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_01] = (16, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_02] = (16, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_03] = (16, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_04] = (16, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_01] = (17, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_02] = (17, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_03] = (17, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_04] = (17, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_01] = (18, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_02] = (18, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_03] = (18, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_04] = (18, 34, 1)
-}
ENDSUB

SUB Redraw_Block_Power(BlockIndex, {local} CabIndexForBlock)
    CabIndexForBlock = BLOCK_CAB_ASSIGNMENTS[BlockIndex]
    $COLOR TRACK (PANEL_1_BLOCK_LABELS[BlockIndex]) = CAB_COLORS[CabIndexForBlock]
ENDSUB

SUB ResetInit_Set_Block_Power_Controls()
    BLOCK_CONTROLS_1or2[BLOCK_01] = &Block_01_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_02] = &Block_02_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_03] = &Block_03_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_04] = &Block_04_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_05] = &Block_05_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_06] = &Block_06_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_07] = &Block_07_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_08] = &Block_08_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_09] = &Block_09_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_10] = &Block_10_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_11] = &Block_11_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_12] = &Block_12_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_13] = &Block_13_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_14] = &Block_14_Power_1or2
    BLOCK_CONTROLS_1or2[BLOCK_15] = &Block_15_Power_1or2

    BLOCK_CONTROLS_3or4[BLOCK_01] = &Block_01_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_02] = &Block_02_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_03] = &Block_03_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_04] = &Block_04_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_05] = &Block_05_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_06] = &Block_06_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_07] = &Block_07_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_08] = &Block_08_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_09] = &Block_09_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_10] = &Block_10_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_11] = &Block_11_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_12] = &Block_12_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_13] = &Block_13_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_14] = &Block_14_Power_3or4
    BLOCK_CONTROLS_3or4[BLOCK_15] = &Block_15_Power_3or4
    
    BLOCK_CONTROLS_12or34[BLOCK_01] = &Block_01_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_02] = &Block_02_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_03] = &Block_03_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_04] = &Block_04_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_05] = &Block_05_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_06] = &Block_06_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_07] = &Block_07_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_08] = &Block_08_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_09] = &Block_09_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_10] = &Block_10_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_11] = &Block_11_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_12] = &Block_12_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_13] = &Block_13_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_14] = &Block_14_Power_12or34
    BLOCK_CONTROLS_12or34[BLOCK_15] = &Block_15_Power_12or34
ENDSUB

SUB Automation_Block_Status_Changed(BlockIndex, {local} NextBlockIndexEast, {local} NextBlockIndexWest)
    NextBlockIndexEast = BlockIndex
    NextBlockIndexEast = 1 -
    NextBlockIndexEast = NUM_MAINLINE_BLOCKS +
    NextBlockIndexEast = 1 +
    NextBlockIndexEast = NUM_MAINLINE_BLOCKS %

    NextBlockIndexWest = BlockIndex
    NextBlockIndexWest = 1 +
    NextBlockIndexEast = NUM_MAINLINE_BLOCKS %
ENDSUB

SUB Redraw_Block_Occupancy(BlockIndex, {local} BitMaskResult, {local} TrackColor, {local} SignalState, {local} UnderManualHold, {local} UnderMainlineHold)
    BitMaskResult = BLOCK_STATUSES[BlockIndex]
    BitMaskResult = BLOCK_OCCUPIED &

    IF BitMaskResult THEN
        TrackColor = BLOCK_CAB_ASSIGNMENTS[BlockIndex]
        TrackColor = CAB_COLORS[TrackColor]
    ELSE
        TrackColor = LIGHTGRAY
    ENDIF 

    $COLOR BLOCK (PANEL_1_BLOCK_TRACKS[BlockIndex]) = TrackColor

    '''
    
    $ERASE SPRITE (PANEL_1_BLOCK_DIRECTIONS[BlockIndex])

    BitMaskResult = BLOCK_STATUSES[BlockIndex]
    BitMaskResult = BLOCK_OCCUPIED_EAST &
    IF BitMaskResult THEN
        $DRAW SPRITE (PANEL_1_BLOCK_DIRECTIONS[BlockIndex]) = ARROW_EAST IN TrackColor
    ENDIF

    BitMaskResult = BLOCK_STATUSES[BlockIndex]
    BitMaskResult = BLOCK_OCCUPIED_WEST &
    IF BitMaskResult THEN
        $DRAW SPRITE (PANEL_1_BLOCK_DIRECTIONS[BlockIndex]) = ARROW_WEST IN TrackColor
    ENDIF

    '''

    UnderManualHold = BLOCK_STATUSES[BlockIndex]
    UnderManualHold = BLOCK_UNDER_MANUAL_HOLD &
    IF UnderManualHold THEN $SIGNAL (PANEL_1_BLOCK_SIGNAL_INDICATORS[BlockIndex]) = "xxRx" ELSE $SIGNAL (PANEL_1_BLOCK_SIGNAL_INDICATORS[BlockIndex]) = "xx*x" ENDIF

    UnderMainlineHold = BLOCK_STATUSES[BlockIndex]
    UnderMainlineHold = BLOCK_UNDER_MAINLINE_HOLD &
    IF UnderMainlineHold THEN $SIGNAL (PANEL_1_BLOCK_SIGNAL_INDICATORS[BlockIndex]) = "xxxR" ELSE $SIGNAL (PANEL_1_BLOCK_SIGNAL_INDICATORS[BlockIndex]) = "xxx*" ENDIF

    Redraw_Debugging(BlockIndex)
ENDSUB

SUB Block_Status_Changed(BlockIndex)
    Automation_Block_Status_Changed(BlockIndex)
    Redraw_Block_Occupancy(BlockIndex)
ENDSUB

SUB Set_Block_Power_To_Cab(BlockIndex, CabIndex)
    ' Don't do any work if we already have the correct assignment
    IF BLOCK_CAB_ASSIGNMENTS[BlockIndex] = CabIndex THEN RETURN ENDIF

    IF CabIndex = 0 THEN
        *BLOCK_CONTROLS_1or2[BlockIndex] = POWER_OPTION_FIRST_CHOICE
        *BLOCK_CONTROLS_12or34[BlockIndex] = POWER_OPTION_FIRST_CHOICE
    ELSEIF CabIndex = 1 THEN
        *BLOCK_CONTROLS_1or2[BlockIndex] = POWER_OPTION_SECOND_CHOICE
        *BLOCK_CONTROLS_12or34[BlockIndex] = POWER_OPTION_FIRST_CHOICE
    ELSEIF CabIndex = 2 THEN
        *BLOCK_CONTROLS_3or4[BlockIndex] = POWER_OPTION_FIRST_CHOICE
        *BLOCK_CONTROLS_12or34[BlockIndex] = POWER_OPTION_SECOND_CHOICE
    ELSEIF CabIndex = 3 THEN
        *BLOCK_CONTROLS_3or4[BlockIndex] = POWER_OPTION_SECOND_CHOICE
        *BLOCK_CONTROLS_12or34[BlockIndex] = POWER_OPTION_SECOND_CHOICE
    ENDIF

    BLOCK_CAB_ASSIGNMENTS[BlockIndex] = CabIndex

    Redraw_Block_Power(BlockIndex)
    Redraw_Block_Occupancy(BlockIndex)
ENDSUB

SUB Set_All_Block_Power_To_Cab(CabIndex, {local} BlockIndex)
    BlockIndex = 0
    UNTIL BlockIndex >= NUM_BLOCKS QUICKLOOP
        Set_Block_Power_To_Cab(BlockIndex, CabIndex)

        BlockIndex = 1 +
    ENDLOOP
ENDSUB

SUB Toggle_Manual_Hold(BlockIndex, {local} BitMaskResult, {local} Negater)
    BitMaskResult = BLOCK_STATUSES[BlockIndex]
    BitMaskResult = BLOCK_UNDER_MANUAL_HOLD &

    IF BitMaskResult THEN
        BLOCK_STATUSES[BlockIndex] = BLOCK_UNDER_MANUAL_HOLD -
    ELSE
        BLOCK_STATUSES[BlockIndex] = BLOCK_UNDER_MANUAL_HOLD +
    ENDIF

    Automation_Block_Status_Changed(BlockIndex)
ENDSUB

SUB User_Select_Block_Cab_Assignment(BlockIndex, {local} CabIndex)
    $QUERY "1$Choose block status:?$Assign to Cab 1$Assign to Cab 2$Assign to Cab 3$Assign to Cab 4$Toggle manual hold"
    WAIT UNTIL $QUERYBUSY = FALSE THEN
    CabIndex = $QUERYRESPONSE

    IF CabIndex < 0 THEN RETURN ENDIF

    IF CabIndex >= 0, CabIndex < NUM_CABS THEN Set_Block_Power_To_Cab(BlockIndex, CabIndex), RETURN ENDIF

    IF CabIndex = 4 THEN Toggle_Manual_Hold(BlockIndex), RETURN ENDIF
ENDSUB

SUB ResetInit_Set_Block_Lables_On_Panels()
    PANEL_1_BLOCK_LABELS[0] = (3,2,1)
    PANEL_1_BLOCK_LABELS[1] = (15,2,1)
    PANEL_1_BLOCK_LABELS[2] = (27,2,1)
    PANEL_1_BLOCK_LABELS[3] = (39,2,1)
    PANEL_1_BLOCK_LABELS[4] = (3,24,1)
    PANEL_1_BLOCK_LABELS[5] = (15,24,1)
    PANEL_1_BLOCK_LABELS[6] = (27,24,1)
    PANEL_1_BLOCK_LABELS[7] = (39,24,1)
    PANEL_1_BLOCK_LABELS[8] = (3,3,1)
    PANEL_1_BLOCK_LABELS[9] = (27,3,1)
    PANEL_1_BLOCK_LABELS[10] = (27,25,1)
    PANEL_1_BLOCK_LABELS[11] = (27,26,1)
    PANEL_1_BLOCK_LABELS[12] = (27,15,1)
    PANEL_1_BLOCK_LABELS[13] = (15,15,1)
ENDSUB

SUB ResetInit_Set_Block_Signals_On_Panels()
    PANEL_1_BLOCK_SIGNAL_INDICATORS[0] = (2,2,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[1] = (14,2,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[2] = (26,2,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[3] = (38,2,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[4] = (2,24,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[5] = (14,24,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[6] = (26,24,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[7] = (38,24,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[8] = (2,3,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[9] = (26,3,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[10] = (26,25,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[11] = (26,26,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[12] = (26,15,1)
    PANEL_1_BLOCK_SIGNAL_INDICATORS[13] = (14,15,1)
ENDSUB

SUB ResetInit_Set_Block_Tracks_On_Panels()
    PANEL_1_BLOCK_TRACKS[0] = (2,7,1)
    PANEL_1_BLOCK_TRACKS[1] = (14,8,1)
    PANEL_1_BLOCK_TRACKS[2] = (26,8,1)
    PANEL_1_BLOCK_TRACKS[3] = (38,9,1)
    PANEL_1_BLOCK_TRACKS[4] = (2,33,1)
    PANEL_1_BLOCK_TRACKS[5] = (14,32,1)
    PANEL_1_BLOCK_TRACKS[6] = (26,28,1)
    PANEL_1_BLOCK_TRACKS[7] = (38,29,1)
    PANEL_1_BLOCK_TRACKS[8] = (4,8,1)
    PANEL_1_BLOCK_TRACKS[9] = (28,9,1)
    PANEL_1_BLOCK_TRACKS[10] = (28,29,1)
    PANEL_1_BLOCK_TRACKS[11] = (31,30,1)
    PANEL_1_BLOCK_TRACKS[12] = (31,21,1)
    PANEL_1_BLOCK_TRACKS[13] = (24,20,1)
ENDSUB

SUB ResetInit_Set_Block_Directions_On_Panels()
    PANEL_1_BLOCK_DIRECTIONS[0] = (6,2,1)
    PANEL_1_BLOCK_DIRECTIONS[1] = (18,2,1)
    PANEL_1_BLOCK_DIRECTIONS[2] = (30,2,1)
    PANEL_1_BLOCK_DIRECTIONS[3] = (42,2,1)
    PANEL_1_BLOCK_DIRECTIONS[4] = (6,24,1)
    PANEL_1_BLOCK_DIRECTIONS[5] = (18,24,1)
    PANEL_1_BLOCK_DIRECTIONS[6] = (30,24,1)
    PANEL_1_BLOCK_DIRECTIONS[7] = (42,24,1)
    PANEL_1_BLOCK_DIRECTIONS[8] = (7,3,1)
    PANEL_1_BLOCK_DIRECTIONS[9] = (30,3,1)
    PANEL_1_BLOCK_DIRECTIONS[10] = (30,25,1)
    PANEL_1_BLOCK_DIRECTIONS[11] = (30,26,1)
    PANEL_1_BLOCK_DIRECTIONS[12] = (30,15,1)
    PANEL_1_BLOCK_DIRECTIONS[13] = (18,15,1)
ENDSUB

SUB ResetInit_Set_Block_Debugging_Mappings()
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_01] = (10, 31, 1)
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_02] = (10, 32, 1)
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_03] = (10, 33, 1)
    BLOCK_DEBUGGING_CAB_STATUS[BLOCK_04] = (10, 34, 1)

    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_01] = (11, 31, 1)
    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_02] = (11, 32, 1)
    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_03] = (11, 33, 1)
    BLOCK_DEBUGGING_BLOCK_STATUS[BLOCK_04] = (11, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_01] = (12, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_02] = (12, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_03] = (12, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_04] = (12, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_01] = (13, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_02] = (13, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_03] = (13, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_04] = (13, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_01] = (14, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_02] = (14, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_03] = (14, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_04] = (14, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_01] = (15, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_02] = (15, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_03] = (15, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_04] = (15, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_01] = (16, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_02] = (16, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_03] = (16, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_04] = (16, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_01] = (17, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_02] = (17, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_03] = (17, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_04] = (17, 34, 1)

    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_01] = (18, 31, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_02] = (18, 32, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_03] = (18, 33, 1)
    BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_04] = (18, 34, 1)
ENDSUB

SUB Block_Triggered_East(BlockIndex)
    BLOCK_STATUSES[BlockIndex] = BLOCK_OCCUPIED |
    BLOCK_STATUSES[BlockIndex] = BLOCK_OCCUPIED_EAST |
    Block_Status_Changed(BlockIndex)
ENDSUB

SUB Block_Triggered_West(BlockIndex)
    BLOCK_STATUSES[BlockIndex] = BLOCK_OCCUPIED |
    BLOCK_STATUSES[BlockIndex] = BLOCK_OCCUPIED_WEST |

    Block_Status_Changed(BlockIndex)
ENDSUB

SUB Block_Stopped_Triggering(BlockIndex, {local} Negater)
    Negater = BLOCK_OCCUPIED
    Negater = BLOCK_OCCUPIED_EAST |
    Negater = BLOCK_OCCUPIED_WEST |
    Negater = Negater ~
    BLOCK_STATUSES[BlockIndex] = Negater &

    Block_Status_Changed(BlockIndex)
ENDSUB

{-- Cabs --}
SUB ResetInit_Set_Cab_Colors()
    CAB_COLORS[0] = Blue
    CAB_COLORS[1] = Red
    CAB_COLORS[2] = Green
    CAB_COLORS[3] = Brown
ENDSUB

{-- Mainline Automation --}
SUB ResetInit_Mainline_Automation()
    MAINLINE_AUTOMATION = OFF
ENDSUB

SUB Mainline_Hold_Invoked(BlockIndex)
    BLOCK_STATUSES[BlockIndex] = BLOCK_UNDER_MAINLINE_HOLD |
    Block_Status_Changed(BlockIndex)
ENDSUB

SUB Mainline_Hold_Removed(BlockIndex)
    BLOCK_STATUSES[BlockIndex] = BLOCK_UNDER_MAINLINE_HOLD ^
    Block_Status_Changed(BlockIndex)
ENDSUB

SUB Automation_Reserve_Block(BlockIndex, CabIndex)
    AUTOMATION_BLOCK_CAB_RESERVATIONS[BlockIndex] = CabIndex
ENDSUB

SUB Autmation_Remove_Block_Reservation(BlockIndex)
    AUTOMATION_BLOCK_CAB_RESERVATIONS[BlockIndex] = CAB_UNASSIGNED
ENDSUB

{-- RESET --}

{--
 - When starting up (hitting train icon) or hitting reset button
 -}
WHEN $RESET = TRUE DO
    ResetInit_Set_Turnout_Types()
    ResetInit_Set_Turnout_Controls()
    ResetInit_Set_Turnouts_On_Panels()
    ResetInit_Set_Turnouts_To_Primary()

    ResetInit_Set_Cab_Colors()

    ResetInit_Set_Block_Power_Controls()
    ResetInit_Set_Block_Lables_On_Panels()
    ResetInit_Set_Block_Tracks_On_Panels()
    ResetInit_Set_Block_Directions_On_Panels()
    ResetInit_Set_Block_Signals_On_Panels()
    Set_All_Block_Power_To_Cab(-1), Set_All_Block_Power_To_Cab(0)

    ResetInit_Mainline_Automation()

    ResetInit_Set_Block_Debugging_Mappings()


{-- TRIGGERS --}

{--
 - Triggers for throwing a turnout, either by panel or by physical button
 -}
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[0] OR Turnout_01_Button_Sensor = ON DO Throw_Turnout(0)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[1] OR Turnout_02_Button_Sensor = ON DO Throw_Turnout(1)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[2] OR Turnout_03_Button_Sensor = ON DO Throw_Turnout(2)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[3] OR Turnout_04_Button_Sensor = ON DO Throw_Turnout(3)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[4] OR Turnout_05_Button_Sensor = ON DO Throw_Turnout(4)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[5] OR Turnout_06_Button_Sensor = ON DO Throw_Turnout(5)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[6] OR Turnout_07_Button_Sensor = ON DO Throw_Turnout(6)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[7] OR Turnout_08_Button_Sensor = ON DO Throw_Turnout(7)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[8] OR Turnout_09_Button_Sensor = ON DO Throw_Turnout(8)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[9] OR Turnout_10_Button_Sensor = ON DO Throw_Turnout(9)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[10] OR Turnout_11_Button_Sensor = ON DO Throw_Turnout(10)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[11] OR Turnout_12_Button_Sensor = ON DO Throw_Turnout(11)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[12] OR Turnout_13_Button_Sensor = ON DO Throw_Turnout(12)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[13] OR Turnout_14_Button_Sensor = ON DO Throw_Turnout(13)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[14] OR Turnout_15_Button_Sensor = ON DO Throw_Turnout(14)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[15] OR Turnout_16_Button_Sensor = ON DO Throw_Turnout(15)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[16] OR Turnout_17_Button_Sensor = ON DO Throw_Turnout(16)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[17] OR Turnout_18_Button_Sensor = ON DO Throw_Turnout(17)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[18] OR Turnout_19_Button_Sensor = ON DO Throw_Turnout(18)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[19] OR Turnout_20_Button_Sensor = ON DO Throw_Turnout(19)
    {
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[20] OR Turnout_21_Button_Sensor = ON DO Throw_Turnout(20)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[21] OR Turnout_22_Button_Sensor = ON DO Throw_Turnout(21)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[22] OR Turnout_23_Button_Sensor = ON DO Throw_Turnout(22)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[23] OR Turnout_24_Button_Sensor = ON DO Throw_Turnout(23)
    }
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[24] OR Turnout_25_Button_Sensor = ON DO Throw_Turnout(24)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[25] OR Turnout_26_Button_Sensor = ON DO Throw_Turnout(25)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[26] OR Turnout_27_Button_Sensor = ON DO Throw_Turnout(26)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[27] OR Turnout_28_Button_Sensor = ON DO Throw_Turnout(27)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[28] OR Turnout_29_Button_Sensor = ON DO Throw_Turnout(28)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[29] OR Turnout_30_Button_Sensor = ON DO Throw_Turnout(29)
    {
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[30] OR Turnout_31_Button_Sensor = ON DO Throw_Turnout(30)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[31] OR Turnout_32_Button_Sensor = ON DO Throw_Turnout(31)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[32] OR Turnout_33_Button_Sensor = ON DO Throw_Turnout(32)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[33] OR Turnout_34_Button_Sensor = ON DO Throw_Turnout(33)
    }

{--
 - Quick commands for setting all blocks to a cab
 -}
    WHEN $COMMAND = "All Blocks, Manual Throttle" DO Set_All_Block_Power_To_Cab(0)
    WHEN $COMMAND = "All Blocks, Orange Smart Cab" DO Set_All_Block_Power_To_Cab(1)
    WHEN $COMMAND = "All Blocks, Green Smart Cab" DO Set_All_Block_Power_To_Cab(2)
    WHEN $COMMAND = "All Blocks, Brown Smart Cab" DO Set_All_Block_Power_To_Cab(3)
{--
 - Select assignment for one block
 -}
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[0]) DO User_Select_Block_Cab_Assignment(0)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[1]) DO User_Select_Block_Cab_Assignment(1)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[2]) DO User_Select_Block_Cab_Assignment(2)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[3]) DO User_Select_Block_Cab_Assignment(3)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[4]) DO User_Select_Block_Cab_Assignment(4)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[5]) DO User_Select_Block_Cab_Assignment(5)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[6]) DO User_Select_Block_Cab_Assignment(6)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[7]) DO User_Select_Block_Cab_Assignment(7)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[8]) DO User_Select_Block_Cab_Assignment(8)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[9]) DO User_Select_Block_Cab_Assignment(9)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[10]) DO User_Select_Block_Cab_Assignment(10)
    WHEN $LEFTMOUSE = (PANEL_1_BLOCK_LABELS[11]) DO User_Select_Block_Cab_Assignment(11)

{--
 - Block detection
 -}
    WHEN Block_01_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(0)
    WHEN Block_02_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(1)
    WHEN Block_03_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(2)
    WHEN Block_04_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(3)
    WHEN Block_05_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(4)
    WHEN Block_06_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(5)
    WHEN Block_07_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(6)
    WHEN Block_08_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(7)
    WHEN Block_09_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(8)
    WHEN Block_10_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(9)
    WHEN Block_11_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(10)
    WHEN Block_12_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(11)
    WHEN Block_13_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(12)
    WHEN Block_14_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(13)
'    WHEN Block_15_East_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_East(14)

    WHEN Block_01_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(0)
    WHEN Block_02_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(1)
    WHEN Block_03_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(2)
    WHEN Block_04_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(3)
    WHEN Block_05_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(4)
    WHEN Block_06_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(5)
    WHEN Block_07_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(6)
    WHEN Block_08_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(7)
    WHEN Block_09_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(8)
    WHEN Block_10_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(9)
    WHEN Block_11_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(10)
    WHEN Block_12_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(11)
    WHEN Block_13_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(12)
    WHEN Block_14_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(13)
'    WHEN Block_15_West_Sensor = BLOCK_DETECTOR_ACTIVITY_DETECTED DO Block_Triggered_West(14)

    WHEN Block_01_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_01_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(0)
    WHEN Block_02_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_02_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(1)
    WHEN Block_03_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_03_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(2)
    WHEN Block_04_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_04_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(3)
    WHEN Block_05_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_05_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(4)
    WHEN Block_06_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_06_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(5)
    WHEN Block_07_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_07_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(6)
    WHEN Block_08_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_08_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(7)
    WHEN Block_09_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_09_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(8)
    WHEN Block_10_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_10_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(9)
    WHEN Block_11_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_11_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(10)
    WHEN Block_12_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_12_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(11)
    WHEN Block_13_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_13_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(12)
    WHEN Block_14_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_14_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(13)
'    WHEN Block_15_East_Sensor = BLOCK_DETECTOR_NO_ACTIVITY, Block_15_West_Sensor = BLOCK_DETECTOR_NO_ACTIVITY DO Block_Stopped_Triggering(14)

{--
 - Precision Proximity Detectors
 -}
    ' Staging Front (Enola Siding)
    WHEN Staging_Front_Warning_Detector = ON DO $DRAW SPRITE(40, 31, 1) = SIG_ABSOLUTE_WEST IN RED
    WHEN Staging_Front_Warning_Detector = OFF DO $ERASE SPRITE (40, 31, 1)

    ' Staging Rear (Conway Siding)
    WHEN Staging_Rear_Warning_Detector = ON DO $DRAW SPRITE(40, 30, 1) = SIG_ABSOLUTE_WEST IN RED
    WHEN Staging_Rear_Warning_Detector = OFF DO $ERASE SPRITE (40, 30, 1)

    ' Bottom Island (Warwick)
    WHEN Bottom_Island_Warning_Detector = ON DO 
		$DRAW SPRITE(24, 20, 1) = SIG_ABSOLUTE_EAST IN RED
		$DRAW SPRITE(20, 33, 1) = SIG_ABSOLUTE_NORTH IN RED
    WHEN Bottom_Island_Warning_Detector = OFF DO 
		$ERASE SPRITE (24, 20, 1)
		$ERASE SPRITE (20, 33, 1)

    ' Yard Lead (Mifflin)
    WHEN Yard_Lead_Warning_Detector = ON DO $DRAW SPRITE(27, 29, 1) = SIG_ABSOLUTE_NORTH IN RED
    WHEN Yard_Lead_Warning_Detector = OFF DO $ERASE SPRITE (27, 29, 1)


    ''''' Sound Warnings
    
    'WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_SECONDARY AND, 
    ' Turnout_Statuses[17] = TURNOUT_DIRECTION_SECONDARY AND, 
    ' Block_08_West_Sensor=BLOCK_DETECTOR_ACTIVITY_DETECTED AND,
    ' Staging_Front_Warning_Detector = ON AND,
    ' Staging_Front_Danger_Detector = OFF DO
    '     $VOLUME1=100
    '     $SOUND1="Warning - Slow.wav" ' relative file path
 '        $SOUND1="C:\Program Files (x86)\CTI Electronics\Train Brain\Sounds\Warning - Slow.wav"
 '       $SOUND1="C:\Users\Marty Kroll\Desktop\Warning - Slow.wav" '' for Martys desktop computer
    '     $REPEAT

    'WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_PRIMARY OR, 
    ' Turnout_Statuses[17] = TURNOUT_DIRECTION_PRIMARY OR, 
    ' Block_08_West_Sensor=BLOCK_DETECTOR_NO_ACTIVITY OR, 
    ' Staging_Front_Warning_Detector = OFF OR,
    ' Staging_Front_Danger_Detector = ON DO
    '     $SOUND1=OFF

'    WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_SECONDARY AND, 
'     Turnout_Statuses[17] = TURNOUT_DIRECTION_SECONDARY AND, 
'     Block_08_West_Sensor=BLOCK_DETECTOR_ACTIVITY_DETECTED AND,
'     Staging_Front_Danger_Detector = ON DO
'         $VOLUME1=100
'         $SOUND1="Danger - End of Track.wav" ' relative file path
'         $SOUN12="C:\Program Files (x86)\CTI Electronics\Train Brain\Sounds\Danger - End of track.wav"
'         $SOUND1="C:\Users\Marty Kroll\Desktop\Danger - End of track.wav" '' for Martys desktop computer
'         $REPEAT

'    WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_PRIMARY OR, 
'     Turnout_Statuses[17] = TURNOUT_DIRECTION_PRIMARY OR,
'     Block_08_West_Sensor=BLOCK_DETECTOR_NO_ACTIVITY OR,  
'     Staging_Front_Danger_Detector = OFF DO
'         $SOUND1=OFF


    ' Conway Siding Duplicate coding from above 

    'WHEN Staging_Rear_Warning_Detector = ON DO $DRAW SPRITE(40, 30, 1) = SIG_ABSOLUTE_EAST IN RED
    'WHEN Staging_Rear_Warning_Detector = OFF DO $ERASE SPRITE (40, 30, 1)


 ''''' Sound Warnings
    
'    WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_SECONDARY AND, 
'     Turnout_Statuses[17] = TURNOUT_DIRECTION_PRIMARY AND,
'     Block_08_West_Sensor=BLOCK_DETECTOR_ACTIVITY_DETECTED AND, 
'     Staging_Rear_Warning_Detector = ON AND,
'     Staging_Rear_Danger_Detector = OFF DO
'         $VOLUME1=100
'         $SOUND1="Warning - Slow.wav" ' relative file path
 '        $SOUND1="C:\Program Files (x86)\CTI Electronics\Train Brain\Sounds\Warning - Slow.wav"
 '        $SOUND1="C:\Users\Marty\Desktop\Warning - Slow.wav" '' for Martys desktop computer
'         $REPEAT

'    WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_PRIMARY OR, 
'     Turnout_Statuses[17] = TURNOUT_DIRECTION_SECONDARY OR,
'     Block_08_West_Sensor=BLOCK_DETECTOR_NO_ACTIVITY OR,  
'     Staging_Rear_Warning_Detector = OFF OR,
'     Staging_Rear_Danger_Detector = ON DO
'         $SOUND1=OFF

'    WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_SECONDARY AND, 
'     Turnout_Statuses[17] = TURNOUT_DIRECTION_PRIMARY AND,
'     Block_08_West_Sensor=BLOCK_DETECTOR_ACTIVITY_DETECTED AND,  
'     Staging_Rear_Danger_Detector = ON DO
'         $VOLUME1=100
'         $SOUND1="Danger - End of Track.wav" ' relative file path
  '       $SOUND1="C:\Program Files (x86)\CTI Electronics\Train Brain\Sounds\Danger - End of track.wav"
  '       $SOUND1="C:\Users\Marty\Desktop\Danger - End of track.wav" '' for Martys desktop computer
'         $REPEAT

'    WHEN Turnout_Statuses[2] = TURNOUT_DIRECTION_PRIMARY OR, 
'     Turnout_Statuses[17] = TURNOUT_DIRECTION_SECONDARY OR,
'     Block_08_West_Sensor=BLOCK_DETECTOR_NO_ACTIVITY OR,  
'     Staging_Rear_Danger_Detector = OFF DO
'         $SOUND1=OFF
 
{--
 - Mainline Automation
 -}
    WHEN $COMMAND = "Toggle Mainline Automation" DO
        MAINLINE_AUTOMATION = MAINLINE_AUTOMATION ~
        $status = "Mainline Automation: @MAINLINE_AUTOMATION"

    {-- Block 1 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_05] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_01)
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_06] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_01)
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_08] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_01)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_05] = TURNOUT_DIRECTION_PRIMARY,
        AND TURNOUT_STATUSES[TURNOUT_06] = TURNOUT_DIRECTION_PRIMARY,
        AND TURNOUT_STATUSES[TURNOUT_08] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_01)

    {-- Block 3 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_09] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_03)
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_15] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_03)
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_10] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_03)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_09] = TURNOUT_DIRECTION_PRIMARY,
        AND TURNOUT_STATUSES[TURNOUT_15] = TURNOUT_DIRECTION_PRIMARY,
        AND TURNOUT_STATUSES[TURNOUT_10] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_03)

    {-- Block 4 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_11] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_04)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_11] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_04)

    {-- Block 5 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_12] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_05)
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_13] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_05)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_12] = TURNOUT_DIRECTION_PRIMARY,
        AND TURNOUT_STATUSES[TURNOUT_13] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_05)

    {-- Block 6 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_17] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_06)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_17] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_06)

    {-- Block 7 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_01] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_07)
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_04] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_07)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_01] = TURNOUT_DIRECTION_PRIMARY,
        AND TURNOUT_STATUSES[TURNOUT_04] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_07)

    {-- Block 8 --}
    WHEN MAINLINE_AUTOMATION = ON AND TURNOUT_STATUSES[TURNOUT_03] = TURNOUT_DIRECTION_SECONDARY DO Mainline_Hold_Invoked(BLOCK_08)

    WHEN MAINLINE_AUTOMATION = ON,
        AND TURNOUT_STATUSES[TURNOUT_03] = TURNOUT_DIRECTION_PRIMARY
    DO Mainline_Hold_Removed(BLOCK_08)

{--
 - Debugging
 -}
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_01] DO Block_Stopped_Triggering(Block_01)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_02] DO Block_Stopped_Triggering(Block_02)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_03] DO Block_Stopped_Triggering(Block_03)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_UNOCCUPIED[BLOCK_04] DO Block_Stopped_Triggering(Block_04)

    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_01]
    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_02]
    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_03]
    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_OCCUPIED[BLOCK_04]

    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_01] DO Block_Triggered_East(Block_01)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_02] DO Block_Triggered_East(Block_02)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_03] DO Block_Triggered_East(Block_03)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_EAST[BLOCK_04] DO Block_Triggered_East(Block_04)

    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_01] DO Block_Triggered_West(Block_01)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_02] DO Block_Triggered_West(Block_02)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_03] DO Block_Triggered_West(Block_03)
    WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_WEST[BLOCK_04] DO Block_Triggered_West(Block_04)

    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_MANUAL_HOLD[BLOCK_01]

    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_SYSTEM_HOLD[BLOCK_01]

    ' WHEN $LeftMouse = BLOCK_DEBUGGING_BLOCK_TOGGLE_MAINLINE_HOLD[BLOCK_01]

