Variables:
	Switches[4]
	Starting[4]
	Switch_Block1_West
	Switch_Block1_East
	Switch_Block1_Yard
	Switch_Block2_Island
	Switch1,Switch2

Actions:

Sub Switch_Point (SwitchId, IsReset, Direction)
	If IsReset=True Then
		Direction=Starting[SwitchId]
		IsReset=False
	ElseIf $Switch(Switches[SwitchId])=True Then Direction=False
	Else Direction=True EndIf

	$Switch(Switches[SwitchId])=Direction
EndSub

Sub Initialize_All_Switches ()
	Switch_Block1_West=0
	Switch_Block1_East=1
	Switch_Block1_Yard=2
	Switch_Block2_Island=3

	Switches[Switch_Block1_West]=(47,6,1)
	Switches[Switch_Block1_East]=(15,14,1)
	Switches[Switch_Block1_Yard]=(19,12,1)
	Switches[Switch_Block2_Island]=(13,16,1)

	Starting[Switch_Block1_West]=Off
	Starting[Switch_Block1_East]=Off
	Starting[Switch_Block1_Yard]=Off
	Starting[Switch_Block2_Island]=Off
EndSub

Sub ResetAllSwitches (Index)
	Index=0
	Until Index=4 Loop
		Switch_Point(Index, True)
		Index =+
		EndLoop
EndSub

When $Reset = True Do	
'	Switch1= $&Switch(47,6,1)
	Switch1=(47,6,1)
	Switch2=(19,12,1)
	
	Initialize_All_Switches()
	ResetAllSwitches()
	

' When $LeftMouse=(45,6,1) Do
	

'When $LeftMouse=(47,6,1) Do
'	If $Switch(47,6,1)=On Then $Switch(47,6,1)=Off
'		Else $Switch(47,6,1)=On
'		EndIf

When $LeftMouse=Switches[Switch_Block1_West] Do
	Switch_Point(Switch_Block1_West)
When $LeftMouse=Switches[Switch_Block1_East] Do
	Switch_Point(Switch_Block1_East)
When $LeftMouse=Switches[Switch_Block1_Yard] Do
	Switch_Point(Switch_Block1_Yard)
When $LeftMouse=Switches[Switch_Block2_Island] Do
	Switch_Point(Switch_Block2_Island)

'When $LeftMouse=(Switch1) Do
'	Switch_Point($LeftMouse)
'When $LeftMouse=(Switch2) Do
'	Switch_Point($LeftMouse)

'When $LeftMouse=(15,14,1) Do
'	Switch_Point($LeftMouse)
