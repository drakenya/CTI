

CONSTANTS:
    {--
     -  Turnouts
     -}
    NUM_TURNOUTS = 20

    TURNOUT_DIRECTION_PRIMARY = OFF
    TURNOUT_DIRECTION_SECONDARY = ON

    TURNOUT_TYPE_TORTOISE = 1
    TURNOUT_TYPE_ATLAS = 2

    {--
     - Blocks
     -}
    NUM_BLOCKS = 12

    POWER_OPTION_FIRST_CHOICE = OFF
    POWER_OPTION_SECOND_CHOICE = ON

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
    Block_08_East_Sensor 'TrainBrain 1, Port 1
    Block_08_West_Sensor 'TrainBrain 1, Port 2
    Block_01_East_Sensor 'TrainBrain 1, Port 3
    Block_01_West_Sensor 'TrainBrain 1, Port 4
CONTROLS:
    Block_08_Power_3or4 'TrainBrain 2, Port 1
    Block_01_Power_3or4 'TrainBrain 2, Port 2
    Block_05_Power_3or4 'TrainBrain 2, Port 3
    Block_09_Power_3or4 'TrainBrain 2, Port 4
SENSORS:
    Block_05_East_Sensor 'TrainBrain 2, Port 1
    Block_05_West_Sensor 'TrainBrain 2, Port 2
    Block_09_East_Sensor 'TrainBrain 2, Port 3
    Block_09_West_Sensor 'TrainBrain 2, Port 4
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
    Block_07_East_Sensor 'TrainBrain 1, Port 1
    Block_07_West_Sensor 'TrainBrain 1, Port 2
    Block_11_East_Sensor 'TrainBrain 1, Port 3
    Block_11_West_Sensor 'TrainBrain 1, Port 4
CONTROLS:
    Block_07_Power_3or4 'TrainBrain 2, Port 1
    Block_11_Power_3or4 'TrainBrain 2, Port 2
    Block_04_Power_3or4 'TrainBrain 2, Port 3
    Block_12_Power_3or4 'TrainBrain 2, Port 4
SENSORS:
    Block_04_East_Sensor 'TrainBrain 2, Port 1
    Block_04_West_Sensor 'TrainBrain 2, Port 2
    Block_12_East_Sensor 'TrainBrain 2, Port 3
    Block_12_West_Sensor 'TrainBrain 2, Port 4
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
 -  Tortoise, Board 2

 -  YardMaster 1 (16 control)
 -  Sentry 1 (16 sensor)
 -}
CONTROLS:
    Turnout_BB_Control 'YardMaster 1, Port 01
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
    Turnout_31_Control 'YardMaster 1, Port 12
    Turnout_11_Control 'YardMaster 1, Port 13
    Turnout_32_Control 'YardMaster 1, Port 14
    Turnout_25_Control 'YardMaster 1, Port 15
    Turnout_26_Control 'YardMaster 1, Port 16
SENSORS:
    Turnout_BB_Button_Sensor 'Sentry 1, Port 01
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
    Turnout_31_Button_Sensor 'Sentry 1, Port 12
    Turnout_11_Button_Sensor 'Sentry 1, Port 13
    Turnout_32_Button_Sensor 'Sentry 1, Port 14
    Turnout_25_Button_Sensor 'Sentry 1, Port 15
    Turnout_26_Button_Sensor 'Sentry 1, Port 16

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
    Block_02_East_Sensor 'TrainBrain 1, Port 1
    Block_02_West_Sensor 'TrainBrain 1, Port 2
    Block_06_East_Sensor 'TrainBrain 1, Port 3
    Block_06_West_Sensor 'TrainBrain 1, Port 4
CONTROLS:
    Block_02_Power_3or4 'TrainBrain 2, Port 1
    Block_06_Power_3or4 'TrainBrain 2, Port 2
    Block_10_Power_3or4 'TrainBrain 2, Port 3
    Block_03_Power_3or4 'TrainBrain 2, Port 4
SENSORS:
    Block_10_East_Sensor 'TrainBrain 2, Port 1
    Block_10_West_Sensor 'TrainBrain 2, Port 2
    Block_03_East_Sensor 'TrainBrain 2, Port 3
    Block_03_West_Sensor 'TrainBrain 2, Port 4
CONTROLS:
    Block_02_Power_12or34 'Dash-8 1, port 1
    Block_06_Power_12or34 'Dash-8 1, port 2
    Block_10_Power_12or34 'Dash-8 1, port 3
    Block_03_Power_12or34 'Dash-8 1, port 4
    Block_G1_Control_3 'Dash-8 1, port 5
    Block_G2_Control_3 'Dash-8 1, port 6
    Block_G3_Control_3 'Dash-8 1, port 7
    Block_G4_Control_3 'Dash-8 1, port 8

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


ACTIONS:

{-- TURNOUTS --}

SUB Redraw_Turnout(TurnoutIndex)
    $SWITCH(PANEL_1_TURNOUTS[TurnoutIndex]) = $SWITCH(PANEL_1_TURNOUTS[TurnoutIndex]) ~
ENDSUB

SUB ResetInit_Set_Turnout_Types()
    TURNOUT_TYPES[0] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[1] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[2] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[3] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[4] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[5] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[6] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[7] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[8] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[9] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[10] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[11] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[12] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[13] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[14] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[15] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[16] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[17] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[18] = TURNOUT_TYPE_ATLAS
    TURNOUT_TYPES[19] = TURNOUT_TYPE_ATLAS
    {
    TURNOUT_TYPES[20] = TURNOUT_TYPE_ATLAS
    TURNOUT_TYPES[21] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[22] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[23] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[24] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[25] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[26] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[27] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[28] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[29] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[30] = TURNOUT_TYPE_ATLAS
    TURNOUT_TYPES[31] = TURNOUT_TYPE_ATLAS
    TURNOUT_TYPES[32] = TURNOUT_TYPE_TORTOISE
    TURNOUT_TYPES[33] = TURNOUT_TYPE_TORTOISE
    }
ENDSUB

SUB ResetInit_Set_Turnout_Controls()
    TURNOUT_CONTROLS[0] = &Turnout_01_Control
    TURNOUT_CONTROLS[1] = &Turnout_02_Control
    TURNOUT_CONTROLS[2] = &Turnout_03_Control
    TURNOUT_CONTROLS[3] = &Turnout_04_Control
    TURNOUT_CONTROLS[4] = &Turnout_05_Control
    TURNOUT_CONTROLS[5] = &Turnout_06_Control
    TURNOUT_CONTROLS[6] = &Turnout_07_Control
    TURNOUT_CONTROLS[7] = &Turnout_08_Control
    TURNOUT_CONTROLS[8] = &Turnout_09_Control
    TURNOUT_CONTROLS[9] = &Turnout_10_Control
    TURNOUT_CONTROLS[10] = &Turnout_11_Control
    TURNOUT_CONTROLS[11] = &Turnout_12_Control
    TURNOUT_CONTROLS[12] = &Turnout_13_Control
    TURNOUT_CONTROLS[13] = &Turnout_14_Control
    TURNOUT_CONTROLS[14] = &Turnout_15_Control
    TURNOUT_CONTROLS[15] = &Turnout_16_Control
    TURNOUT_CONTROLS[16] = &Turnout_17_Control
    TURNOUT_CONTROLS[17] = &Turnout_18_Control
    TURNOUT_CONTROLS[18] = &Turnout_19_Control
    TURNOUT_CONTROLS[19] = &Turnout_20_Control
    {
    TURNOUT_CONTROLS[20] = &Turnout_21_Control
    TURNOUT_CONTROLS[21] = &Turnout_22_Control
    TURNOUT_CONTROLS[22] = &Turnout_23_Control
    TURNOUT_CONTROLS[23] = &Turnout_24_Control
    TURNOUT_CONTROLS[24] = &Turnout_25_Control
    TURNOUT_CONTROLS[25] = &Turnout_26_Control
    TURNOUT_CONTROLS[26] = &Turnout_27_Control
    TURNOUT_CONTROLS[27] = &Turnout_28_Control
    TURNOUT_CONTROLS[28] = &Turnout_29_Control
    TURNOUT_CONTROLS[29] = &Turnout_30_Control
    TURNOUT_CONTROLS[30] = &Turnout_31_Control
    TURNOUT_CONTROLS[31] = &Turnout_32_Control
    TURNOUT_CONTROLS[32] = &Turnout_33_Control
    TURNOUT_CONTROLS[33] = &Turnout_34_Control
    }

    ATLAS_PRIMARY_CONTROLS[18] = &Turnout_19_Primary_Control
    ATLAS_PRIMARY_CONTROLS[19] = &Turnout_20_Primary_Control
    {
    ATLAS_PRIMARY_CONTROLS[20] = &Turnout_21_Primary_Control
    ATLAS_PRIMARY_CONTROLS[30] = &Turnout_31_Primary_Control
    ATLAS_PRIMARY_CONTROLS[31] = &Turnout_32_Primary_Control
    }

    ATLAS_SECONDARY_CONTROLS[18] = &Turnout_19_Secondary_Control
    ATLAS_SECONDARY_CONTROLS[19] = &Turnout_20_Secondary_Control
    {
    ATLAS_SECONDARY_CONTROLS[20] = &Turnout_21_Secondary_Control
    ATLAS_SECONDARY_CONTROLS[30] = &Turnout_31_Secondary_Control
    ATLAS_SECONDARY_CONTROLS[31] = &Turnout_32_Secondary_Control
    }
ENDSUB

SUB ResetInit_Set_Turnouts_On_Panels()
    PANEL_1_TURNOUTS[0] = (27,28,1)
    PANEL_1_TURNOUTS[1] = (30,29,1)
    PANEL_1_TURNOUTS[2] = (43,32,1)
    PANEL_1_TURNOUTS[3] = (36,28,1)
    PANEL_1_TURNOUTS[4] = (3,7,1)
    PANEL_1_TURNOUTS[5] = (7,7,1)
    PANEL_1_TURNOUTS[6] = (7,8,1)
    PANEL_1_TURNOUTS[7] = (12,7,1)
    PANEL_1_TURNOUTS[8] = (27,8,1)
    PANEL_1_TURNOUTS[9] = (36,8,1)
    PANEL_1_TURNOUTS[10] = (44,9,1)
    PANEL_1_TURNOUTS[11] = (6,33,1)
    PANEL_1_TURNOUTS[12] = (9,33,1)
    PANEL_1_TURNOUTS[13] = (9,8,1)
    PANEL_1_TURNOUTS[14] = (33,8,1)
    PANEL_1_TURNOUTS[15] = (30,9,1)
    PANEL_1_TURNOUTS[16] = (20,32,1)
    PANEL_1_TURNOUTS[17] = (42,31,1)
    PANEL_1_TURNOUTS[18] = (5,32,1)
    PANEL_1_TURNOUTS[19] = (4,31,1)
    PANEL_1_TURNOUTS[20] = (10,32,1)
    {
    PANEL_1_TURNOUTS[21] = (5,18,1)
    PANEL_1_TURNOUTS[22] = (8,18,1)
    PANEL_1_TURNOUTS[23] = (8,19,1)
    PANEL_1_TURNOUTS[24] = (23,20,1)
    PANEL_1_TURNOUTS[25] = (22,19,1)
    PANEL_1_TURNOUTS[26] = (29,17,1)
    PANEL_1_TURNOUTS[27] = (31,19,1)
    PANEL_1_TURNOUTS[28] = (32,19,1)
    PANEL_1_TURNOUTS[29] = (33,19,1)
    PANEL_1_TURNOUTS[30] = (43,8,1)
    PANEL_1_TURNOUTS[31] = (41,8,1)
    PANEL_1_TURNOUTS[32] = (4,10,1)
    PANEL_1_TURNOUTS[33] = (3,9,1)
    }
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

SUB Redraw_Block_Power(BlockIndex)
ENDSUB

SUB ResetInit_Set_Block_Power_Controls()
    BLOCK_CONTROLS_1or2[0] = &Block_01_Power_1or2
    BLOCK_CONTROLS_1or2[1] = &Block_02_Power_1or2
    BLOCK_CONTROLS_1or2[2] = &Block_03_Power_1or2
    BLOCK_CONTROLS_1or2[3] = &Block_04_Power_1or2
    BLOCK_CONTROLS_1or2[4] = &Block_05_Power_1or2
    BLOCK_CONTROLS_1or2[5] = &Block_06_Power_1or2
    BLOCK_CONTROLS_1or2[6] = &Block_07_Power_1or2
    BLOCK_CONTROLS_1or2[7] = &Block_08_Power_1or2
    BLOCK_CONTROLS_1or2[8] = &Block_09_Power_1or2
    BLOCK_CONTROLS_1or2[9] = &Block_10_Power_1or2
    BLOCK_CONTROLS_1or2[10] = &Block_11_Power_1or2
    BLOCK_CONTROLS_1or2[11] = &Block_12_Power_1or2

    BLOCK_CONTROLS_3or4[0] = &Block_01_Power_3or4
    BLOCK_CONTROLS_3or4[1] = &Block_02_Power_3or4
    BLOCK_CONTROLS_3or4[2] = &Block_03_Power_3or4
    BLOCK_CONTROLS_3or4[3] = &Block_04_Power_3or4
    BLOCK_CONTROLS_3or4[4] = &Block_05_Power_3or4
    BLOCK_CONTROLS_3or4[5] = &Block_06_Power_3or4
    BLOCK_CONTROLS_3or4[6] = &Block_07_Power_3or4
    BLOCK_CONTROLS_3or4[7] = &Block_08_Power_3or4
    BLOCK_CONTROLS_3or4[8] = &Block_09_Power_3or4
    BLOCK_CONTROLS_3or4[9] = &Block_10_Power_3or4
    BLOCK_CONTROLS_3or4[10] = &Block_11_Power_3or4
    BLOCK_CONTROLS_3or4[11] = &Block_12_Power_3or4
    
    BLOCK_CONTROLS_12or34[0] = &Block_01_Power_12or34
    BLOCK_CONTROLS_12or34[1] = &Block_02_Power_12or34
    BLOCK_CONTROLS_12or34[2] = &Block_03_Power_12or34
    BLOCK_CONTROLS_12or34[3] = &Block_04_Power_12or34
    BLOCK_CONTROLS_12or34[4] = &Block_05_Power_12or34
    BLOCK_CONTROLS_12or34[5] = &Block_06_Power_12or34
    BLOCK_CONTROLS_12or34[6] = &Block_07_Power_12or34
    BLOCK_CONTROLS_12or34[7] = &Block_08_Power_12or34
    BLOCK_CONTROLS_12or34[8] = &Block_09_Power_12or34
    BLOCK_CONTROLS_12or34[9] = &Block_10_Power_12or34
    BLOCK_CONTROLS_12or34[10] = &Block_11_Power_12or34
    BLOCK_CONTROLS_12or34[11] = &Block_12_Power_12or34
ENDSUB

SUB Set_Block_Power_To_Cab(BlockIndex, CabIndex)
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

    Redraw_Block_Power(BlockIndex)
ENDSUB

SUB Set_All_Block_Power_To_Cab(CabIndex, {local} BlockIndex)
    BlockIndex = 0
    UNTIL BlockIndex >= NUM_BLOCKS QUICKLOOP
        Set_Block_Power_To_Cab(BlockIndex, CabIndex)

        BlockIndex = 1 +
    ENDLOOP
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

    ResetInit_Set_Block_Power_Controls()


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
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[24] OR Turnout_25_Button_Sensor = ON DO Throw_Turnout(24)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[25] OR Turnout_26_Button_Sensor = ON DO Throw_Turnout(25)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[26] OR Turnout_27_Button_Sensor = ON DO Throw_Turnout(26)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[27] OR Turnout_28_Button_Sensor = ON DO Throw_Turnout(27)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[28] OR Turnout_29_Button_Sensor = ON DO Throw_Turnout(28)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[29] OR Turnout_30_Button_Sensor = ON DO Throw_Turnout(29)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[30] OR Turnout_31_Button_Sensor = ON DO Throw_Turnout(30)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[31] OR Turnout_32_Button_Sensor = ON DO Throw_Turnout(31)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[32] OR Turnout_33_Button_Sensor = ON DO Throw_Turnout(32)
    WHEN $LEFTMOUSE = PANEL_1_TURNOUTS[33] OR Turnout_34_Button_Sensor = ON DO Throw_Turnout(33)
    }

{--
 - Quick commands for setting all blocks to a cab
 -}
    WHEN $COMMAND = "All Blocks, Cab 1" DO Set_All_Block_Power_To_Cab(0)
    WHEN $COMMAND = "All Blocks, Cab 2" DO Set_All_Block_Power_To_Cab(1)
    WHEN $COMMAND = "All Blocks, Cab 3" DO Set_All_Block_Power_To_Cab(2)
    WHEN $COMMAND = "All Blocks, Cab 4" DO Set_All_Block_Power_To_Cab(3)

