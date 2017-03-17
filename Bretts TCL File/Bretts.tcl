{-------------------------------------------------------------------------------------------------------------------------}
Sensors:	HH11,	HH12,	HH13,	HH14,	spare, spare, spare, spare, spare, spare, HH21, HH22, HH23, HH24, HH25, HH26, 
Signals:	LED1(2),	LED2(2),	spare, spare, spare, spare, spare, spare,	spare, spare, spare, spare, spare, spare,
Sensors:	S1#,	S2#,	S3#,	S4#,	S5#,	S81#,	S31#,	S30#,	S40#,	S41#,	S25#,  S70#,  S80#,  S71#,  S82*~,  S99*~,
		S10#,	S20#,	S90#,	S21#,	S22#,	S23#,	S50#,	S60#,	S34#,	S44#,	S32*~,  S42*~,  S96*~,  S11#,  S12#,  S83#,	
		S51#,	S52#,	S53#,	S72#,	S75#,	S55#,  S85#,  S86#,  S84#,  S93#,  S33*~,  S43*~,  S95*~, spare, spare, spare,

Constants: 	Reversed = on, 		Normal = off, 		Occupied = true, 		Vacant = false, 	
		Grey = $RGB_8F8F8F	Green = $RGB_FF00		Yellow = $RGB_FFFF	Blue = $RGB_FFFF00

Variables:	
B[100]	'Track Blocks	0=vacant, 	1=cleared up direction, 2=cleared down direction, 3=waiting to clear up, 
		'4=waiting to clear down, 	5 =waiting to cancel up direction, 	6 =waiting to cancel down direction, 		
		'10=occupied stationary, 	11=occupied up direction, 		12=occupied down direction
L[100]		'These Loco variables act like beacons to store the address of the loco currently occupying the block
Control[100]	'For Throat Blocks values are: 1 to 5. Platform Blocks are 1 to 15. 
Schedule[10]	'0=clockwise, 1=anticlockwise, 2=midland, 3-5=random, +10 for commuter, +20 to hold at next station
Mode[10]		'0 = automatic, 1 = manual
Speed[10]		'always equals the train's speed. These are used for displaying the speed as well as accurate braking
Index			'used for managing arrays outside of sub routines
B0			'a phantom variable that always equals 0 and used for passing blank parameters to sub routines

{Route Variables	0=idle, 1=set, 5=held until signal unlocked, 6=called by PC, 8=called manually}
{Block 83 Routes}	Midland_Junction	R848,	R849,	R884,	R984
{Block 75 Routes}	Summit_West		R751,	R752,	R753,	R754,	R175,	R275,	R375,	R475
{Block 85 Routes}	Summit_South	R185,	R285,	R385,	R186,	R286,	R386,	R851,	R852,	R853
{Block 95 Routes}	Midland_East	R951,	R952,	R195,	R295
{Block 96 Routes}	Midland_West	R961,	R962,	R196,	R296
{Block 70 Routes}	Upper_West_70	R701,	R702,	R703,	R170,	R270,	R370
{Block 80 Routes}	Upper_West_80	R801,	R802,	R180,	R280
{Block 21 Routes}	Upper_Yard		R14,	R41
{Block 50 Routes}	Upper_East_50	R501,	R502,	R503,	R150,	R250,	R350,	R602	R603,	R260,	R360
{Block 60 Routes}	Upper_East_60	R601,	R160
{Block 30 Routes}	Lower_West_30	R301,	R302,	R130,	R230
{Block 40 Routes}	Lower_West_40	R402,	R403,	R404,	R405,	R240,	R340,	R440,	R540,	R303,	R304,	R305,	R330,	R430,	R530
{Block 10 Routes}	Lower_East_10	R101,	R102,	R110,	R210
{Block 20 Routes}	Lower_East_20	R202,	R203,	R902,	R903,	R62,	R63,	R310, R103,	R410,	R510,	R220,	R320,	R420,	R520,	
{Block 90 Routes}	Lower_East_90	R104,	R105,	R204,	R205,	R904,	R905,	R64,	R65,	R290,	R390,	R490,	R590,	R26,	R36,
						R46,	R56		RoutePointer	
	
{Brake Ramp Variables}		Ramp1	Ramp2	Ramp3	Ramp4	Brake
{Base Tunnel Delay Timer}	DelayOn	Delay
{Handheld Variables}		Key11	Key12	Key13	Key14	Key21	Key22	Key23	Key24		RouteEntry	SignalEntry	HH[10]	
					
	

{@@@@@@@@@@@@@@@@@@@@@@@@  Sub Routines  @@@@@@@@@@@@@@@@@@@@@@@@@@@}

actions:

SUB ScheduleDisplay (index, coordinates, schedule)
	schedule = schedule[index]		'copy train's schedule to local variable, value is 0-5, 10-15, 20-25 or 30-35
	index = 50*, Index = 8175+,		'sets index = to address of the schedule display for this loco, (8225, 8275 etc.)
	If	schedule > 9	then	Until schedule < 10			'strip schedule down to a single digit number
					Loop	schedule = 10-	Endloop Endif	'value is now in the range 0-5
	If	schedule = 1	then	$signal (index) = "Y---Y---Y"		'if it is a Clockwise train set signal display
	ElseIf schedule = 0	then	$signal (index) = "---YYY---"		'ditto for other schedules
	ElseIf schedule > 2	then	$signal (index) = "---------"
	ElseIf schedule = 2	then	$signal (index) = "--Y-Y-Y--"	Endif	ENDSUB

SUB CallRoute (index, coordinates, Route1, Route2, Route3, Route4, loco, schedule, mode, value)
{When a train approaches a station this sub checks the home signal and requests a route into one of the platforms}
	Loco = L[index],	Loco = 2724-,	Loco = 13/,					'sets Loco = to loco # 	0,1,2,3,4,5, etc.
	Mode = Mode[loco]	 									'copy Train's mode to local variable
	If  	Mode = 1 or *Route1>0 or *Route2>0 or *Route3>0 or *Route4>0	'if train is a manual train or route 
	Then	Return	 Endif								'already set, return without setting a route
	Schedule = Schedule[loco], 	Until Schedule < 10				'set local variable = to train's schedule
						Loop	Schedule = 10-	Endloop		'and reduce to a single digit number
	If	Schedule > 2		Then 	Schedule = 3-	Endif			'further reduce Schedule to 0,1 or 2
	If $signal(coordinates)="RR"	Then 	Value=5	Else	Value=6 Endif	'if signal is locked set value to 5 else 6
	If index = 33 or index = 43	Then	If Schedule = 1 				'for anticlockwise trains on blocks 33 or 43
						Then 	Route3=&B0					'delete route3 as an option (B0 always = 0)
						Else	Route1=&B0	Endif				'otherwise delete route1 as an option
	ElseIf index = 31			Then 	If Schedule = 2				'if midland train on block 31
						Then	Route1 = &B0 	Endif Endif		'then delete route1 as an option
	*Route1=Value, *Route2=Value, *Route3=Value, *Route4=Value,			'set remaining routes to 3 or 5
	B0=0	   ENDSUB										'and reset B0 to ensure it always equals 0

SUB Platform (index, loco, block, platform, schedule, value, stopping, mode)
{as a train enters a platform this sub sets the platform's control variable to a value between 1 and 14. This value is then used to manage station stops and call the correct outgoing route once the train is ready to depart}
	Loco = L[index], Loco = 2724-, Loco = 13/,	'sets Loco = to loco #.  0,1,2,3,4,5, etc.
	Block = B[index]						'sets Block = to the value of this block (11 = up train, 12 = down)
	Platform = Control[index], 		'set platform to equal the block number of this platform (the control variable 
							'for Throat Blocks is equal to the platform number the points are set for)
	Platform = &Control[platform]				'then set platform = address for this platform's control variable.
	Schedule = Schedule[Loco] 				'copy Train's schedule to local variable
	Mode = Mode[Loco]						'copy Train's mode to local variable
	If 	Schedule > 19	Then	schedule[Loco]=20-,	'if train is to be held at the station reduce the schedule 
		ScheduleDisplay(Loco) 	Return Endif		'variable by 20, and redraw the schedule display. Then Return
	If	Schedule > 9	Then					'if the train is a stopping commuter train then
		If	Mode = 1	Then	*Platform = 10, Return	'if manual train set the platform's control variable to 10
		Else	Schedule = 10-,	Stopping = 1		'if auto train reduce schedule to <10 and set stopping = 1
	Else	Stopping = 0	Endif	Endif				'if the train is an express train set stopping = 0.
	If	Mode = 1		Then	Return Endif		'if this a manual train the sub can now end 
	If	Schedule > 2	Then	Schedule = 3- Endif	'if the schedule is >2 strip a further 3 off (now = 0, 1 or 2)
	If 	Schedule = 0	Then	Value = 1			'if clockwise train set value to 1
	Elseif Schedule = 1	Then					'if anticlockwise train
		If	index = 50 or index = 60			'then if train is on block 50 or 60
		Then 	Value = 2	Else	Value = 1	Endif		'set value = 2. For trains on any other block value = 1
	ElseIf Schedule = 2	Then					'if midland train
		If	index = 50 or index = 60			'then if train on block 50 or 60
		Then 	Value = 1	Else	Value = 2	Endif	Endif	'set value = 1. For trains on any other block value = 2
	If	Stopping = 1	Then 	Value = 10+		Endif	'if it is a stopping train increase Value by 10
	If	Block=12 or index=75 	Then	Value = 2+	Endif	'if it is a down train or train is on block 75 add another 2
	*Platform = Value, 				ENDSUB	'copy value to the control variable for this platform

SUB AutoRoute (coordinatesUp, coordinatesDn, Platform, Up1, Up2, Up3, Dn1, Dn2, Dn3, Dn4, value)	
{this sub requests the correct outgoing route when a train is ready to depart a station. The routes are chosen in response to the value of the Platform's Control Variable. It's values will be: 1 for an up train ready to depart on option1. 2 for an up train taking option2, 3 for a down train taking option1, and 4 for a down train taking option2.}
	If *Platform < 3	Then	If $signal(coordinatesUp) = "RR"	'if it is an up train then if the up signal is locked	
		Then	Value=5	Else	Value=6	Endif			'set value equal to 5. If not locked set value = to 6.
		If	*Up1>0 or *Up2>0 or *Up3>0	Then			'do nothing if an outgoing route is already set
		ElseIf *Platform=1						'if the train is to take option 1 
		Then	*Up1=Value	Else	*Up2=Value	Endif			'set route for option 1 = to value. Else set option 2 
	Else	If	$signal(coordinatesDn) = "RR"				'if it a down train and the signal is locked
		Then	Value=5	Else	Value=6	Endif			'set value equal to 5. If not locked set value = to 6.
		If	*Dn1>0 or *Dn2>0 or *Dn3>0 or *Dn4>0 Then		'do nothing as a route is already active
		ElseIf *Platform=3						'if the train is to take option 1 
		Then	*Dn1=Value	Else	*Dn2=Value	Endif	Endif		'set route for option 1. Else set option 2
	*Platform=0		ENDSUB						'then reset the platform's control variable to 0

SUB Random (Index, CoinToss, Schedule, Stopping)	
	Schedule = Schedule[index] 							'copy Train's schedule to local variable
	If	Schedule > 19	Then	Return					'if train is to be held at next station do nothing
	Elseif Schedule > 9	Then	Schedule = 10-,	Stopping = 1	'if it is a stopping train then set 'stopping' = 1
					Else	Stopping = 0	Endif			'and reduce schedule to a single digit number
	If	Schedule < 3	Then	Return		Endif			'if the train is not random (<3) then do nothing
	CoinToss = $Random, CoinToss = 10#,						'randomly pick a number from 0 to 9
		If	CoinToss > 6	Then	Schedule = 5			'if the toss is > 6 set it as Midland Random Train
		Elseif CoinToss > 2	Then	Schedule = 4			'if 3,4,5 or 6 set it as Anticlockwise Random
						Else 	Schedule = 3	Endif		'if 0,1 or 2 set it as a Midland Random Train
	If	Stopping = 1		Then	Schedule = 10+	Endif		'if it is a stopping train add 10 to the value
	Schedule[index] = Schedule					ENDSUB	'copy new value back to train's schedule variable

SUB AutoSet (Route, Block, Throat1, Throat2, Throat3, Alt1, Alt2, Alt3, Control, Platform, Locked)
{this sub checks the interlocking for all routes and sets them if possible.}
	Control = Control[Block]					'set Control = to the control variable for the 1st block
	Block = B[Block]							'set local Block = to this block (11 for up, 12 for down)
	If	*Route < 6		Then	Return	Endif		'if this route has not been called return.
	If	*Throat1<>Grey or Throat2<>0, *Throat2<>Grey	'This and the following line check that all conflicting  
		or Throat3<>0, *Throat3<>Grey				'routes are idle (grey). If any are active then
	Then	Locked = 1	Else	Locked = 0	Endif			'Locked is set to 1. If idle Locked is set to 0 
	If 	Alt1 = 0		Then					'if this is an outgoing route 
		If 	*Route = 6	Then					'and it has been called automatically then
			If 	Block = 0, 					'if the 1st block is idle, and the line is not cleared in 
				Control = 0, 				'the opposite direction (Control=0) and there are no 
				Locked = 0					'conflicting routes (Locked=0), then activate the route.  
			Then	*Route = 1	Endif		Return	'The sub now ends whether the route has been set or not
 		ElseIf	*Route = 8	Then				'else if this is a manual outgoing route, 
			If 	Control = 0, 				'if the line is not cleared in the opposite direction and
				Locked = 0					'there are no conflicting routes
			Then	*Route = 1					'then set the route
			Else	*Route = 0, $Status="Route Locked", 'otherwise cancel the request and return
				Endif Endif Return			
	ElseIf *Route = 6	Then						'this is an incoming auto route
		If 	Block = 0, Locked = 0				'if the platform is idle and there are no conflicting routes
		Then	*Route=1, *Alt1=0, *Alt2=0, *Alt3=0 Endif	'set this route and cancel any alternate routes 
	ElseIf Block>0, Block<10 or Locked=1  Then *Route=0	'else this must be a manual incoming route so check the block 
	Else	*Route = 1, 	Endif		ENDSUB		'is idle and set if possible. Block<10 allows the route to be 										'manually set for shunt trains even if the platform is occupied

SUB CancelUsedRoute (Start, End)
	Until Start = End			Loop
	Start = +,	If *Start = 1	Then	*Start = 0 	Endif	Endloop ENDSUB

SUB RouteBlock (RouteBlock, UpRoute, DnRoute)
	If 	*RouteBlock > 0	Then	Return						'if the block is occupied do nothing
	ElseIf *UpRoute = 1 	Then	Wait 0.1, *RouteBlock = 3			'if an up route set routeblock to 3
	ElseIf *DnRoute = 1 	Then	Wait 0.1, *RouteBlock = 4 Endif ENDSUB	'the wait time ensures switches operate first

SUB RightClickSignal (coordinates, Lamp, RouteBlock1, Route1, Route2, RouteBlock2, Route3, Route4, RouteBlock3, Route5)
	If	*Route1=1 or *Route2=1 	Then 	If *RouteBlock1<5		'if route 1 or 2 set and there is no train on the throat 
	Then	*RouteBlock1=0, *Route1 = 0, *Route2 = 0	Endif		'reset both routes and the throat block to 0.
	ElseIf *Route3=1 or *Route4=1 Then 	If *RouteBlock2<5		'if route 3 or 4 set and there is no train on the throat
	Then	*RouteBlock2=0, *Route3 = 0, *Route4 = 0	Endif		'reset both routes and the throat block to 0.
	ElseIf *Route5=1			Then 	If *RouteBlock3<5		'if route 5 is set and there is no train on the throat
	Then	*RouteBlock3=0, *Route5 = 0			Endif 	'reset both routes and the throat block to 0.
	Elseif $Signal(coordinates)="YR" or $Signal(coordinates)="RY"		'if the operator was setting a route 
	Then 	$Signal (coordinates)=Lamp							'then reset signal to it's normal idle state
	Elseif $Signal(coordinates)="RR" 	Then 	$Signal (coordinates)=Lamp	'if signal is locked (RR) reset it to idle
		If	*Route1=5	Then	*Route1=6	Endif					'and unlock any pending route by setting it
		If	*Route2=5	Then	*Route2=6	Endif					'from 5 to 6.
		If	*Route3=5	Then	*Route3=6	Endif
		If	*Route4=5	Then	*Route4=6	Endif
		If	*Route5=5	Then	*Route5=6	Endif
	Elseif $Signal (coordinates) = "R-" or $Signal (coordinates) = "-R"   	'if the signal is currently idle
	Then	$Signal (coordinates)="RR" 							'then lock it (RR)
		If	*Route1=6	Then	*Route1=5	Endif					'and lock any pending routes by changing
		If	*Route2=6	Then	*Route2=5	Endif					'them from 6 to 5.
		If	*Route3=6	Then	*Route3=5	Endif
		If	*Route4=6	Then	*Route4=5	Endif
		If	*Route5=6	Then	*Route5=5	Endif	Endif	ENDSUB

SUB Ramp (block)
	If 	ramp1=0 	then 	ramp1=block, 				'mark ramp1 busy and pass block number
	ElseIf ramp2=0 	then 	ramp2=block, 				
	ElseIf ramp3=0 	then 	ramp3=block, 				
	Else			 	ramp4=block, 	Endif	ENDSUB	

SUB AutoBrake (index, signal, signalDn, fast, slow, station, schedule, loco, block, green, speed)	
	Loco = L[index],	Loco = 2724-,		Loco = 13/,		'sets Loco = to loco #.  0,1,2,3,4,5, etc.
	Schedule = Schedule[Loco],			Green = 0		'copy Train's schedule to local variable
	block = B[index],	speed = speed[loco]				'copy value of the block to local variable
	If block = 12 	Then	signal = SignalDn		Endif		'use down signal if train travelling in down direction
	If $Signal (Signal) ="-G" or $Signal (Signal) ="G-"	Then 	Green = 1  	Endif
	If	Station = 0 Then 	If Green=1 	Then 	Return Endif	'if not at station and signal is green end the sub
	ElseIf Schedule < 10, 	Green=1	Then 	Return Endif	'return if express train at station and signal green.
	Index = L[index],	Index = 3+,						'set index = to the momentum address for this loco
	If	speed < 12		Then 	*Index = slow			'if speed is less than 12 apply 'slow' momentum
					Else	*index = fast,	Endif 	'otherwise apply 'fast' momentum
	Index = 1-,	*Index = on					ENDSUB	'set index = to brake for this loco and turn on.

SUB BrakeControl (beacon, momentum, device, index, coordinates)	
	Index = *beacon,	Index = 2724-,	Index = 13/,		'sets Index = to loco #.  0,1,2,3,4,5, etc.
	Coordinates=Index, Coordinates=50*, Coordinates=8171+		'value=8221, 8271, 8321 etc. (brake display coordinates)
	Index = *beacon,	Index = 3+,	*Index = momentum,		'point index to address of the momentum for this loco
	If	Device = 0	Then	$Signal (coordinates) = "x-",		'if brake released by PC then turn off bottom light only
	ElseIf Device = 1	Then	$Signal (coordinates) = "--",		'if brake released by HH then turn off both lights
	Else	$Signal (coordinates) = "RR",					'else if brake applied by HH turn both lights on
		Index = 1-,	*Index = on		Endif				'and apply the brake for this loco 
	If	$Signal (coordinates) = "--",					'if both lights are now off, 
	Then	Index = 1-, 	*Index = off	Endif	ENDSUB	'release the brakes of this loco

SUB MoveTrain (new, dn, up, newblock, upblock, dnblock, direction)
	direction = 0							'reset direction to 0
	newblock = &B[new]						'newblock points to the address of the new block. 
	upblock = &B[up] 							'upblock points to the address of the block on the up side. 
	dnblock = &B[dn]							'dnblock = the address of the block on the down side. 
	If	 *newblock > 4	then		Return		'sensor may have been turned on by dirty wheels
	ElseIf *upblock = 12	then	direction = 1				'train is moving down from the block on the up side 
	ElseIf *dnblock = 11	then	direction = 2				'train is moving up from the block on the down side
	ElseIf *upblock > 9	then	direction = 1				'train is moving down
	ElseIf *dnblock > 9	then	direction = 2	Endif			'train is moving up
	If	direction = 2	then	*newblock = 11, *dnblock = 5,		'mark new block 11 and old block 5 for an up train
						L[new] = L[dn], L[dn] = 0		'copy beacon to new beacon and erase old
	ElseIf direction = 1	then	*newblock = 12, *upblock = 6,		'mark new block 12 and old block 6 for a dn train
						L[new] = L[up], L[up] = 0		'copy beacon to new beacon and erase old
	Else	*newblock = 10				Endif	ENDSUB	'if no trains around set new block to 10 for a new train

SUB MoveTrainIR (dn, up, rescue, direction, upblock, dnblock)
	upblock = 	&B[up] 					'upblock points to the address of the block on the up side. 
	dnblock = 	&B[dn]					'dnblock points to the address of the block on the down side.
	rescue = 	&B[rescue]					'rescue = address of block at other end of the mainline 
	If	*upblock > 9								'if there is a train on the upblock 
	then	*dnblock=12, *upblock=6, L[dn]=L[up], L[up]=0			'move it to the dnblock
	ElseIf *dnblock > 9								'if there is a train on the dnblock 
	then	*upblock=11, *dnblock=5, L[up]=L[dn], L[dn]=0			'move it to the upblock			
	ElseIf *rescue > 9	then	If	direction = 1			'if there are no adjacent trains check the 
					then	*dnblock = 12, L[dn] = L[rescue]	'next block and move the train from there
					Else	*upblock = 11, L[up] = L[rescue]	Endif	
					*rescue = 0					Endif	ENDSUB
			
SUB MoveTrainThroat (new, track, platform, shunt, index, newblock, approach)
	newblock = &B[new]							'newblock points to the new block - the throat block. 
	approach = &B[track]							'approach points to the approach block
	platform = -,	platform = Control[new]+,			'platform = index # of platform turnouts are set for
	index = platform								'index equals the index number of correct platform
	platform = &B[platform]							'platform now points to the correct platform block
	shunt = -,	shunt = Control[new]+,	shunt = &L[shunt]		'shunt points to the correct shunt block
	If	*approach > 9	then	If *platform > 9			'if this is a shunt movement
		then	*newblock = 10,	*shunt = L[track]			'mark throat = 10 and copy loco to the shunt beacon
		Else	*newblock = *approach			Endif		'make throat block the same as approach and clear old
			*approach = 5, L[new] = L[track], L[track] = 0	'copy approach beacon to new and cancel the old beacon
	ElseIf *platform > 9	then	*newblock = *platform,		'otherwise move the train from the platform but if 
		If 	*shunt > 0	then	L[new] = *shunt, *shunt = 0	'there is a loco on the shunt block move it.
		else	L[new] = L[index], L[index] = 0, *platform = 6	Endif	
	Else	B[new] = 10		Endif						'if no trains around mark the block = 10 for a new train
	Control[new] = index	ENDSUB					'set throat's control var.=to the index # of the platform

SUB MoveTrainPlat (platform, A, B, C, D, check, block, throat)
	check = &B[platform],	block = &B[A], 	throat = &Control[A],	
	If 	*check > 4		then Return		 	Endif		'dirty wheels may have turned on the sensor
	If	*block > 9,		*throat=platform 		Then		'if A is occupied and points set for this platform then
		B[platform]=11,	L[platform] = L[A], 			'move train from blockA to this platform - up train
		L[A] = 0, 		B[A] = 5,   	  	Return
	Else	block = &B[B], 	throat = &Control[B]	Endif
	If	*block > 9,		*throat=platform		Then		'if B is occupied and points set for this platform then
		B[platform]=11,	L[platform] = L[B], 			'move train from blockB to this platform - up train
		L[B] = 0,		B[B] = 5, 			Return
	Else	block = &B[C], 	throat = &Control[C]	Endif
	If	*block > 9,  	*throat = platform	then		'if C is occupied and points set for this platform
		B[platform]=12, 	L[platform] = L[C],			'move train from blockC to this platform - down train
		L[C] = 0,		B[C] = 6,    		Return
	Else	block = &B[D], 	throat = &Control[D]	Endif
	If	*block > 9,  	*throat = platform	then		'if D is occupied and points set for this platform
		B[platform] = 12,	L[platform] = L[D],			'move train from blockD to this platform - down train
		L[D] = 0,		B[D] = 6,    		Return
	Else	B[platform] = 10				Endif	ENDSUB	'otherwise mark block = 10 for a new train
	
SUB ClearBlock (block)	block = &B[block]	If	*block = 5 or 	*block = 6	then	*block = 0	Endif	ENDSUB
SUB ClearThroat (block)	block = &B[block]	If	*block < 11, 	*block > 4	then	*block = 0	Endif	ENDSUB

SUB Draw (index, facing, coordinates, display, schedule, block, loco, spiral)
	block = &B[index],  loco = L[index],  loco = 2724-,  loco = 13/,		'sets loco = to loco #.  0,1,2,3,4,5, etc.
	If		loco = 1		Then 	$draw picture (coordinates) = "C:\Program Files\TBrain\V100a.jpg",
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\V100b.jpg",
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\V100c.jpg",	
	ElseIf	loco = 4		Then 	$draw picture (coordinates) = "C:\Program Files\TBrain\Re44a.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Re44b.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Re44c.jpg"
	ElseIf	loco = 5		Then 	$draw picture (coordinates) = "C:\Program Files\TBrain\DB101a.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\DB101b.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\DB101c.jpg"	
	ElseIf	loco = 7		Then 	$draw picture (coordinates) = "C:\Program Files\TBrain\W740a.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\W740b.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\W740c.jpg"		
	ElseIf	loco = 3		Then	If *block=12, facing=0 or *block=11, facing=1
						Then 	$draw picture (coordinates) = "C:\Program Files\TBrain\Class03righta.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Class03rightb.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Class03rightc.jpg"
						Else	$draw picture (coordinates) = "C:\Program Files\TBrain\Class03a.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Class03b.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Class03c.jpg"	Endif	
	Else						$draw picture (coordinates) = "C:\Program Files\TBrain\Wagonsa.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Wagonsb.jpg"
		coordinates = +,			$draw picture (coordinates) = "C:\Program Files\TBrain\Wagonsc.jpg" 	Endif 
	Schedule = 	Schedule[loco] 								'copy Train's schedule to local variable
	If	schedule > 9	Then	Until	schedule < 10			'strip schedule down to a single digit number
					Loop	schedule = 10-	Endloop Endif	'to make it easier
	If	schedule > 2	Then	schedule = 3-		Endif		'reduces schedule to 0, 1, 2 depending on route.
	If	*block =  11	Then							'if an up train	
		If 	Facing = 1	Then	coordinates = 3-	Else coordinates = +  Endif	'set coordinates for the up schedule
	Else	If	Facing = 0	Then	coordinates = 3-	Else coordinates = +  Endif Endif	'set coord. for down schedule
	If 	schedule=0		Then	$draw picture (coordinates) = "C:\Program Files\TBrain\70.jpg",	'clockwise train
	ElseIf schedule = 1 	Then 	$draw picture (coordinates) = "C:\Program Files\TBrain\80.jpg",	'anticlockwise train
	Else					$draw picture (coordinates) = "C:\Program Files\TBrain\99.jpg",	Endif	'midlandtrain
	ENDSUB

SUB Erase (coordinates, count)		
	count = 0,	Until count > 4,	Loop	$erase smallpicture (coordinates), coordinates = +,	count = +,	Endloop ENDSUB

SUB AssignTrain (index, coordinates, beacon, block)
	beacon = &L[index]	block = &B[index]				
	Wait until $QueryBusy = false	Then
	$Query"1$Which train do you want to assign?$cancel request$empty wagons$V100$Steam$Re44$DB101$Track Machine" 
	Wait until $QueryBusy = false 		Then 
		If 	$QueryResponse = 0 	then	Return
		ElseIf 	$QueryResponse = 1 	then	*beacon = &wagons			
		ElseIf 	$QueryResponse = 2 	then	*beacon = &V100	
		ElseIf 	$QueryResponse = 3 	then	*beacon = &Steam		
		ElseIf 	$QueryResponse = 4 	then	*beacon = &Re44		
		ElseIf 	$QueryResponse = 5 	then	*beacon = &DB101		
		ElseIf	$QueryResponse = 6	then	*beacon = &W740				Endif	
	If	*Block > 9				then	Draw (index, 0, coordinates, 0) 	
							else	*block = 10					Endif	ENDSUB		

SUB Direction (index, coordinates, schedule, flash)
	If *index > 2720								'if this sub has been called by a HandHeld controller 
	Then	index = *index, index = 2724-, index = 13/, Endif	'convert index from CTI address to loco # (0,1,2,3 etc.)
	Coordinates = index, Coordinates=50*, Coordinates=8172+,	'sets coordinates = to address of the direction display 
											'for this loco (8222, 8272 etc.)
	Index = 13*,	Index = 2724+,	Index = +			'sets Index to the CTI address of this loco's direction
	If *Index = 0	Then	*Index = 1, Flash=0, Until Flash=2	'if loco is currently forward change to rev and flash	
		Loop	$erase sprite(coordinates) Wait 0.3			'arrow symbol 3 times then leave arrow on
			$Draw Sprite(coordinates) = Arrow_West in Yellow   
			Wait 0.3	Flash = +	Endloop
	Else				*Index = 0,	Flash=0, Until Flash=2	'else if loco currently reversed change direction and 
		Loop	$erase sprite(coordinates) Wait 0.3			'flash arrow symbol again before leaving on
			$Draw Sprite(coordinates) = Arrow_East in White   
			Wait 0.3	Flash = +	Endloop	Endif	ENDSUB

SUB Mode (index, coordinates, mode, grid)
	mode = mode[index]				'copy current mode to local variable. 0=auto, 1=manual route setting
	grid = index,	grid = 50*,	coordinates =  &(37,12,1),	coordinates = grid+
								'points coordinates to the grid square for this loco's Mode display
	If mode = 1 then	mode[index] = 0,  $color track (coordinates) = Green,				'change to auto train
	Else 		 	mode[index] = 1,  $color track (coordinates) = Yellow	Endif ENDSUB	'change to manual mode

SUB Schedule (index, schedule, stopping)
	schedule = schedule[index]		'copy train's schedule to local variable, value is 0-5, 10-15, 20-25 or 30-35
	If 	schedule > 9		then 	stopping = 1,				'set 'stopping' = to 1 for stopping trains
		Until schedule < 10	Loop	schedule = 10-	Endloop  Endif	'value now 0-5
	If 	schedule = 0		then	schedule[index] = 1,			'if the schedule is currently 0 change to 1
	ElseIf 	schedule > 2	then	schedule[index] = 0,			'if it is currently random (>2) set to 0	
	ElseIf 	schedule = 2	then	schedule[index] = 3, Random(index)	'the random sub is called to choose the route
	ElseIf 	schedule = 1	then	schedule[index] = 2,	Endif		'if it is currently 1 change to 2		
	If	stopping = 1		then	schedule[index] = 10+,			'if it is a stopping train add 10 to the 
						stopping = 0, 			Endif		'train's schedule and reset 'stopping' to 0
	ScheduleDisplay (index)							ENDSUB	'ScheduleDisplay redraws the schedule display

SUB Hold (index, coordinates, schedule)
	schedule = schedule[index] 						'copy this train's schedule to the local variable
	Coordinates = index,  Coordinates=50*, Coordinates=8175+,	'sets coordinates = to address of the schedule display 
											'for this loco (8225, 8275 etc.)
	If schedule < 20	Then	schedule[index] = 20+,			'add 20 to the train's schedule 
					$signal(coordinates) = "wwwwwwwww"	'and set the schedule display to show all lights white
	Else				schedule[index] = 20-,			'else if the train is already set to be held take 20 off 
					ScheduleDisplay(index) Endif ENDSUB	'and call ScheduleDisplay to redraw the schedule	

SUB Handheld ()
{The code for this sub is included with the installation instructions for the handsets. The handsets provide walk around driving control for trains as well as operating signals, turnouts, route control and other customisable features. (See the Handsets page of my website www.users.tpg.com.au/bsken for more info)}
ENDSUB									

SUB OnboardSignal(Beacon, Up, Down, LED)
{This sub drives the bicolour LED on my handsets to show the driver the state of the next signal along the line. The code for this sub also comes with the installation pack for the handheld controllers.}
ENDSUB




{Section 2	@@@@@@@@@@@@@@@@@@@  Manual Route Setting by Keyboard  @@@@@@@@@@@@@@@@@@}
{This section sets each route variable equal to 8 if it is manually called by keyboard commands or via one of the handhled controllers. Enter 1 line for each route. If you are not using handheld controllers you can leave out the 'or RouteEntry=175' clause} 
When $command = 175	or	RouteEntry = 175	Do 	R175=8			
When $command = 275	or	RouteEntry = 275	Do 	R275=8		
When $command = 375	or	RouteEntry = 375	Do 	R375=8			
When $command = 185	or	RouteEntry = 185	Do 	R185=8			
When $command = 285	or	RouteEntry = 285	Do 	R285=8			
When $command = 385	or	RouteEntry = 385	Do 	R385=8
When $command = 751	or	RouteEntry = 751	Do 	R751=8 			
When $command = 752	or	RouteEntry = 752	Do 	R752=8			
When $command = 753	or	RouteEntry = 753	Do 	R753=8			
When $command = 851	or	RouteEntry = 851	Do 	R851=8 		
When $command = 852	or	RouteEntry = 852	Do 	R852=8			
When $command = 853	or	RouteEntry = 853	Do 	R853=8	
When $command = 848	or	RouteEntry = 848	Do 	R848=8			
When $command = 849	or	RouteEntry = 849	Do 	R849=8			
When $command = 884	or	RouteEntry = 884	Do 	R884=8			
When $command = 984	or	RouteEntry = 984	Do 	R984=8			
When $command = 196	or	RouteEntry = 196	Do 	R196=8			
When $command = 296	or	RouteEntry = 296	Do 	R296=8	
When $command = 961	or	RouteEntry = 961	Do 	R961=8			
When $command = 962	or	RouteEntry = 962	Do 	R962=8			
When $command = 195	or	RouteEntry = 195	Do 	R195=8			
When $command = 295	or	RouteEntry = 295	Do 	R295=8
When $command = 951	or	RouteEntry = 951	Do 	R951=8			
When $command = 952	or	RouteEntry = 952	Do 	R952=8	
When $command = 801	or	RouteEntry = 801	Do 	R801=8			
When $command = 802	or	RouteEntry = 802	Do 	R802=8			
When $command = 703	or	RouteEntry = 703	Do 	R703=8 			
When $command = 702	or	RouteEntry = 702	Do 	R702=8			
When $command = 701	or	RouteEntry = 701	Do	R701=8
When $command = 180	or	RouteEntry = 180	Do 	R180=8	
When $command = 280	or	RouteEntry = 280	Do 	R280=8			
When $command = 170	or	RouteEntry = 170	Do 	R170=8			
When $command = 270	or	RouteEntry = 270	Do 	R270=8			
When $command = 370	or	RouteEntry = 370	Do 	R370=8			
When $command = 160	or	RouteEntry = 160	Do 	R160=8			
When $command = 150	or	RouteEntry = 150	Do 	R150=8	
When $command = 260	or	RouteEntry = 260	Do 	R260=8			
When $command = 250	or	RouteEntry = 250	Do 	R250=8			
When $command = 360	or	RouteEntry = 360	Do 	R360=8			
When $command = 350	or	RouteEntry = 350	Do 	R350=8			
When $command = 502	or	RouteEntry = 502	Do 	R502=8			
When $command = 503	or	RouteEntry = 503	Do 	R503=8	
When $command = 501	or	RouteEntry = 501	Do 	R501=8			
When $command = 602	or	RouteEntry = 602	Do 	R602=8			
When $command = 603	or	RouteEntry = 603	Do 	R603=8			
When $command = 601	or	RouteEntry = 601	Do 	R601=8			
When $command = 302	or	RouteEntry = 302	Do 	R302=8			
When $command = 301	or	RouteEntry = 301	Do 	R301=8	
When $command = 303	or	RouteEntry = 303	Do 	R303=8			
When $command = 304	or	RouteEntry = 304	Do 	R304=8			
When $command = 305	or	RouteEntry = 305	Do 	R305=8			
When $command = 403	or	RouteEntry = 403	Do 	R403=8			
When $command = 404	or	RouteEntry = 404	Do 	R404=8			
When $command = 402	or	RouteEntry = 402	Do 	R402=8	
When $command = 405	or	RouteEntry = 405	Do 	R405=8			
When $command = 101	or	RouteEntry = 101	Do 	R101=8			
When $command = 102	or	RouteEntry = 102	Do 	R102=8			
When $command = 103	or	RouteEntry = 103	Do 	R103=8			
When $command = 104	or	RouteEntry = 104	Do 	R104=8			
When $command = 105	or	RouteEntry = 105	Do 	R105=8	
When $command = 202	or	RouteEntry = 202	Do 	R202=8			
When $command = 203	or	RouteEntry = 203	Do 	R203=8			
When $command = 204	or	RouteEntry = 204	Do 	R204=8			
When $command = 205	or	RouteEntry = 205	Do 	R205=8			
When $command = 902	or	RouteEntry = 902	Do 	R902=8			
When $command = 904	or	RouteEntry = 904	Do 	R904=8
When $command = 905	or	RouteEntry = 905	Do 	R905=8			
When $command = 903	or	RouteEntry = 903	Do 	R903=8			
When $command = 130	or	RouteEntry = 130	Do 	R130=8			
When $command = 230	or	RouteEntry = 230	Do 	R230=8			
When $command = 330	or	RouteEntry = 330	Do 	R330=8			
When $command = 430	or	RouteEntry = 430	Do 	R430=8	
When $command = 530	or	RouteEntry = 530	Do 	R530=8			
When $command = 240	or	RouteEntry = 240	Do 	R240=8			
When $command = 340	or	RouteEntry = 340	Do 	R340=8			
When $command = 440	or	RouteEntry = 440	Do 	R440=8			
When $command = 540	or	RouteEntry = 540	Do 	R540=8			
When $command = 110	or	RouteEntry = 110	Do 	R110=8	
When $command = 210	or	RouteEntry = 210	Do 	R210=8			
When $command = 310	or	RouteEntry = 310	Do 	R310=8			
When $command = 410	or	RouteEntry = 410	Do 	R410=8			
When $command = 510	or	RouteEntry = 510	Do 	R510=8			
When $command = 220	or	RouteEntry = 220	Do 	R220=8			
When $command = 320	or	RouteEntry = 320	Do 	R320=8	
When $command = 420	or	RouteEntry = 420	Do 	R420=8			
When $command = 520	or	RouteEntry = 520 	Do	R520=8 			
When $command = 290	or	RouteEntry = 290	Do 	R290=8			
When $command = 390	or	RouteEntry = 390	Do 	R390=8			
When $command = 490	or	RouteEntry = 490	Do 	R490=8			
When $command = 590	or	RouteEntry = 590	Do 	R590=8	
When $command = 62	or	RouteEntry = 62	Do 	R62=8			
When $command = 63	or	RouteEntry = 63	Do 	R63=8			
When $command = 64	or	RouteEntry = 64	Do 	R64=8				
When $command = 65	or	RouteEntry = 65	Do 	R65=8			
When $command = 26	or	RouteEntry = 26	Do 	R26=8				
When $command = 36	or	RouteEntry = 36	Do 	R36=8	
When $command = 46	or	RouteEntry = 46	Do	R46=8				
When $command = 56	or	RouteEntry = 56	Do 	R56=8		
When $command = 14	or	RouteEntry = 14	Do 	R14=8				
When $command = 41	or	RouteEntry = 41	Do 	R41=8	
When $command = 754	or	RouteEntry = 754	Do 	R754=8			
When $command = 475	or	RouteEntry = 475	Do 	R475=8		



{Section 3	@@@@@@@@@@@@@@@@ ManualRoute Setting by Mouse Click  @@@@@@@@@@@@@@@@@@@@@}
{This section sets routes equal to 8 if manually called my clicking on signals on the CTC screen}
When $Left_Mouse = {Sig84} (22,4,1)		Do If		$Signal {8} (13,3,1) = "RY"		Then	R884=8	
							ElseIf	$Signal {9} (13,4,1) = "RY"		Then	R984=8	
							Else 		$Signal {84} (22,4,1) = "YR"					Endif
When $Left_Mouse = {Sig8} (13,3,1)		Do If		$Signal {84} (22,4,1) = "YR"		Then	R848=8
							Else 		$Signal {8} (13,3,1) = "RY"					Endif
When $Left_Mouse = {Sig9} (13,4,1)		Do If		$Signal {84} (22,4,1) = "YR"		Then	R849=8	
							Else 		$Signal {9} (13,4,1) = "RY"					Endif
When $Left_Mouse = {Sig96} (13,7,1)		Do If 	$Signal {81} (16,7,1) = "YR"		Then	R196=8 
							ElseIf	$Signal {82} (16,8,1) = "YR"		Then	R296=8	
							Else 		$Signal {96} (13,7,1) = "RY"					Endif
When $Left_Mouse = {Sig93} (16,7,1)		Do If		$Signal {96} (13,7,1) = "RY"		Then	R961=8	
							Else 		$Signal {93} (16,7,1) = "YR"					Endif
When $Left_Mouse = {Sig94} (16,8,1)		Do If		$Signal {96} (13,7,1) = "RY"		Then	R962=8		
							Else 		$Signal {94} (16,8,1) = "YR"					Endif
When $Left_Mouse = {Sig95} (24,9,1)		Do If		$Signal {91} (21,7,1) = "RY"		Then	R195=8	
							ElseIf	$Signal {92} (21,8,1) = "RY"		Then	R295=8
							Else 		$Signal {95} (24,9,1) = "YR"					Endif
When $Left_Mouse = {Sig 91} (21,7,1)	Do If		$Signal {95} (24,9,1) = "YR"		Then	R951=8
							Else 		$Signal {91} (21,7,1) = "RY"					Endif
When $Left_Mouse = {Sig 92} (21,8,1)	Do If		$Signal {95} (24,9,1) = "YR"		Then	R952=8	
							Else 		$Signal {92} (21,8,1) = "RY"					Endif
When $Left_Mouse = {Sig75} (21,1,1)		Do If 	$Signal {51} (25,1,1) = "YR"		Then	R175=8 
							ElseIf	$Signal {52} (25,2,1) = "YR"		Then	R275=8
							ElseIf	$Signal {53} (25,3,1) = "YR"		Then	R375=8
							ElseIf	$Signal {54} (26,4,1) = "YR"		Then	R475=8	
							Else 		$Signal {75} (21,1,1) = "RY"					Endif
When $Left_Mouse = {Sig 51} (25,1,1)	Do If		$Signal {75} (21,1,1) = "RY"		Then	R751=8	
							Else 		$Signal {51} (25,1,1) = "YR"					Endif
When $Left_Mouse = {Sig 52} (25,2,1)	Do If		$Signal {75} (21,1,1) = "RY"		Then	R752=8	
							Else 		$Signal {52} (25,2,1) = "YR"					Endif
When $Left_Mouse = {Sig 53} (25,3,1)	Do If		$Signal {75} (21,1,1) = "RY"		Then	R753=8	
							Else 		$Signal {53} (25,3,1) = "YR"					Endif
When $Left_Mouse = {Sig 54} (26,4,1)	Do If		$Signal {75} (21,1,1) = "RY"		Then	R754=8	
							Else 		$Signal {54} (26,4,1) = "YR"					Endif
When $Left_Mouse = {Sig85} (35,3,1)		Do If		$Signal {55} (30,1,1) = "RY"		Then	R185=8	
							ElseIf	$Signal {56} (30,2,1) = "RY"		Then	R285=8	
							ElseIf	$Signal {57} (30,3,1) = "RY"		Then	R385=8		
							Else 		$Signal {85} (35,3,1) = "YR"					Endif
When $Left_Mouse = {Sig S55} (30,1,1)	Do If		$Signal {85} (35,3,1) = "YR"		Then	R851=8
							Else 		$Signal {55} (30,1,1) = "RY"					Endif
When $Left_Mouse = {Sig S56} (30,2,1)	Do If		$Signal {85} (35,3,1) = "YR"		Then	R852=8	
							Else 		$Signal {56} (30,2,1) = "RY"					Endif
When $Left_Mouse = {Sig S57} (30,3,1)	Do If		$Signal {85} (35,3,1) = "YR"		Then	R853=8	
							Else 		$Signal {57} (30,3,1) = "RY"					Endif
When $Left_Mouse = {Sig70} (1,8,1)		Do If 	$Signal {25} (7,10,1) = "YR"		Then	R170=8 
							ElseIf	$Signal {26} (7,11,1) = "YR"		Then	R270=8
							ElseIf	$Signal {27} (7,12,1) = "YR"		Then	R370=8	
							Else 		$Signal {70} (1,8,1) = "RY"					Endif
When $Left_Mouse = {Sig80} (2,8,1)		Do If 	$Signal {25} (7,10,1) = "YR"		Then	R180=8 
							ElseIf	$Signal {26} (7,11,1) = "YR"		Then	R280=8
							Else 		$Signal {80} (2,8,1) = "RY"					Endif
When $Left_Mouse = {Sig25} (7,10,1)		Do If		$Signal {70} (1,8,1) = "RY"		Then	R701=8		
							Elseif	$Signal {80} (2,8,1) = "RY"		Then	R801=8		
							Else 		$Signal {25} (7,10,1) = "YR"					Endif
When $Left_Mouse = {Sig26} (7,11,1)		Do If		$Signal {70} (1,8,1) = "RY"		Then	R702=8		
							Elseif	$Signal {80} (2,8,1) = "RY"		Then	R802=8		
							Else 		$Signal {26} (7,11,1) = "YR"					Endif
When $Left_Mouse = {Sig27} (7,12,1)		Do If		$Signal {70} (1,8,1) = "RY"		Then	R703=8	
							Else 		$Signal {27} (7,12,1) = "YR"					Endif
When $Left_Mouse = {Sig 24} (7,9,1)		Do If		B[24] < 10	Then	R14 = 8	
							Else					R41 = 8					Endif
{signal 24 controls routes from the yard at Upper Junction into Platform 1. At this location we want to set the route as soon as the signal is clicked on as there is no 2nd signal here. So if there is no train currently in the yard (B[24]<10) then we set the route into the yard (R14=8) else if there is already a train in the yard (B[24]>9) then we set the outgoing route R41=8.}  
When $Left_Mouse = {Sig50} (19,11,1)	Do If 	$Signal {21} (13,10,1) = "RY"		Then	R150=8 
							ElseIf	$Signal {22} (13,11,1) = "RY"		Then	R250=8
							ElseIf	$Signal {23} (13,12,1) = "RY"		Then	R350=8	
							Else 		$Signal {50} (19,11,1) = "YR"					Endif
When $Left_Mouse = {Sig60} (19,10,1)	Do If 	$Signal {21} (13,10,1) = "RY"		Then	R160=8 
							ElseIf	$Signal {22} (13,11,1) = "RY"		Then	R260=8	
							ElseIf	$Signal {23} (13,12,1) = "RY"		Then	R360=8	
							Else 		$Signal {60} (19,10,1) = "YR"					Endif
When $Left_Mouse = {Sig21} (13,10,1)	Do If		$Signal {50} (19,11,1) = "YR"		Then	R501=8		
							Elseif	$Signal {60} (19,10,1) = "YR"		Then	R601=8
							Else 		$Signal {21} (13,10,1) = "RY"					Endif
When $Left_Mouse = {Sig22} (13,11,1)	Do If		$Signal {50} (19,11,1) = "YR"		Then	R502=8		
							Elseif	$Signal {60} (19,10,1) = "YR"		Then	R602=8	
							Else 		$Signal {22} (13,11,1) = "RY"					Endif
When $Left_Mouse = {Sig23} (13,12,1)	Do If		$Signal {50} (19,11,1) = "YR"		Then	R503=8		
							Elseif	$Signal {60} (19,10,1) = "YR"		Then	R603=8	
							Else 		$Signal {23} (13,12,1) = "RY"					Endif
When $Left_Mouse = {Sig30} (1,18,1)		Do If 	$Signal {1} (8,23,1) = "YR"		Then	R130=8 
							ElseIf	$Signal {2} (8,22,1) = "YR"		Then	R230=8
							ElseIf	$Signal {3} (8,21,1) = "YR"		Then	R330=8	
							ElseIf	$Signal {4} (8,20,1) = "YR"		Then	R430=8	
							ElseIf	$Signal {5} (8,19,1) = "YR"		Then	R530=8		
							Else 		$Signal {30} (1,18,1) = "RY"					Endif
When $Left_Mouse = {Sig40} (2,18,1)		Do If 	$Signal {2} (8,22,1) = "YR"		Then	R240=8
							ElseIf	$Signal {3} (8,21,1) = "YR"		Then	R340=8	
							ElseIf	$Signal {4} (8,20,1) = "YR"		Then	R440=8	
							ElseIf	$Signal {5} (8,19,1) = "YR"		Then	R540=8		
							Else 		$Signal {40} (2,18,1) = "RY"					Endif
When $Left_Mouse = {Sig1} (8,23,1)		Do If		$Signal {30} (1,18,1) = "RY"		Then	R301=8	
							Else 		$Signal {1} (8,23,1) = "YR"					Endif
When $Left_Mouse = {Sig2} (8,22,1)		Do If		$Signal {30} (1,18,1) = "RY"		Then	R302=8	
							Elseif	$Signal {40} (2,18,1) = "RY"		Then	R402=8		
							Else 		$Signal {2} (8,22,1) = "YR"					Endif
When $Left_Mouse = {Sig3} (8,21,1)		Do If		$Signal {30} (1,18,1) = "RY"		Then	R303=8	
							Elseif	$Signal {40} (2,18,1) = "RY"		Then	R403=8		
							Else 		$Signal {3} (8,21,1) = "YR"					Endif
When $Left_Mouse = {Sig4} (8,20,1)		Do If		$Signal {30} (1,18,1) = "RY"		Then	R304=8	
							Elseif	$Signal {40} (2,18,1) = "RY"		Then	R404=8		
							Else 		$Signal {4} (8,20,1) = "YR"					Endif
When $Left_Mouse = {Sig5} (8,19,1)		Do If		$Signal {30} (1,18,1) = "RY"		Then	R305=8	
							Elseif	$Signal {40} (2,18,1) = "RY"		Then	R405=8	
							Else 		$Signal {5} (8,19,1) = "YR"					Endif
When $Left_Mouse = {Sig10} (21,22,1)	Do If 	$Signal {11} (14,23,1) = "RY"		Then	R110=8 
							ElseIf	$Signal {12} (14,22,1) = "RY"		Then	R210=8	
							ElseIf	$Signal {13} (14,21,1) = "RY"		Then	R310=8
							ElseIf	$Signal {14} (14,20,1) = "RY"		Then	R410=8	
							ElseIf	$Signal {15} (14,19,1) = "RY"		Then	R510=8	
							Else 		$Signal {10} (21,22,1) = "YR"					Endif
When $Left_Mouse = {Sig20} (21,21,1)	Do If 	$Signal {12} (14,22,1) = "RY"		Then	R220=8	
							ElseIf	$Signal {13} (14,21,1) = "RY"		Then	R320=8
							ElseIf	$Signal {14} (14,20,1) = "RY"		Then	R420=8	
							ElseIf	$Signal {15} (14,19,1) = "RY"		Then	R520=8
							Else 		$Signal {20} (21,21,1) = "YR"					Endif
When $Left_Mouse = {Sig90} (20,20,1)	Do If 	$Signal {12} (14,22,1) = "RY"		Then	R290=8	
							ElseIf	$Signal {13} (14,21,1) = "RY"		Then	R390=8
							ElseIf	$Signal {14} (14,20,1) = "RY"		Then	R490=8	
							ElseIf	$Signal {15} (14,19,1) = "RY"		Then	R590=8	
							Else 		$Signal {90} (20,20,1) = "YR"					Endif
When $Left_Mouse = {Sig6} (19,19,1)		Do If 	$Signal {12} (14,22,1) = "RY"		Then	R26=8
							ElseIf	$Signal {13} (14,21,1) = "RY"		Then	R36=8
							ElseIf	$Signal {14} (14,20,1) = "RY"		Then	R46=8	
							ElseIf	$Signal {15} (14,19,1) = "RY"		Then	R56=8
							Else 		$Signal {6} (19,19,1) = "YR"					Endif
When $Left_Mouse = {Sig11} (14,23,1)	Do If		$Signal {10} (21,22,1) = "YR"		Then	R101=8	
							Else 		$Signal {11} (14,23,1) = "RY"					Endif
When $Left_Mouse = {Sig12} (14,22,1)	Do If		$Signal {10} (21,22,1) = "YR"		Then	R102=8	
							ElseIf	$Signal {20} (21,21,1) = "YR"		Then	R202=8		
							ElseIf	$Signal {90} (20,20,1) = "YR"		Then	R902=8		
							ElseIf	$Signal {6} (19,19,1) = "YR"		Then	R62=8	
							Else 		$Signal {12} (14,22,1) = "RY"					Endif
When $Left_Mouse = {Sig13} (14,21,1)	Do If		$Signal {10} (21,22,1) = "YR"		Then	R103=8	
							ElseIf	$Signal {20} (21,21,1) = "YR"		Then	R203=8		
							ElseIf	$Signal {90} (20,20,1) = "YR"		Then	R903=8		
							ElseIf	$Signal {6} (19,19,1) = "YR"		Then	R63=8		
							Else 		$Signal {13} (14,21,1) = "RY"					Endif
When $Left_Mouse = {Sig14} (14,20,1)	Do If		$Signal {10} (21,22,1) = "YR"		Then	R104=8	
							ElseIf	$Signal {20} (21,21,1) = "YR"		Then	R204=8		
							ElseIf	$Signal {90} (20,20,1) = "YR"		Then	R904=8		
							ElseIf	$Signal {6} (19,19,1) = "YR"		Then	R64=8		
							Else 		$Signal {14} (14,20,1) = "RY"					Endif
When $Left_Mouse = {Sig15} (14,19,1)	Do If		$Signal {10} (21,22,1) = "YR"		Then	R105=8	
							ElseIf	$Signal {20} (21,21,1) = "YR"		Then	R205=8		
							ElseIf	$Signal {90} (20,20,1) = "YR"		Then	R905=8		
							ElseIf	$Signal {6} (19,19,1) = "YR"		Then	R65=8		
							Else 		$Signal {15} (14,19,1) = "RY"					Endif



{Section 4	@@@@@@@@@@@@@@@@@@@@  Automatic Route Setting  @@@@@@@@@@@@@@@@@@@@@}
{Setting Home Signals - The Parameters for the CallRoute sub are: the block's index number, the coordinates of the signal the train is approaching, and up to 4 possible routes from this signal.
The inclusion of 'Delay=0' ensures that any time delay set for trains on the hidden reverse loop is observed before the outgoing route is set.
The 'If' statements are included for non automatic routes running into sidings to ensure that routes are not autoset if a route has already been set into a siding.}

When B[33]=11, 		Do					CallRoute (33, (19,11,1), &R501, &R502, &R503, &B0)		
When B[43]=11, 		Do					CallRoute (43, (19,10,1), &R601, &R602, &R603, &B0)		
When B[72]=12, 		Do	If R754=0		Then	CallRoute (72, (21,1,1), &R751, &R752, &R753, &B0)		Endif
When B[86]=11,		Do 					CallRoute (86, (35,3,1), &R851, &R852, &R853, &B0)
When B[99]=11,		Do 					CallRoute (99, (13,4,1), &R984, &B0, &B0, &B0)
When B[82]=11,		Do 					CallRoute (82, (13,3,1), &R884, &B0, &B0, &B0)	
When B[11]=11, Delay=0	Do 	If R105=0		Then	CallRoute (11, (21,22,1), &R101, &R102, &R103, &R104)		Endif
When B[12]=11, Delay=0	Do 	If R205=0		Then	CallRoute (12, (21,21,1), &R202, &R203, &R204, &B0)		Endif
When B[94]=11,		Do 					CallRoute (94, (24,9,1), &R951, &R952, &B0, &B0)	
When B[94]=11, R951=1	Do					CallRoute (94, (16,7,1), &R196, &B0, &B0, &B0)	
When B[94]=11, R952=1	Do 					CallRoute (94, (16,8,1), &R296, &B0, &B0, &B0)	
When B[31]=12, 		Do	If R305=0		Then	CallRoute (31, (1,18,1), &R301, &R302, &R303, &R304)		Endif	
When B[81]=12,		Do 					CallRoute (81, (2,8,1), &R801, &R802, &B0, &B0)		
When B[71]=12,		Do 					CallRoute (71, (1,8,1), &R701, &R702, &R703, &B0)	
When B[41]=12, 		Do 	If R405=0		Then	CallRoute (41, (2,18,1), &R402, &R403, &R404, &B0)		Endif
When B[93]=11, 		Do 	If R905=0		Then	CallRoute (93, (20,20,1), &R902, &R903, &R904, &B0)		Endif
When B[98]=12		Do 					CallRoute (98, (13,7,1), &R961, &R962, &B0, &B0)	
When B[98]=12, R961=1	Do 					CallRoute (98, (21,7,1), &R195, &B0, &B0, &B0)	
When B[98]=12, R962=1	Do 					CallRoute (98, (21,8,1), &R295, &B0, &B0, &B0)	

{Setting Platform Control Variables to reflect the current train's schedule - these control variables ensure any station stops are performed and that the correct outgoing route is called once the train is ready to depart}	
When B[75]=12		Do	Platform(75)
When B[85]=11		Do	Platform(85)
When B[70]=12		Do	Platform(70)
When B[80]=12		Do	Platform(80)
When B[50]=11		Do	Platform(50)
When B[60]=11		Do	Platform(60)
When B[30]=12		Do	Platform(30)
When B[40]=12		Do	Platform(40)
When B[10]=11		Do	Platform(10)
When B[20]=11		Do	Platform(20)
When B[90]=11		Do	Platform(90)

{Station Stop Timers - this code sets the wait time to be observed at each station by trains marked as stopping. Enter 1 line for each platform block and insert the wait time you want. My main station has a longer wait time}
When Control[51]>9	Do	Wait 30	Control[51]=10-
When Control[52]>9	Do	Wait 30	Control[52]=10-
When Control[53]>9	Do	Wait 30	Control[53]=10-
When Control[21]>9	Do	Wait 30	Control[21]=10-
When Control[22]>9	Do	Wait 30	Control[22]=10-
When Control[23]>9	Do	Wait 30	Control[23]=10-
When Control[1]>9		Do	Wait 40	Control[1]=10-
When Control[2]>9		Do	Wait 40	Control[2]=10-
When Control[3]>9		Do	Wait 40	Control[3]=10-
When Control[4]>9		Do	Wait 40	Control[4]=10-
When Control[5]>9		Do	Wait 40	Control[5]=10-

{Random Trains - this code checks each train as it passes certain points on the layout. If it is a random train the PC randomly assigns a new route for each train to follow. You will need to work out whereabouts on your layout is the best place to do this. You could do it as a train approaches a junction however I have chosen to do it as soon as a train passes the previous junction so the operator has the maximum time to plan ahead. On my layout blocks 11 and 12 are where down trains exit the layout and therefore this is a logical place to reassign the schedule before the train re enters the layout. Block 83 (at Midland Junction) is the best place to change the schedule for both up and down trains on the Spiral.}
When B[83] > 9		Do	Random(83)
When B[11] = 12		Do	Random(11)
When B[12] = 12		Do	Random(12)

{Setting Routes from Platform Starter Signals - The AutoRoute sub sets the outgoing route in response to the value that was stored on the platform's control variable by the Platform subroutine. The paramters are: the coordinates of the up signal, the coordinates of the down signal, the platform's control variable, the route for up trains taking option 1, the route for up trains taking option 2, any additional uproute, the route for down trains taking option 1, the route for down trains taking option 2, plus up to 2 additional down routes. The additional up and down routes are included so that non automatic routes can be checked as well. (i.e. other routes that are possible from this platform such as routes into sidings or wrongroad movements that you don't want the PC to use) You may not need as many routes on your layout.}
When Control[51]>0, Control[51]<10	Do  AutoRoute ((25,1,1),(30,1,1),&Control[51],&R175,&R175,&B0,&R185,&R186,&B0,&B0) 
When Control[52]>0, Control[52]<10	Do  AutoRoute ((25,2,1),(30,2,1),&Control[52],&R275,&R275,&B0,&R285,&R286,&B0,&B0) 
When Control[53]>0, Control[53]<10	Do  AutoRoute ((25,3,1),(30,3,1),&Control[53],&R375,&R375,&B0,&R385,&R386,&B0,&B0) 
When Control[21]>0, Control[21]<10	Do  AutoRoute ((7,10,1),(13,10,1),&Control[21],&R170,&R180,&B0,&R150,&R150,&R160,&B0) 
When Control[22]>0, Control[22]<10	Do  AutoRoute ((7,11,1),(13,11,1),&Control[22],&R270,&R280,&B0,&R250,&R250,&R260,&B0) 
When Control[23]>0, Control[23]<10	Do  AutoRoute ((7,12,1),(13,12,1),&Control[23],&R370,&R370,&B0,&R350,&R350,&R360, &B0) 
When Control[1]>0, Control[1]<10	Do  AutoRoute ((8,23,1),(14,23,1),&Control[1],&R130,&R130,&B0,&R110,&R110,&B0,&B0) 
When Control[2]>0, Control[2]<10	Do  AutoRoute ((8,22,1),(14,22,1),&Control[2],&R240,&R240,&R230,&R210,&R290,&R220,&R26) 
When Control[3]>0, Control[3]<10	Do  AutoRoute ((8,21,1),(14,21,1),&Control[3],&R340,&R340,&R330,&R310,&R390,&R320,&R36) 
When Control[4]>0, Control[4]<10	Do  AutoRoute ((8,20,1),(14,20,1),&Control[4],&R440,&R440,&R430,&R410,&R490,&R420,&R46) 
When Control[5]>0, Control[5]<10	Do  AutoRoute ((8,19,1),(14,19,1),&Control[5],&R540,&R540,&R530,&R510,&R590,&R520,&R56) 

{Base Tunnel Delay Timer}
When B[11] = 11 or B[12] = 11	Do	If 	DelayOn = 1 	Then	Until Delay = 0	Loop	Wait 1, Delay = 1-	
							$draw message (24,23,1) = "@Delay"	Endloop	Endif
When B[11] <> 11, DelayOn = 1	Do		Delay = $Random, Delay = 60#,		
							$draw message (24,23,1) = "@Delay", $color sprite (24,23,1) = white
When B[12] <> 11, DelayOn = 1	Do		Delay = $Random, Delay = 60#,		
							$draw message (24,23,1) = "@Delay",	$color sprite (24,23,1) = white
When $Left_Mouse = (24,23,1)	Do	If 	DelayOn = 0	Then	DelayOn = 1,
							Delay = $Random, Delay = 60#,	$draw message (24,23,1) = "@Delay"
						Else 	Delay = 0, DelayOn = 0		$draw message (24,23,1) = "off"	Endif


{Section 5	@@@@@@@@@@@@@@@@@@@@@@@@@@  Route Activation  @@@@@@@@@@@@@@@@@@@@@}
{When a route has been called manually the route's variable will have been set to 8. When it has been called automatically it will equal 6. This section of the code now checks the route's interlocking and activates it by setting the route variable to 1 if there are no conflicting routes set.  If called manually the route will be checked once and either set or cancelled. If called automatically the loop statements will cause the PC to keep trying until it can be set.	
The AutoSet sub routine does this for us. The parameters for this sub are: 
1) 	the route to be set, 
2) 	the first block along the chosen route
3 to 5) the coordinates of up to 3 throat blocks that need to be idle for this route to be set. If not needed insert a '0' 
6 to 8) any alternate routes that need to be reset to 0 when this route is set. If not needed insert a '0'}

When R175>5	Do Until R175<6	Loop	AutoSet (&R175, 72, (22,1,1), 0, 0, 0, 0, 0)	Wait 2	Endloop
When R275>5	Do Until R275<6	Loop	AutoSet (&R275, 72, (22,1,1), 0, 0, 0 ,0 ,0)	Wait 2	Endloop
When R375>5	Do Until R375<6	Loop	AutoSet (&R375, 72, (22,1,1), 0, 0, 0, 0, 0)	Wait 2	Endloop
When R475>5	Do Until R475<6	Loop	AutoSet (&R475, 72, (22,1,1), 0, 0, 0, 0, 0)	Wait 2	Endloop
When R751>5 or R752>5 or R753>5 or R754>5		Do Until	R751<6, R752<6, R753<6, R754<6
					Loop	AutoSet (&R751, 51, (22,1,1), 0, 0, &R752,&R753,&R754)	
						AutoSet (&R753, 53, (22,1,1), 0, 0, &R752,&R751,&R754)
						AutoSet (&R752, 52, (22,1,1), 0, 0, &R751,&R753,&R754)
						AutoSet (&R754, 54, (22,1,1), 0, 0, &R751,&R752,&R753)	Wait 2	Endloop

When R150>5	Do Until R150<6	Loop	AutoSet (&R150, 33, (15,10,1),(16,11,1), 0, 0, 0, 0)   		Wait 2 Endloop
When R250>5	Do Until R250<6	Loop	AutoSet (&R250, 33, (16,11,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R350>5	Do Until R350<6	Loop	AutoSet (&R350, 33, (16,11,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R501>5 or R502>5 or R503>5	Do Until 	R501<6, R502<6, R503<6
					Loop	AutoSet (&R502, 22, (16,11,1), 0, 0, &R501, &R503, 0)		
						AutoSet (&R503, 23, (16,11,1), 0, 0, &R501, &R502, 0)		
						AutoSet (&R501, 21, (15,10,1), (16,11,1), 0, &R502, &R503, 0) 	Wait 2 Endloop

When R160>5	Do Until R160<6	Loop	AutoSet (&R160, 43, (15,10,1),(18,10,1), 0, 0, 0, 0)			Wait 2 Endloop
When R260>5	Do Until R260<6	Loop	AutoSet (&R260, 43, (16,11,1), (18,10,1), 0, 0, 0, 0)			Wait 2 Endloop
When R360>5	Do Until R360<6	Loop	AutoSet (&R360, 43, (16,11,1), (18,10,1), 0, 0, 0, 0)			Wait 2 Endloop
When R601>5 or R602>5 or R603>5	Do Until 	R601<6, R602<6, R603<6	
					Loop	AutoSet (&R601, 21, (15,10,1), (18,10,1), 0, &R602, &R603, 0)	
						AutoSet (&R602, 22, (16,11,1), (18,10,1), 0, &R601, &R603, 0)		
						AutoSet (&R603, 23, (16,11,1), (18,10,1), 0, &R601, &R602, 0)	Wait 2 Endloop

When R848>5	Do Until R848<6	Loop 	AutoSet (&R848, 82, (15,3,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R849>5	Do Until R849<6	Loop 	AutoSet (&R849, 99, (15,3,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R884>5	Do Until R884<6	Loop 	AutoSet (&R884, 84, (15,3,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R984>5	Do Until R984<6	Loop 	AutoSet (&R984, 84, (15,3,1), 0, 0, 0, 0, 0)				Wait 2 Endloop

When R195>5	Do Until R195<6	Loop 	AutoSet (&R195, 94, (23,8,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R295>5	Do Until R295<6	Loop 	AutoSet (&R295, 94, (23,8,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R951>5 or R952>5	Do Until 	R951<6, R952<6
					Loop	AutoSet (&R951, 91, (23,8,1), 0, 0, &R952, 0, 0)	
						AutoSet (&R952, 92, (23,8,1), 0, 0, &R951, 0, 0)			Wait 2 Endloop

When R196>5	Do Until R196<6	Loop 	AutoSet (&R196, 98, (14,7,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R296>5	Do Until R296<6	Loop 	AutoSet (&R296, 98, (14,7,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R961>5 or R962>5 	Do Until 	R961<6, R962<6
					Loop	AutoSet (&R961, 91, (14,7,1), 0, 0, &R962, 0, 0)	
						AutoSet (&R962, 92, (14,7,1), 0, 0, &R961, 0, 0)			Wait 2 Endloop

When R130>5	Do Until R130<6	Loop	AutoSet (&R130, 31, (1,19,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R230>5	Do Until R230<6	Loop	AutoSet (&R230, 31, (1,19,1), (4,22,1), 0, 0, 0, 0)			Wait 2 Endloop
When R330>5	Do Until R330<6	Loop	AutoSet (&R330, 31, (1,19,1), (2,20,1), 0, 0, 0, 0)			Wait 2 Endloop
When R430>5	Do Until R430<6	Loop	AutoSet (&R430, 31, (1,19,1), (2,20,1), 0, 0, 0, 0)			Wait 2 Endloop
When R530>5	Do Until R530<6	Loop	AutoSet (&R530, 31, (1,19,1), (2,20,1), 0, 0, 0, 0)			Wait 2 Endloop
When R305>5	Do Until R305<6	Loop	AutoSet (&R305, 5, (1,19,1), (2,20,1), 0, &R301, &R302, &R303)	Wait 2 Endloop
When R301>5 or R302>5 or R303>5 or R304>5		Do Until R301<6, R302<6, R303<6, R304<6
					Loop	AutoSet (&R301, 1, (1,19,1), 0, 0, &R302, &R303, &R304)	
						AutoSet (&R302, 2, (1,19,1), (4,22,1), 0, &R301, &R303, &R304)	
						AutoSet (&R303, 3, (1,19,1), (2,20,1), 0, &R301, &R302, &R304)	
						AutoSet (&R304, 4, (1,19,1), (2,20,1), 0, &R301, &R302, &R303)	Wait 2 Endloop

When R240>5	Do Until R240<6	Loop	AutoSet (&R240, 41, (2,20,1), (4,22,1), 0, 0, 0, 0)			Wait 2 Endloop
When R340>5   Do Until R340<6	Loop	AutoSet (&R340, 41, (2,20,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R440>5	Do Until R440<6	Loop	AutoSet (&R440, 41, (2,20,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R540>5	Do Until R540<6	Loop	AutoSet (&R540, 41, (2,20,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R405>5	Do Until R405<6	Loop	AutoSet (&R405, 5, (2,20,1), 0, 0, &R402, &R403, &R404)		Wait 2 Endloop
When R402>5 or R403>5 or R404>5	Do Until R402<6, R403<6, R404<6
					Loop	AutoSet (&R402, 2, (2,20,1), (4,22,1), 0, &R403, &R404, &R405)	
						AutoSet (&R403, 3, (2,20,1), 0, 0, &R402, &R404, &R405)	
						AutoSet (&R404, 4, (2,20,1), 0, 0, &R402, &R403, &R405)		Wait 2 Endloop

When R110>5	Do Until R110<6	Loop	AutoSet (&R110, 11, (20,22,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R210>5	Do Until R210<6	Loop	AutoSet (&R210, 11, (20,22,1), (15,22,1), 0, 0, 0, 0)			Wait 2 Endloop
When R310>5	Do Until R310<6	Loop	AutoSet (&R310, 11, (20,22,1),(16,21,1),(19,21,1), 0, 0, 0)		Wait 2 Endloop
When R410>5	Do Until R410<6	Loop	AutoSet (&R410, 11, (20,22,1),(17,20,1), (19,21,1), 0, 0, 0)	Wait 2 Endloop
When R510>5	Do Until R510<6	Loop	AutoSet (&R510, 11, (20,22,1), (17,20,1),(19,21,1), 0, 0, 0)	Wait 2 Endloop
When R105>5 Do Until R105<6	Loop	AutoSet (&R105, 5,(20,22,1),(17,20,1)(19,21,1),&R101,&R102,&R103)	Wait 2 Endloop
When 	R101>5 or R102>5 or R103>5 or R104>5 	Do Until R101<6, R102<6, R103<6, R104<6
					Loop	AutoSet (&R101, 1, (20,22,1), 0, 0, &R102, &R103, &R104)
						AutoSet (&R102, 2, (20,22,1), (15,22,1), 0, &R101, &R103,&R104)
						AutoSet (&R103, 3, (20,22,1), (16,21,1), (19,21,1),&R101,&R102,&R104)
						AutoSet (&R104, 4, (20,22,1), (17,20,1), (19,21,1),&R101,&R102,&R103) 	Wait 2 Endloop

When R220>5  Do Until R220<6	Loop	AutoSet (&R220, 12, (16,21,1), (19,21,1),(15,22,1), 0, 0, 0)	Wait 2 Endloop
When R320>5  Do Until R320<6	Loop	AutoSet (&R320, 12, (16,21,1), (19,21,1),0, 0, 0, 0)			Wait 2 Endloop
When R420>5  Do Until R420<6	Loop	AutoSet (&R420, 12, (17,20,1), (19,21,1),0, 0, 0, 0)			Wait 2 Endloop
When R520>5  Do Until R520<6	Loop	AutoSet (&R520, 12, (17,20,1), (19,21,1),0, 0, 0, 0)			Wait 2 Endloop
When R205>5  Do Until R205<6	Loop	AutoSet (&R205, 5, (17,20,1), (19,21,1),0, &R202, &R203, &R204)	Wait 2 Endloop
When R202>5 or R203>5 or R204>5	Do Until	R202<6, R203<6, R204<6
					Loop	AutoSet (&R203, 3, (16,21,1), (19,21,1), 0, &R202, &R204, 0)
						AutoSet (&R202, 2, (16,21,1), (19,21,1), (15,22,1), &R203, &R204, 0)
						AutoSet (&R204, 4, (17,20,1), (19,21,1), 0, &R202, &R203, 0)	Wait 2 Endloop

When R290>5	Do Until R290<6	Loop	AutoSet (&R290, 93, (17,20,1), (16,21,1),(15,22,1), 0, 0, 0)	Wait 2 Endloop
When R390>5 Do Until R390<6	Loop	AutoSet (&R390, 93, (16,21,1), (17,20,1), 0, 0, 0, 0)			Wait 2 Endloop
When R490>5 Do Until R490<6	Loop	AutoSet (&R490, 93, (17,20,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R590>5	Do Until R590<6	Loop	AutoSet (&R590, 93, (17,20,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R905>5	Do Until R905<6	Loop	AutoSet (&R905, 5, (17,20,1), 0, 0, &R902, &R903, &R904)		Wait 2 Endloop
When R902>5 or R903>5 or R904>5 	Do Until 	R902<6, R903<6, R904<6
					Loop	AutoSet (&R903, 3, (16,21,1), (17,20,1), 0, &R902, &R904, 0)
						AutoSet (&R904, 4, (17,20,1), 0, 0, &R902, &R903, 0)	 
						AutoSet (&R902, 2, (17,20,1), (16,21,1), (15,22,1), &R903, &R904, 0)	Wait 2 Endloop

When R185=8	Do 			 	AutoSet (&R185, 86, (33,1,1), 0, 0, 0, 0, 0)					
When R285=8	Do 			 	AutoSet (&R285, 86, (33,1,1), 0, 0, 0, 0, 0)					
When R385=8	Do 			 	AutoSet (&R385, 86, (33,1,1), 0, 0, 0, 0, 0)					
When R185=6	Do Until R185<6	Loop 	If Control[82]=0	Then	AutoSet (&R185,86,(33,1,1),0,0,0,0,0) Endif Wait 2 Endloop
When R285=6	Do Until R285<6	Loop 	If Control[82]=0	Then	AutoSet (&R285,86,(33,1,1),0,0,0,0,0) Endif Wait 2 Endloop
When R385=6	Do Until R385<6	Loop 	If Control[82]=0	Then	AutoSet (&R385,86,(33,1,1),0,0,0,0,0) Endif Wait 2 Endloop
When R186=6	Do Until R186<6	Loop 	If Control[99]=0	Then	AutoSet (&R186,86,(33,1,1),0,0,0,0,0) Endif Wait 2 Endloop
When R286=6	Do Until R286<6	Loop 	If Control[99]=0	Then	AutoSet (&R286,86,(33,1,1),0,0,0,0,0) Endif Wait 2 Endloop
When R386=6	Do Until R386<6	Loop 	If Control[99]=0	Then	AutoSet (&R386,86,(33,1,1),0,0,0,0,0) Endif Wait 2 Endloop
When R851>5 or R852>5 or R853>5	Do Until 	R851<6, R852<6, R853<6
					Loop	AutoSet (&R851, 51, (33,1,1), 0, 0, &R852, &R853, 0)	
						AutoSet (&R852, 52, (33,1,1), 0, 0, &R851, &R853, 0)
						AutoSet (&R853, 53, (33,1,1), 0, 0, &R851, &R852, 0)		Wait 2 Endloop
{Routes 185, 285, 385, 186, 286 and 386 have an additional If statement added. Routes 185, 285 and 385 are for trains heading down the Spiral and destined to take the Shortline when they get to Midland Junction. Because there is no crossing loop at the junction the PC needs to lok further ahead and check that the Shortline is not already cleared for a train heading in their direction. If there is then Control[82] would equal 1. Control[99] does the same thing for checking the Midland Line for routes 186, 286 and 386.}

When R180=8	Do 				AutoSet (&R180, 81, (3,10,1), (6,10,1), 0, 0, 0, 0)				
When R280=8	Do 				AutoSet (&R280, 81, (3,10,1), (4,11,1), 0, 0, 0, 0)				
When R180=6	Do Until R180<6	Loop	If Control[84]<>1  Then	 'check there is no ShortLine train coming down the spiral
						AutoSet (&R180, 81, (3,10,1), (6,10,1), 0, 0, 0, 0) 		Endif	Wait 2 Endloop
When R280=6	Do Until R280<6	Loop	If Control[84]<>2	Then	 'check there is no Midland train coming down the spiral
						AutoSet (&R280, 81, (3,10,1), (4,11,1), 0, 0, 0, 0) 		Endif	Wait 2 Endloop
When R801>5 or R802>5	Do Until 	R801<6, R802<6
					Loop	AutoSet (&R801, 21, (3,10,1), (6,10,1), 0, &R802, 0, 0)	
						AutoSet (&R802, 22, (3,10,1), (4,11,1), 0, &R801, 0, 0)		Wait 2 Endloop

When R270>5	Do Until R270<6	Loop	AutoSet (&R270, 71, (4,11,1), (2,11,1), 0, 0, 0, 0)			Wait 2 Endloop
When R370>5	Do Until R370<6	Loop	AutoSet (&R370, 71, (2,11,1), 0, 0, 0, 0, 0)				Wait 2 Endloop
When R170=8	Do If B[25] > 4 	Then 	$draw message (9,5,1) = "Crossover 25 locked by train on Platform 2", 
						$color sprite (9,5,1) = white, Wait 3  $erase message (9,5,1)
					Else	AutoSet (&R170, 71, (3,10,1), (2,11,1), 0, 0, 0, 0)				Endif
When R701=8 	Do If B[25] > 4 	Then 	$draw message (9,5,1) = "Crossover 25 locked by train on Platform 2", 
							$color sprite (9,5,1) = white, Wait 3  $erase message (9,5,1)			
					Else	AutoSet (&R701, 21, (3,10,1), (2,11,1), 0, &R702, &R703, 0)			Endif
When R702>5 or R703>5	Do Until 	R702<6, R703<6
					Loop	AutoSet (&R702, 22, (4,11,1), (2,11,1), 0, &R701,&R703,0)		
						AutoSet (&R703, 23, (2,11,1), 0, 0, &R701, &R702, 0)			Wait 2 Endloop
{Routes 701 and 170 have an extra If statement added to ensure that Block 25 is idle in addition to the usual interlocking checks. Block 25 is an extra block added to monitor the turnouts at the end of Upper Platform 2. These turnouts are alongside the platform and may be occupied by a long train stopped at the station.}

When R26=8	    	Do 			AutoSet (&R26, 6, (17,20,1), (16,21,1),(15,22,1), 0, 0, 0)
When R36=8		Do			AutoSet (&R36, 6, (16,21,1), (17,20,1), 0, 0, 0, 0)
When R46=8		Do			AutoSet (&R46, 6, (17,20,1), 0, 0, 0, 0, 0)
When R56=8		Do			AutoSet (&R56, 6, (17,20,1), 0, 0, 0, 0, 0)
When R62=8		Do			AutoSet (&R62, 2, (17,20,1), (16,21,1), (15,22,1), 0, 0, 0)		
When R63=8		Do			AutoSet (&R63, 3, (16,21,1), (17,20,1), 0, 0, 0, 0)	
When R64=8		Do			AutoSet (&R64, 4, (17,20,1), 0, 0, 0, 0, 0)		
When R65=8		Do			AutoSet (&R65, 5, (17,20,1), 0, 0, 0, 0, 0)	
When R14=8		Do 			AutoSet (&R14, 24, (6,10,1), 0, 0, 0, 0, 0) 	
When R41=8		Do 			AutoSet (&R41, 24, (6,10,1), 0, 0, 0, 0, 0) 		

	
{Cancelling pending routes if the operator sends the train by an alternate route. If a train is waiting for a route to be set automatically but the controller sends it by an alternate route this code will ensure the original route is reset to 0. The AutoSet sub looks after incoming routes for us so you will only need to enter 1 line for each outgoing route from a platform and include in the actions statement any alternate routes from that platform that could be called automatically by the PC}
When	R240 = 1	Do	R230 = 0
When	R340 = 1	Do	R330 = 0
When	R440 = 1	Do	R430 = 0
When	R540 = 1	Do	R530 = 0
When	R230 = 1	Do	R240 = 0
When	R330 = 1	Do	R340 = 0
When	R430 = 1	Do	R440 = 0
When	R530 = 1	Do	R540 = 0
When 	R210 = 1	Do	R220 = 0, 	R290 = 0
When	R220 = 1	Do	R290 = 0
When	R290 = 1	Do	R220 = 0
When 	R310 = 1	Do	R320 = 0, 	R390 = 0
When	R320 = 1	Do	R390 = 0
When	R390 = 1	Do	R320 = 0
When 	R410 = 1	Do	R420 = 0, 	R490 = 0
When	R420 = 1	Do	R490 = 0
When	R490 = 1	Do	R420 = 0
When 	R510 = 1	Do	R520 = 0, 	R590 = 0
When	R520 = 1	Do	R590 = 0
When	R590 = 1	Do	R520 = 0
When	R150 = 1	Do	R160 = 0
When	R160 = 1	Do	R150 = 0
When	R250 = 1	Do	R260 = 0
When	R260 = 1	Do	R250 = 0
When	R350 = 1	Do	R360 = 0
When	R360 = 1	Do	R350 = 0
When	R170 = 1	Do	R180 = 0
When	R270 = 1	Do	R280 = 0
When	R180 = 1	Do	R170 = 0
When	R280 = 1	Do	R270 = 0
When R849 = 1	Do	R848 = 0
When R848 = 1	Do	R849 = 0


{Section 6	@@@@@@@@@@@@@@@@@@@@  Interlocking Controls  @@@@@@@@@@@@@@@@@@@@@}

When 	R175=1 or R275=1 or R375=1 or R475=1		Do	Control[71] = 1	When B[71] = 0	Do	Control[71] = 0
When 	R170=1 or R270=1 or R370= 1				Do	Control[72] = 1	When B[72] = 0	Do	Control[72] = 0
When 	R185=1 or R285=1 or R385= 1				Do	Control[84] = 2	When B[84] = 0	Do	Control[84] = 0
When	R884=1 or R984=1 						Do	Control[86] = 1	When B[86] = 0	Do	Control[86] = 0
When	R848=1 							Do	Control[81] = 1	When B[81] = 0	Do	Control[81] = 0
When	R180=1 or R280=1 						Do	Control[82] = 1	When B[82] = 0	Do	Control[82] = 0
When	R196=1 or R296=1 						Do	Control[99] = 1	When B[99] = 0	Do	Control[99] = 0
When	R849=1 							Do	Control[98] = 1	When B[98] = 0	Do	Control[98] = 0
When	R195=1 or R295=1 						Do	Control[93] = 1	When B[93] = 0	Do	Control[93] = 0
When	R290=1 or R390=1 or R490=1 or R590=1		Do	Control[94] = 1	When B[94] = 0	Do	Control[94] = 0
When	R110=1 or R210=1 or R310=1 or R410=1 or R510=1	Do	Control[12] = 1	When B[12] = 0	Do	Control[12] = 0
When	R220=1 or R320=1 or R420=1 or R520=1		Do	Control[11] = 1	When B[11] = 0	Do	Control[11] = 0
When	R150=1 or R250=1 or R350=1				Do	Control[31] = 1	When B[31] = 0	Do	Control[31] = 0
When	R160=1 or R260=1 or R360=1				Do	Control[41] = 1	When B[41] = 0	Do	Control[41] = 0
When	R130=1 or R230=1 or R330=1 or R430=1 or R530=1	Do	Control[33] = 1	When B[33] = 0	Do	Control[33] = 0
When	R240=1 or R340=1 or R440=1 or R540=1		Do	Control[43] = 1	When B[43] = 0	Do	Control[43] = 0
When 	R186=1 or R286=1 or R386= 1				Do	Control[84] = 3	'Midland bound train	


{Section 7	@@@@@@@@@@@@@@@  Additional Route Controls for Spiral Routes  @@@@@@@@@@@@@@@@@@}

When B[85]=12	Do											'ensures Control[84] is set correctly
	Index = &L[85],		Index = 2724-,	Index = 13/,				'sets Index = to this loco's number
	If Mode[index] = 1	Then	Control[84] = 1						'if train is manual set Control[84] = 1
	Else			Index = Schedule[index],						'set Index = to schedule of this loco
	If Index > 9	Then	Until	Index < 10	Loop  Index = 10-	Endloop	Endif	'reduce index to value of 0 to 5
	If Index = 2 or 	Index=5  Then  Control[84]=3	Else Control[84]=2 Endif Endif  	'3 for Midland Trains, else 2

{The route at Midland Junction is set in response to the value of Control[84]. 1=manual train - no route set. 2=Shortline Train. 3=Midland Train. }
When B[84]=12	Do 	
If R848=0, R849=0		Then 			'when down train arrives on Block84 and no routes have been called
	If 		Control[84]=2  	Then 	If $signal {84} (22,4,1) = "RR"  Then R848=5   	Else R848=6  Endif
	ElseIf 	Control[84]=3	Then	If $signal {84} (22,4,1) = "RR"  Then R849=5   	Else R849=3  Endif Endif Endif



{Section 8	@@@@@@@@@@@@@@@@ Automatic Cancelling of Used Routes @@@@@@@@@@@@@@@@@@@@@}

When B[83] = 0	Do	CancelUsedRoute (&Midland_Junction, &Summit_West)
When B[75] = 0	Do	CancelUsedRoute (&Summit_West, 	&Summit_South) 
When B[85] = 0	Do	CancelUsedRoute (&Summit_South, 	&Midland_East)
When B[95] = 0	Do	CancelUsedRoute (&Midland_East, 	&Midland_West) 
When B[96] = 0	Do	CancelUsedRoute (&Midland_West, 	&Upper_West_70) 
When B[70] = 0	Do	CancelUsedRoute (&Upper_West_70, 	&Upper_West_80) 
When B[80] = 0	Do	CancelUsedRoute (&Upper_West_80, 	&Upper_Yard) 
When B[21] = 0	Do	CancelUsedRoute (&Upper_Yard, 	&Upper_East_50)
When B[50] = 0	Do	CancelUsedRoute (&Upper_East_50, 	&Upper_East_60) 
When B[60] = 0	Do	CancelUsedRoute (&Upper_East_60, 	&Lower_West_30)
When B[30] = 0	Do	CancelUsedRoute (&Lower_West_30,	&Lower_West_40)
When B[40] = 0	Do	CancelUsedRoute (&Lower_West_40, 	&Lower_East_10) 
When B[10] = 0	Do	CancelUsedRoute (&Lower_East_10, 	&Lower_East_20) 
When B[20] = 0	Do	CancelUsedRoute (&Lower_East_20, 	&Lower_East_90)
When B[90] = 0	Do	CancelUsedRoute (&Lower_East_90, 	&RoutePointer) 



{Section 9	@@@@@@@@@@@@@@@@@ Route Controlled Point Setting @@@@@@@@@@@@@@@@@@@@@@}

When R751 = 1 or R175 = 1				Do			{set switches 	51N}
	If $switch (22,1,1) = reversed	Then	$switch (22,1,1) = Normal		Endif	'set 51N
	RouteBlock (&B[75], &R751, &R175)
When R752 = 1 or R275 = 1				Do			{set switches 	51R, 52R}
	If $switch (23,2,1) = normal		Then	$switch (23,2,1) = reversed		Endif	'set 52R
	If $switch (22,1,1) = normal,		Then	$switch (22,1,1) = reversed		Endif	'set 51R
	RouteBlock (&B[75], &R752, &R275)
When R753 = 1 or R375 = 1				Do			{set switches 	51R, 52N, 53R}
	If $switch (23,2,1) = reversed	Then	$switch (23,2,1) = normal		Endif	'set 52N
	If $switch (22,1,1) = normal,		Then	$switch (22,1,1) = reversed		Endif	'set 51R
	If $switch (24,3,1) = normal		Then	$switch (24,3,1) = reversed		Endif	'set 53R
	RouteBlock (&B[75], &R753, &R375)
When R754 = 1 or R475 = 1				Do			{set switches 	51R, 52N, 53N}
	If $switch (23,2,1) = reversed	Then	$switch (23,2,1) = normal		Endif	'set 52N
	If $switch (22,1,1) = normal		Then	$switch (22,1,1) = reversed		Endif	'set 51R
	If $switch (24,3,1) = reversed	Then	$switch (24,3,1) = Normal		Endif	'set 53N
	RouteBlock (&B[75], &R754, &R475)
When R851 = 1 or R185 = 1 or R186=1			Do			{set switches 	55N}
	If $switch (33,1,1) = reversed	Then	$switch (33,1,1) = Normal		Endif	'set 55N
	If R186=1	Then	Wait 0.1  B[85]=4	Else	RouteBlock (&B[85], &R851, &R185)	Endif
When R852 = 1 or R285 = 1 or R286 =1		Do			{set switches 	55R, 54R}
	If $switch (33,1,1) = normal		Then	$switch (33,1,1) = Reversed	Endif	'set 55R
	If $switch (32,2,1) = normal		Then	$switch (32,2,1) = reversed		Endif	'set 54R
	If R286=1	Then	Wait 0.1  B[85]=4	Else	RouteBlock (&B[85], &R852, &R285)	Endif
When R853 = 1 or R385 = 1 or R386 = 1		Do			{set switches 	55R, 54N}
	If $switch (33,1,1) = normal		Then	$switch (33,1,1) = Reversed	Endif	'set 55R
	If $switch (32,2,1) = reversed	Then	$switch (32,2,1) = Normal		Endif	'set 54N
	If R386=1	Then	Wait 0.1  B[85]=4	Else	RouteBlock (&B[85], &R853, &R385)	Endif
When R848 = 1 or R884 = 1				Do			{set switches 	8N}
	If $switch (15,3,1) = reversed	Then	$switch (15,3,1) = Normal		Endif	'set 8N
	RouteBlock (&B[83], &R884, &R848)
When R849 = 1 or R984 = 1				Do			{set switches 	8R}
	If $switch (15,3,1) = Normal		Then	$switch (15,3,1) = reversed		Endif	'set 8R
	RouteBlock (&B[83], &R984, &R849)
When R951 = 1 or R195 = 1				Do			{set switches 	95N}
	If $switch (23,8,1) = reversed	Then	$switch (23,8,1) = Normal		Endif	'set 95N
	RouteBlock (&B[95], &R951, &R195)
When R952 = 1 or R295 = 1				Do			{set switches 	95R}
	If $switch (23,8,1) = Normal		Then	$switch (23,8,1) = reversed		Endif	'set 95R
	RouteBlock (&B[95], &R952, &R295)
When R961 = 1 or R196 = 1				Do			{set switches 	96N}
	If $switch (14,7,1) = reversed	Then	$switch (14,7,1) = Normal		Endif	'set 96N
	RouteBlock (&B[96], &R196, &R961)
When R962 = 1 or R296 = 1				Do			{set switches 	96R}
	If $switch (14,7,1) = Normal		Then	$switch (14,7,1) = reversed		Endif	'set 96R
	RouteBlock (&B[96], &R296, &R962)
When R41 = 1 or R14 = 1					Do			{set switches 	24R}
	If $switch (8,10,1) = Normal,		Then $switch (8,10,1) = Reversed		Endif	'set 24R
	If R14 = 1, B[24] < 10			Then	B[24] = 1	Endif
	If R41 = 1, B[21] < 10			Then	B[21] = 2	Endif
{Routes 41 and 14 are the routes in and out of the yard at Upper Junction and because there is no route block involved the code simply checks that there is no train currently on the block before setting the block green (B[24]=1 for up train or 2 for down.}
When R170 = 1 or R701 = 1				Do			{set switches 	27R, 26N, 25R, 24N}
	If $switch (2,11,1) = Normal, 	Then $switch (2,11,1) = Reversed		Endif	'set 27R
	If $switch (4,11,1) = Reversed	Then $switch (4,11,1) = Normal		Endif	'set 26N
	If $switch (5,11,1) = Normal		Then $switch (5,11,1) = Reversed,  		Endif	'set 25R
	If $switch (8,10,1) = Reversed	Then $switch (8,10,1) = normal		Endif	'set 24N
	RouteBlock (&B[70], &R170, &R701)
When R270 = 1 or R702 = 1				Do			{set switches 	27R, 26N, 25N}
	If $switch (5,11,1) = Reversed, 	Then $switch (5,11,1) = Normal		Endif	'set 25N
	If $switch (4,11,1) = Reversed	Then $switch (4,11,1) = Normal		Endif	'set 26N
	If $switch (2,11,1) = Normal		Then $switch (2,11,1) = Reversed		Endif	'set 27R
	RouteBlock (&B[70], &R270, &R702)
When R370 = 1 or R703 = 1				Do			{set switches 	27N}
	If $switch (2,11,1) = reversed	Then $switch (2,11,1) = Normal		Endif	'set 27N
	RouteBlock (&B[70], &R370, &R703)
When R801 = 1 or R180 = 1				Do			{set switches 	24N, 25N, 26N}
	If $switch (5,11,1) = Reversed, 	Then $switch (5,11,1) = Normal, B[25] = 0	Endif	'set 25N
	If $switch (4,11,1) = Reversed  	Then $switch (4,11,1) = Normal		Endif	'set 26N
	If $switch (8,10,1) = Reversed	Then $switch (8,10,1) = Normal		Endif	'set 24N
	RouteBlock (&B[80], &R180, &R801)
When R802 = 1 or R280 = 1				Do			{set switches 25N, 26R}
	If $switch (5,11,1) = Reversed, 	Then $switch (5,11,1) = Normal 		Endif	'set 25N
	If $switch (4,11,1) = Normal 		Then $switch (4,11,1) = Reversed		Endif	'set 26R
	RouteBlock (&B[80], &R280, &R802)
When R150 = 1 or R501 = 1				Do			{set switches 	21N, 22R}
	If $switch (17,11,1) = reversed	Then $switch(17,11,1) = normal		Endif	'set 21N
	If $switch (16,11,1) = normal		Then $switch(16,11,1) = reversed		Endif	'set 22R
	RouteBlock (&B[50], &R501, &R150)
When R250 = 1 or R502 = 1				Do			{set switches 	21N, 22N, 23N}
	If $switch (17,11,1) = reversed	Then $switch(17,11,1) = normal		Endif	'set 21N
	If $switch (16,11,1) = reversed	Then $switch(16,11,1) = normal		Endif	'set 22N
	If $switch (15,11,1) = reversed	Then $switch(15,11,1) = normal		Endif	'set 23N
	RouteBlock (&B[50], &R502, &R250)
When R350 = 1 or R503 = 1 				Do			{set switches 	21N, 22N, 23R}
	If $switch (17,11,1) = reversed	Then $switch(17,11,1) = normal		Endif	'set 21N
	If $switch (16,11,1) = reversed	Then $switch(16,11,1) = normal		Endif	'set 22N
	If $switch (15,11,1) = normal		Then $switch(15,11,1) = reversed		Endif	'set 23R
	RouteBlock (&B[50], &R503, &R350)
When R160  = 1 or R601 = 1				Do			{set switches 	21N, 22N}
	If $switch (17,11,1) = reversed	Then $switch(17,11,1) = normal		Endif	'set 21N
	If $switch (16,11,1) = reversed	Then $switch(16,11,1) = normal		Endif	'set 22N
	RouteBlock (&B[60], &R601, &R160)
When R260  = 1 or R602 = 1				Do			{set switches 	21R, 22N, 23N}
	If $switch (17,11,1) = normal		Then $switch(17,11,1) = reversed		Endif	'set 21R
	If $switch (16,11,1) = reversed	Then $switch(16,11,1) = normal		Endif	'set 22N
	If $switch (15,11,1) = reversed	Then $switch(15,11,1) = normal		Endif	'set 23N
	RouteBlock (&B[50], &R602, &R260)
When R360  = 1 or R603 = 1				Do			{set switches 	21R, 22N, 23R}
	If $switch (17,11,1) = normal		Then $switch(17,11,1) = reversed		Endif	'set 21R
	If $switch (16,11,1) = reversed	Then $switch(16,11,1) = normal		Endif	'set 22N
	If $switch (15,11,1) = normal		Then $switch(15,11,1) = reversed		Endif	'set 23R	
	RouteBlock (&B[50], &R603, &R360)
When R110 = 1 or R101 = 1				Do			{set switches 	61N, 66R}
	If $switch (20,22,1) = Reversed	Then $switch(20,22,1) = Normal		Endif	'set 61N
	If $switch (17,22,1) = Normal		Then $switch(17,22,1) = Reversed		Endif	'set 66R
	RouteBlock (&B[10], &R101, &R110)
When R210 = 1 or R102 = 1				Do			{set switches 	61N, 65N, 66N}
	If $switch (20,22,1) = Reversed	Then $switch(20,22,1) = Normal		Endif	'set 61N
	If $switch (15,22,1) = Reversed	Then $switch(15,22,1) = Normal		Endif	'set 65N	
	If $switch (17,22,1) = Reversed	Then $switch(17,22,1) = Normal		Endif	'set 66N
	RouteBlock (&B[10], &R102, &R210)
When R310 = 1 or R103 = 1				Do			{set switches 	61R, 62N, 64N, 65N}
	If $switch (16,21,1) > 0		Then $switch(16,21,1) = 0			Endif	'set 64/65 Dbl Slip straight thru
	If $switch (19,21,1) <> 2		Then $switch(19,21,1) = 2			Endif	'set 61/62 Dbl Slip 
	RouteBlock (&B[20], &R103, &R310)
When R410 = 1 or R104 = 1				Do			{set switches 	61R, 62R, 63N, 64N, 67N}
	If $switch (19,21,1) <> 1		Then $switch(19,21,1) = 1			Endif	'set 61/62 Dbl Slip diag
	If $switch (17,20,1) > 0		Then $switch(17,20,1) = 0			Endif	'set 63/64 Dbl Slip straight thru
	If $switch (16,20,1) = Reversed	Then $switch(16,20,1) = Normal		Endif	'set 67N
	RouteBlock (&B[90], &R104, &R410)
When R510 = 1 or R105 = 1				Do			{set switches 	61R, 62R, 63N, 64N, 67R}
	If $switch (20,22,1) = Normal		Then $switch(20,22,1) = Reversed		Endif	'set 61R
	If $switch (18,20,1) = Normal		Then $switch(18,20,1) = Reversed		Endif	'set 62R
	If $switch (17,20,1) > 0		Then $switch(17,20,1) = 0			Endif	'set 63/64 Dbl Slip straight thru
	If $switch (16,20,1) = Normal		Then $switch(16,20,1) = Reversed		Endif	'set 67R
	RouteBlock (&B[90], &R105, &R510)
When R220 = 1 or R202 = 1				Do			{set switches 	61N, 62N, 64N, 65R,}
	If $switch (20,22,1) = Reversed	Then $switch(20,22,1) = Normal		Endif	'set 61N
	If $switch (18,20,1) = Reversed	Then $switch(18,20,1) = Normal		Endif	'set 62N
	If $switch (16,21,1) <> 3		Then $switch(16,21,1) = 3			Endif	'set 64/65 Dbl Slip tk2 to 20
	RouteBlock (&B[20], &R202, &R220)
When R320 = 1 or R203 = 1				Do			{set switches 	61N, 62N, 64N, 65N,}
	If $switch (20,22,1) = Reversed	Then $switch(20,22,1) = Normal		Endif	'set 61N
	If $switch (18,20,1) = Reversed	Then $switch(18,20,1) = Normal		Endif	'set 62N
	If $switch (16,21,1) > 0		Then $switch(16,21,1) = 0			Endif	'set 64/65 Dbl Slip straight thru
	RouteBlock (&B[20], &R203, &R320)
When R420 = 1 or R204 = 1				Do			{set switches 	61N, 62R, 63N, 64N, 67N}
	If $switch (19,21,1) <> 3		Then $switch(19,21,1) = 3			Endif	'set 61/62 Dbl Slip
	If $switch (17,20,1) > 0		Then $switch(17,20,1) = 0			Endif	'set 63/64 Dbl Slip straight thru
	If $switch (16,20,1) = Reversed	Then $switch(16,20,1) = Normal		Endif	'set 67N
	RouteBlock (&B[90], &R204, &R420)
When R520 = 1 or R205 = 1				Do			{set switches 	61N, 62R, 63N, 64N, 67R}
	If $switch (19,21,1) <> 3		Then $switch(19,21,1) = 3			Endif	'set 61/62 Dbl Slip
	If $switch (17,20,1) > 0		Then $switch(17,20,1) = 0			Endif	'set 63/64 Dbl Slip straight thru
	If $switch (16,20,1) = Normal		Then $switch(16,20,1) = Reversed		Endif	'set 67R
	RouteBlock (&B[90], &R205, &R520)
When R290 = 1 or R902 = 1				Do			{set switches 	63N, 62N, 64R, 65R,}
	If $switch (17,20,1) <> 3		Then $switch(17,20,1) = 3			Endif	'set 63/64 Dbl Slip 
	If $switch (18,20,1) = Reversed	Then $switch(18,20,1) = Normal		Endif	'set 62N
	If $switch (16,21,1) <> 1		Then $switch(16,21,1) = 1			Endif	'set 64/65 Dbl Slip thru diag
	If $switch (15,22,1) = Normal		Then $switch(15,22,1) = Reversed		Endif	'set 65R
	RouteBlock (&B[90], &R902, &R290)
When R390 = 1 or R903 = 1				Do			{set switches 	63N, 62N, 64R, 65N,}
	If $switch (17,20,1) <> 3		Then $switch(17,20,1) = 3			Endif	'set 63/64 Dbl Slip 
	If $switch (18,20,1) = Reversed	Then $switch(18,20,1) = Normal		Endif	'set 62N
	If $switch (16,21,1) <> 2		Then $switch(16,21,1) = 2			Endif	'set 64/65 Dbl Slip
	If $switch (15,22,1) = Reversed	Then $switch(15,22,1) = Normal		Endif	'set 65N
	RouteBlock (&B[90], &R903, &R390)
When R490 = 1 or R904 = 1				Do			{set switches 	63N, 62N, 64N, 67N,}	
	If $switch (17,20,1) <> 0		Then $switch(17,20,1) = 0			Endif	'set 63/64 Dbl Slip straight thru 
	If $switch (18,20,1) = Reversed	Then $switch(18,20,1) = Normal		Endif	'set 62N
	If $switch (16,20,1) = Reversed	Then $switch(16,20,1) = Normal		Endif	'set 67N
	RouteBlock (&B[90], &R904, &R490)
When R590 = 1 or R905 = 1				Do			{set switches 	63N, 62N, 64N, 67R,}
	If $switch (17,20,1) <> 0		Then $switch(17,20,1) = 0			Endif	'set 63/64 Dbl Slip straight thru 
	If $switch (18,20,1) = Reversed	Then $switch(18,20,1) = Normal		Endif	'set 62N
	If $switch (16,20,1) = Normal		Then $switch(16,20,1) = Reversed		Endif	'set 67R
	RouteBlock (&B[90], &R905, &R590)
When R26 = 1 or R62 = 1 				Do			{set switches 	63R, 64R, 65R,}
	If $switch (17,20,1) <> 1		Then $switch(17,20,1) = 1			Endif	'set 63/64 Dbl Slip thru diag
	If $switch (16,21,1) <> 1		Then $switch(16,21,1) = 1			Endif	'set 64/65 Dbl Slip thru diag
	If $switch (15,22,1) = Normal		Then $switch(15,22,1) = Reversed		Endif	'set 65R
	RouteBlock (&B[90], &R62, &R26)
When R36 = 1 or R63 = 1 				Do			{set switches 	63R, 64R, 65N,}
	If $switch (17,20,1) <> 1		Then $switch(17,20,1) = 1			Endif	'set 63/64 Dbl Slip 
	If $switch (16,21,1) <> 2		Then $switch(16,21,1) = 2			Endif	'set 64/65 Dbl Slip
	If $switch (15,22,1) = Reversed	Then $switch(15,22,1) = Normal		Endif	'set 65N
	RouteBlock (&B[90], &R63, &R36)
When R46 = 1 or R64 = 1 				Do			{set switches 	63R, 64N, 67N,}
	If $switch (17,20,1) <> 2		Then $switch(17,20,1) = 2			Endif	'set 63/64 Dbl Slip 
	If $switch (16,20,1) = Reversed	Then $switch(16,20,1) = Normal		Endif	'set 67N
	RouteBlock (&B[90], &R64, &R46)
When R56 = 1 or R65 = 1 				Do			{set switches 	63R, 64N, 67R,}
	If $switch (17,20,1) <> 2		Then $switch(17,20,1) = 2			Endif	'set 63/64 Dbl Slip straight thru 
	If $switch (16,20,1) = Normal		Then $switch(16,20,1) = Reversed		Endif	'set 67R
	RouteBlock (&B[90], &R65, &R56)
When R130 = 1 or R301 = 1 				Do			{set switches 	50N, 51N}
	If $switch (1,19,1) = Reversed	Then $switch(1,19,1) = Normal			Endif	'set 50N
	If $switch (2,22,1) = Reversed	Then $switch(2,22,1) = Normal			Endif	'set 51N
	RouteBlock (&B[30], &R130, &R301)
When R230 = 1 or R302 = 1 				Do			{set switches 	50N, 51R, 52N}
	If $switch (1,19,1) = Reversed	Then $switch(1,19,1) = Normal			Endif	'set 50N
	If $switch (2,22,1) = Normal		Then $switch(2,22,1) = Reversed		Endif	'set 51R
	If $switch (4,22,1) = Reversed	Then $switch(4,22,1) = Normal			Endif	'set 52N	
	RouteBlock (&B[30], &R230, &R302)
When R330 = 1 or R303 = 1 				Do			{set switches 	50R, 52N, 53N}
	If $switch (1,19,1) = Normal		Then $switch(1,19,1) = Reversed		Endif	'set 50R
	If $switch (4,22,1) = Reversed	Then $switch(4,22,1) = Normal			Endif	'set 52N
	If $switch (5,21,1) = Reversed	Then $switch(5,21,1) = Normal			Endif	'set 53N
	RouteBlock (&B[40], &R330, &R303)
When R430 = 1 or R304 = 1 				Do			{set switches 	50R, 52N, 53R, 54R}
	If $switch (1,19,1) = Normal		Then $switch(1,19,1) = Reversed		Endif	'set 50R
	If $switch (4,22,1) = Reversed	Then $switch(4,22,1) = Normal			Endif	'set 52N
	If $switch (5,21,1) = Normal		Then $switch(5,21,1) = Reversed		Endif	'set 53R
	If $switch (6,20,1) = Normal		Then $switch(6,20,1) = Reversed		Endif	'set 54R
	RouteBlock (&B[40], &R430, &R304)
When R530  = 1 or R305 = 1				Do			{set switches 	50R, 52N, 53R, 54N}
	If $switch (1,19,1) = Normal		Then $switch (1,19,1) = Reversed		Endif	'set 50R
	If $switch (4,22,1) = Reversed	Then $switch (4,22,1) = Normal		Endif	'set 52N
	If $switch (5,21,1) = Normal		Then $switch (5,21,1) = Reversed		Endif	'set 53R
	If $switch (6,20,1) = Reversed	Then $switch (6,20,1) = Normal		Endif	'set 54N
	RouteBlock (&B[40], &R530, &R305)
When R240 = 1 or R402 = 1				Do			{set switches 	50N, 52R}
	If $switch (1,19,1) = Reversed	Then $switch(1,19,1) = Normal			Endif	'set 50N
	If $switch (4,22,1) = Normal		Then $switch(4,22,1) = Reversed		Endif	'set 52R
	RouteBlock (&B[40], &R240, &R402)
When R340 = 1 or R403 = 1				Do			{set switches 	50N, 52N, 53N}
	If $switch (1,19,1) = Reversed	Then $switch(1,19,1) = Normal			Endif	'set 50N
	If $switch (4,22,1) = Reversed	Then $switch(4,22,1) = Normal			Endif	'set 52N
	If $switch (5,21,1) = Reversed	Then $switch (5,21,1) = Normal		Endif	'set 53N
	RouteBlock (&B[40], &R340, &R403)
When R440 = 1 or R404 = 1				Do			{set switches 	50N, 52N, 53R, 54R}
	If $switch (1,19,1) = Reversed	Then $switch(1,19,1) = Normal			Endif	'set 50N
	If $switch (4,22,1) = Reversed	Then $switch(4,22,1) = Normal			Endif	'set 52N
	If $switch (5,21,1) = Normal		Then $switch (5,21,1) = Reversed		Endif	'set 53R
	If $switch (6,20,1) = Normal		Then $switch (6,20,1) = Reversed		Endif	'set 54R
	RouteBlock (&B[40], &R440, &R404)
When R540 = 1 or R405 = 1				Do			{set switches 	50N, 52N, 53R, 54N}
	If $switch (1,19,1) = Reversed	Then $switch(1,19,1) = Normal			Endif	'set 50N
	If $switch (4,22,1) = Reversed	Then $switch(4,22,1) = Normal			Endif	'set 52N
	If $switch (5,21,1) = Normal		Then $switch (5,21,1) = Reversed		Endif	'set 53R
	If $switch (6,20,1) = Reversed	Then $switch (6,20,1) = Normal		Endif	'set 54N
	RouteBlock (&B[40], &R540, &R405)


{Section 10	@@@@@@@@@@@@@@@@@@@@ Block Control @@@@@@@@@@@@@@@@@@@@@@@@@@@}
		
When B[85] = 4, B[86] = 0						{Spiral and Midland Junction}	Do B[86] = 4
When B[85] = 4, B[86] = 4, B[84] = 0									Do B[85] = 2, B[86] = 2, B[84]=2
When B[83] = 3, B[84] = 0											Do B[84] = 3
When B[83] = 3, B[84] = 3, B[86] = 0									Do B[83] = 1, B[84]=1, B[86]=1
When B[83] = 4, B[82] = 0, {T8N}$switch(15,3,1)=normal						Do B[82] = 4
When B[83] = 4, B[82] = 4, B[81] = 0									Do B[83] = 2, B[82] = 2, B[81]=2
When B[83] = 4, B[99] = 0, {T8R}$switch(15,3,1)=reversed						Do B[99] = 4
When B[83] = 4, B[99] = 4, B[98] = 0									Do B[83] = 2, B[99] = 2, B[98]=2
When B[85] = 3, B[51] = 0, {T56N}$switch(33,1,1)=normal	{Spiral to Summit Platforms}	Do B[85] = 1, B[51] = 1
When B[85] = 3, B[52] = 0, {T56R}$switch(33,1,1)=reversed, {T55N}$switch(32,2,1)=reversed	Do B[85] = 1, B[52] = 1
When B[85] = 3, B[53] = 0, {T56R}$switch(33,1,1)=reversed, {T55R}$switch(32,2,1)=normal, 	Do B[85] = 1, B[53] = 1
When B[75] = 3, B[51] = 0, {T51N}$switch(22,1,1)=normal {Summit Line to Summit Platforms}	Do B[75] = 1, B[51] = 2
When B[75] = 3, B[52] = 0, {T51R}$switch(22,1,1)=reversed, {T52N}$switch(23,2,1)=reversed	Do B[75] = 1, B[52] = 2
When B[75] = 3, B[53] = 0, {T51R}$switch(22,1,1)=reversed, {T52R}$switch(23,2,1)=normal, 
				{T53N}$switch(24,3,1)=reversed						Do B[75]=1, B[53]=2, B[55]=2
When B[75] = 3, B[54] = 0, {T51R}$switch(22,1,1)=reversed, 
				{T52R}$switch(23,2,1)=normal, {T53R}$switch(24,3,1)=normal		Do B[75] = 1, B[54] = 2
When B[75] = 4, B[72] = 0								{Summit Line}	Do B[72] = 4
When B[75] = 4, B[72] = 4, B[71] = 0									Do B[75] = 2, B[72] = 2, B[71]=2
When B[70] = 3, B[71] = 0											Do B[71] = 3
When B[70] = 3, B[71] = 3, B[72] = 0									Do B[70] = 1, B[71] = 1, B[72]=1
When B[25] < 5 and B[70] = 2 and {T27N} $switch (2,11,1) = reversed   {B[25] Signalling}	Do B[25] = 2
When B[25] < 5 and B[70] = 4 and {T27N} $switch (2,11,1) = reversed				Do B[25] = 4 
When B[25] < 5 and B[80] = 2 and {T26R} $switch (4,11,1) = reversed				Do B[25] = 2 
When B[25] < 5 and B[80] = 4 and {T26R} $switch (4,11,1) = reversed				Do B[25] = 4 
When B[25] < 5 and B[70] = 1 and {T27N} $switch (2,11,1) = reversed				Do B[25] = 1 
When B[25] < 5 and B[70] = 3 and {T27N} $switch (2,11,1) = reversed				Do B[25] = 3 
When B[25] < 5 and B[80] = 1 and {T26R} $switch (4,11,1) = reversed				Do B[25] = 1 
When B[25] < 5 and B[80] = 3 and {T26R} $switch (4,11,1) = reversed				Do B[25] = 3 
When B[80] = 3, B[81] = 0								{Short Line}	Do B[81] = 3
When B[80] = 3, B[81] = 3, B[82] = 0									Do B[80] = 1, B[81] = 1, B[82]=1
When B[80] = 4, B[21] = 0, {T26N}$switch(4,11,1)=normal  {Blocks 70 and 80 to Upper Junct. Platforms}	Do B[80]= 2, B[21]=2
When B[80] = 4, B[22] = 0, {T26R}$switch(4,11,1)=reversed, B[25] < 5				Do B[80] = 2, B[25]=2, B[22] = 2
When B[70] = 4, B[23] = 0, {T27R}$switch(2,11,1)=normal						Do B[70] = 2, B[23] = 2
When B[70] = 4, B[22] = 0, {T27N}$switch(2,11,1)=reversed, 
				{T25N}$switch(5,11,1)=normal, B[25] < 5					Do B[70] = 2, B[25]=2, B[22] = 2
When B[70] = 4, B[21] = 0, {T27N}$switch(2,11,1)=reversed, 
				{T25R}$switch(5,11,1)=reversed, B[25] < 5					Do B[70] = 2, B[25]=2, B[21] = 2
When B[50] = 3, B[21] = 0, {T22R}$switch(16,11,1)=reversed	{Blocks 50 and 60 to Upper J}	Do B[50] = 1, B[21] = 1
When B[50] = 3, B[22] = 0, {T22N}$switch(16,11,1)=normal, {T23N}$switch(15,11,1)=normal	Do B[50] = 1, B[22] = 1
When B[50] = 3, B[23] = 0, {T22N}$switch(16,11,1)=normal, {T23R}$switch(15,11,1)=reversed	Do B[50] = 1, B[23] = 1
When B[60] = 3, B[21] = 0, 											Do B[60] = 1, B[21] = 1
When B[30] = 3, B[31] = 0						{UM in the Up Direction}	Do B[31] = 3
When B[40] = 3, B[31] = 0, {T30R}$switch(1,19,1)=reversed 						Do B[31] = 3
When B[30] = 3, B[31] = 3, B[32] = 0, $signal{31}(8,14,1) <> "RR"					Do B[30] = 1, B[31] = 1, B[32]=1
When B[40] = 3, B[31] = 3, B[32] = 0, {T30R}$switch(1,19,1)=reversed, 
				$signal{31}(8,14,1) <> "RR"							Do B[40] = 1, B[31] = 1, B[32]=1
When B[32] = 1, B[33] = 0, $signal{32}(14,14,1) <> "RR"						Do B[33] = 1
When B[32] = 11, B[33] = 0, $signal{32}(14,14,1) <> "RR"						Do B[33] = 1
When B[50] = 4, B[33] = 0, {T21N}$switch(17,11,1)=normal		{UM in the Dn Direction}Do B[33] = 4
When B[50] = 4, B[33] = 4, B[32] = 0, $signal{32}(14,14,1) <> "RR"				Do B[50] = 2, B[33] = 2, B[32]=2
When B[32] = 2, B[31] = 0, $signal{31}(8,14,1) <> "RR"						Do B[31] = 2 
When B[32] = 12, B[31] = 0, $signal{31}(8,14,1) <> "RR"						Do B[31] = 2
When B[50] = 4, B[43] = 0, {T21R}$switch(17,11,1)=reversed		{DM in the Dn Direction}Do B[43] = 4
When B[60] = 4, B[43] = 0											Do B[43] = 4
When B[50] = 4, B[43] = 4, B[42] = 0, {T21R}$switch(17,11,1)=reversed, 
				$signal{42}(14,15,1) <> "RR"							Do B[50] = 2, B[43] = 2, B[42]=2
When B[60] = 4, B[43] = 4, B[42] = 0, $signal{42}(14,15,1) <> "RR"				Do B[60] = 2, B[43] = 2, B[42]=2
When B[42] = 2, B[41] = 0, $signal{41}(8,15,1) <> "RR"						Do B[41] = 2
When B[42] = 12, B[41] = 0, $signal{41}(8,15,1) <> "RR"						Do B[41] = 2
When B[40] = 3, B[41] = 0, {T30N}$switch(1,19,1)=normal, 		{DM in the Up Direction}Do B[41] = 3
When B[40] = 3, B[41] = 3, B[42] = 0, $signal{41}(8,15,1) <> "RR"					Do B[40] = 1, B[41] = 1, B[42]=1
When B[42] = 1, B[43] = 0, $signal{42}(14,15,1) <> "RR"						Do B[43] = 1
When B[42] = 11, B[43] = 0, $signal{42}(14,15,1) <> "RR"						Do B[43] = 1
When B[30] = 4, B[1] = 0, {T1R}$switch(2,22,1)=normal	{Block 30 to Lower Junct 1 and 2}	Do B[30] = 2, B[1] = 2
When B[30] = 4, B[2] = 0, {T1N}$switch(2,22,1)=reversed						Do B[30] = 2, B[2] = 2
When B[40] = 4, B[2] = 0, {T2R}$switch(4,22,1)=reversed  	{Block 40 to Lower Junct}	Do B[40] = 2, B[2] = 2
When B[40] = 4, B[3] = 0, {T2N}$switch(4,22,1)=normal, {T3N}$switch(5,21,1)=normal		Do B[40] = 2, B[3] = 2
When B[40] = 4, B[4] = 0, {T2N}$switch(4,22,1)=normal, {T3R}$switch(5,21,1)=reversed, 
				{T4N}$switch(6,20,1)=reversed							Do B[40] = 2, B[4] = 2
When B[40] = 4, B[5] = 0, {T2N}$switch(4,22,1)=normal, {T3R}$switch(5,21,1)=reversed, 
				{T4R}$switch(6,20,1)=normal							Do B[40] = 2, B[5] = 2
When B[10] = 3, B[1] = 0, {T11R}$switch(17,22,1)=reversed	{Blk 10/20/90 to Lower Junct}	Do B[10] = 1, B[1] = 1
When B[10] = 3, B[2] = 0, {T11N}$switch(17,22,1)=normal, {T12N}$switch(15,22,1)=normal	Do B[10] = 1, B[2] = 1
When B[20] = 3, B[2] = 0, {T20N}$switch(18,20,1)=normal, {T12R}$switch(15,22,1)=reversed	Do B[20] = 1, B[2] = 1
When B[20] = 3, B[3] = 0, {T20N}$switch(18,20,1)=normal, {T12N}$switch(15,22,1)=normal	Do B[20] = 1, B[3] = 1
When B[90] = 3, B[4] = 0, {T13N}$switch(17,20,1)=0, {T14N}$switch(16,20,1)=normal or
            B[90] = 3, B[4] = 0, {T13N}$switch(17,20,1)=2, {T14N}$switch(16,20,1)=normal	Do B[90] = 1, B[4] = 1
When B[90] = 3, B[5] = 0, {T13N}$switch(17,20,1)=0, {T14R}$switch(16,20,1)=reversed or
            B[90] = 3, B[5] = 0, {T13N}$switch(17,20,1)=2, {T14R}$switch(16,20,1)=reversed Do B[90] = 1, B[5] = 1
When B[90] = 3, B[2] = 0, {T13R} and {T12R}$switch(16,21,1)=1					Do B[90] = 1, B[20] = 1, B[2] = 1
When B[90] = 3, B[3] = 0, {T13R} and {T12N}$switch(16,21,1)=2					Do B[90] = 1, B[20] = 1, B[3] = 1
When B[20] = 3, B[90] = 1, {T20R}$switch(18,20,1)=reversed 	{Extra Blk 20/90 Commands}	Do B[20] = 1
When B[20] = 4, B[90] = 2, {T13R}$switch(17,20,1)=1	 or B[20] = 4, B[90] = 2, 
				{T13R}$switch(17,20,1)=2							Do B[20] = 2
When B[90] = 4, B[20] = 0, {T20R}$switch(18,20,1)=reversed						Do B[20] = 4
When B[90] = 4, B[20] = 2, {T20R}$switch(18,20,1)=reversed						Do B[90] = 2
When B[11] = 2, B[12] = 0	or	B[11] = 12, B[12] = 0			{Base Tunnel}	Do B[12] = 1
When B[12] = 2, B[11] = 0	or	B[12] = 12, B[11] = 0						Do B[11] = 1
When B[10] = 4, B[11] = 0											Do B[10] = 2, B[11] = 2
When B[20] = 4, B[11] = 0, {T10R}$switch(20,22,1)=reversed	Do 
					If 	{T13N}$switch(17,20,1)=0 or {T13N}$switch(17,20,1)=2	Then	B[20] = 2, B[11] = 2 Endif
When B[20] = 4, B[12] = 0, {T10N}$switch(20,22,1)=normal	Do 
					If	{T13N}$switch(17,20,1)=0 or {T13N}$switch(17,20,1)=2	Then	B[20] = 2, B[12] = 2 Endif
When B[90] = 4, B[93] = 0, {T20N}$switch(18,20,1)=normal, {T90N}$switch(17,20,1)=0 or
            B[90] = 4, B[93] = 0, {T20N}$switch(18,20,1)=normal, {T90N}$switch(17,20,1)=3  Do B[93] = 3
When B[90] = 4, B[6] = 0, {T90R}$switch(17,20,1)=1 	or B[90] = 4, B[6] = 0, 
				{T90R}$switch(17,20,1)=2							Do B[90] = 2, B[6] = 2
When B[90] = 4, B[93] = 3, B[94] = 0									Do B[90] = 2, B[93] = 1, B[94]=1
When B[95] = 3, B[91] = 0, {T95N}$switch(23,8,1)=normal			{Midland Loop}	Do B[95] = 1, B[91] = 1
When B[95] = 3, B[92] = 0, {T95R}$switch(23,8,1)=reversed						Do B[95] = 1, B[92] = 1
When B[96] = 3, B[98] = 0											Do B[98] = 3
When B[96] = 3, B[98] = 3, B[99] = 0									Do B[96] = 1, B[98] = 1, B[99]=1
When B[96] = 4, B[91] = 0, {T96N}$switch(14,7,1)=normal						Do B[96] = 2, B[91] = 2
When B[96] = 4, B[92] = 0, {T96R}$switch(14,7,1)=reversed						Do B[96] = 2, B[92] = 2
When B[95] = 4, B[94] = 0											Do B[94] = 4
When B[95] = 4, B[94] = 4, B[93] = 0									Do B[95] = 2, B[94] = 2, B[93]=2
When B[85] = 0 		Do	If B[86] = 2 or B[86] = 4	{Spiral and Midland Junction}	Then	B[86] = 0	Endif
When B[86] = 0, B[84] = 2 or B[86] = 0, B[84] = 4							Do B[84] = 0
When B[83] = 0, B[84] = 1 or B[83] = 0, B[84] = 3							Do B[84] = 0
When B[83] = 0, B[82] = 2 or B[83] = 0, B[82] = 4							Do B[82] = 0
When B[82] = 0, B[81] = 2											Do B[81] = 0
When B[83] = 0, B[99] = 2 or B[83] = 0, B[99] = 4							Do B[99] = 0
When B[99] = 0, B[98] = 2											Do B[98] = 0
When B[84] = 0, B[86] = 1											Do B[86] = 0
When B[85] = 0, B[51] = 1						{Spiral to Summit Platforms}	Do B[51] = 0
When B[85] = 0, B[52] = 1											Do B[52] = 0
When B[85] = 0, B[53] = 1											Do B[53] = 0
When B[75] = 0, B[51] = 2					{Summit Line to Summit Platforms}	Do B[51] = 0
When B[75] = 0, B[52] = 2											Do B[52] = 0
When B[75] = 0, B[53] = 2, B[55] = 2									Do B[53] = 0, B[55]=0
When B[75] = 0, B[54] = 2											Do B[54] = 0
When B[75] = 0 				Do	If B[72] = 2 or B[72] = 4	{Summit Line}	Then	B[72] = 0	Endif
When B[72] = 0, B[71] = 2											Do B[71] = 0
When B[70] = 0 				Do	If B[71] = 1 or B[71] = 3				Then	B[71] = 0	Endif
When B[71] = 0, B[72] = 1											Do B[72] = 0
When B[80] = 0, B[81] = 1 or B[80] = 0, B[81] = 3					{Short Line}Do B[81] = 0
When B[81] = 0, B[82] = 1											Do B[82] = 0
When B[80] = 0, B[21] = 2, {T25N}$switch(5,11,1)=normal,	{T24N}$switch(8,10,1)=normal	Do B[21] = 0
When B[80] = 0, B[22] = 2, {T26R}$switch(4,11,1)=reversed, 						Do B[22] = 0
When B[70] = 0, B[23] = 2, {T27R}$switch(2,11,1)=normal						Do B[23] = 0
When B[70] = 0, B[22] = 2, {T26N}$switch(4,11,1)=normal,						Do B[22] = 0
When B[70] = 0, B[21] = 2, {T25R}$switch(5,11,1)=reversed, 	{T25N}$switch(5,11,1)=normal	Do B[21] = 0
When R41 = 0					Do	If B[21] = 2, 					Then B[21] = 0	Endif
When R14 = 0					Do	If B[24] = 1, 					Then B[24] = 0	Endif
When B[25] < 10 and B[70] = 0 and {T26N} $switch (4,11,1) = normal				Do B[25] = 0 
When B[25] < 10 and B[80] = 0 and {T26R} $switch (4,11,1) = reversed				Do B[25] = 0 
When B[50] = 0, B[21] = 1, {T22R}$switch(16,11,1)=reversed	{Blocks 50 and 60 to Upper J}	Do B[21] = 0
When B[50] = 0, B[22] = 1											Do B[22] = 0
When B[50] = 0, B[23] = 1											Do B[23] = 0
When B[60] = 0, B[21] = 1	{T22N}$switch(16,11,1)=normal						Do B[21] = 0
When B[40] = 0, {T30R}$switch(1,19,1)=reversed	Do If B[31] = 1 or B[31] = 3 {UM in the Up Dir. } Then B[31] = 0	Endif
When B[30] = 0, {T30N}$switch(1,19,1)=normal	Do If B[31] = 1 or B[31] = 3			Then B[31] = 0		Endif
When B[31] = 0, B[32] = 1											Do B[32] = 0
When B[32] = 0, B[33] = 1											Do B[33] = 0
When B[40] = 0 						Do If B[41] = 1 or B[41] = 3	{DM in the Up Dir.} Then B[41] = 0	Endif
When B[41] = 0, B[42] = 1											Do B[42] = 0
When B[42] = 0, B[43] = 1											Do B[43] = 0
When B[50] = 0 						Do	If B[33] = 2 or B[33] = 4 {UM in the Down Dir.} Then B[33] = 0 Endif
When B[33] = 0, B[32] = 2											Do B[32] = 0
When B[32] = 0, B[31] = 2											Do B[31] = 0
When B[50] = 0, {T21R}$switch(17,11,1)=reversed	Do	If B[43] = 2 or B[43] = 4  {DM in the Down Dir.}Then B[43] = 0 Endif
When B[60] = 0, {T21N}$switch(17,11,1)=normal	Do	If B[43] = 2 or B[43] = 4		Then B[43] = 0	Endif
When B[43] = 0, B[42] = 2											Do B[42] = 0
When B[42] = 0, B[41] = 2											Do B[41] = 0
When B[30] = 0, B[1] = 2			{Block 30 to Lower Junction Platforms 1 and 2}	Do B[1] = 0
When B[30] = 0, B[2] = 2, {T2N} $switch(4,22,1)=normal						Do B[2] = 0
When B[40] = 0, B[2] = 2, {T2R} $switch(4,22,1)=reversed	{Block 40 to Lower Junction Platforms}	Do B[2] = 0
When B[40] = 0, 						Do	If	B[3] = 2				Then	B[3] = 0	
								ElseIf	B[4] = 2				Then	B[4] = 0
								ElseIf	B[5] = 2				Then	B[5] = 0	Endif	
When B[10] = 0, B[1] = 1						{Block 10 to Lower Junction Platforms}	Do	B[1] = 0
When B[10] = 0, B[2] = 1, {T12N} $switch(15,22,1)=normal	{Block 20 to Lower Junction Platforms}	Do	B[2] = 0
When B[20] = 0, B[2] = 1, {T12R} $switch(15,22,1)=reversed								Do	B[2] = 0
When B[20] = 0, B[3] = 1													Do	B[3] = 0
When B[90] = 0, B[4] = 1						{Block 90 to Lower Junction Platforms}	Do	B[4] = 0
When B[90] = 0, B[5] = 1													Do	B[5] = 0
When B[20] = 0, B[12] = 2, 									{Base Tunnel}		Do	B[12] = 0
When B[10] = 0, B[11] = 2, {T10N} $switch(20,22,1)=normal								Do	B[11] = 0
When B[20] = 0, B[11] = 2, {T10R} $switch(20,22,1)=reversed								Do	B[11] = 0
When B[11] = 1, B[12] = 0 													Do	B[11] = 0
When B[12] = 1, B[11] = 0 													Do	B[12] = 0
When B[90] = 0, B[20] = 2, {T20R} $switch(18,20,1)=reversed				{Lower East Throat}	Do	B[20] = 0
When B[20] = 0, B[10] = 2, {T10R} $switch(20,22,1)=reversed								Do	B[10] = 0
When B[90] = 0, B[20] = 4, {T20R} $switch(18,20,1)=reversed								Do	B[20] = 0
When B[20] = 0, B[10] = 4, {T10R} $switch(20,22,1)=reversed								Do	B[10] = 0
When B[20] = 1, B[90] = 0, {T13R}$switch(16,21,1)=1 or B[20] = 1, B[90] = 0, {T13R}$switch(16,21,1)=2	Do	B[20] = 0
When B[90] = 0, B[6] = 2			{Midland Line Up Direction and Trains into Lower Yard}	Do	B[6] = 0
When B[90] = 0, B[93] = 1 or B[90] = 0, B[93] = 3									Do	B[93] = 0
When B[93] = 0, B[94] = 1 													Do	B[94] = 0
When B[95] = 0, B[91] = 1													Do	B[91] = 0
When B[95] = 0, B[92] = 1													Do	B[92] = 0
When B[96] = 0, B[98] = 3 or B[96] = 0, B[98] = 1									Do	B[98] = 0
When B[98] = 0, B[99] = 1													Do	B[99] = 0
When B[94] = 0, B[93] = 2 								{Midland Line Down Direction}	Do	B[93] = 0
When B[96] = 0, B[91] = 2													Do	B[91] = 0
When B[96] = 0, B[92] = 2													Do	B[92] = 0
When B[95] = 0, B[94] = 4 or B[95] = 0, B[94] = 2									Do	B[94] = 0
When B[99] = 0, B[98] = 2													Do	B[98] = 0



{Section 11	@@@@@@@@@@@@@@@@@@ Block colouration @@@@@@@@@@@@@@@@@@@@}

When B[6] = 1 or B[6] = 2					Do 	$color block (21,19,1) = Green, 
When B[6] > 4							Do 	$color block (21,19,1) = Red, 
When B[6] = 0							Do	$color block (21,19,1) = Grey

When B[1] = 1 or B[1] = 2					Do 	$color block (11,23,1) = Green, 
When Control[1] > 9						Do 	$color block (11,23,1) = Yellow,	
When B[1] > 4 and Control[1] < 10	 			Do 	$color block (11,23,1) = Red, 
When B[1] = 0							Do	$color block (11,23,1) = Grey

When B[2] = 1 or B[2] = 2					Do 	$color block (11,22,1) = Green, 
When Control[2] > 9						Do 	$color block (11,22,1) = Yellow,	
When B[2] > 4 and Control[2] < 10				Do 	$color block (11,22,1) = Red, 
When B[2] = 0							Do	$color block (11,22,1) = Grey

When B[3] = 1 or B[3] = 2					Do 	$color block (11,21,1) = Green, 
When Control[3] > 9						Do 	$color block (11,21,1) = Yellow,
When B[3] > 4 and Control[3] < 10 				Do 	$color block (11,21,1) = Red, 
When B[3] = 0							Do	$color block (11,21,1) = Grey

When B[4] = 1 or B[4] = 2					Do 	$color block (11,20,1) = Green, 
When Control[4] > 9						Do 	$color block (11,20,1) = Yellow,
When B[4] > 4 and Control[4] < 10				Do 	$color block (11,20,1) = Red, 
When B[4] = 0							Do	$color block (11,20,1) = Grey

When B[5] = 1 or B[5] = 2					Do 	$color block (11,19,1) = Green, 
When Control[5] > 9						Do 	$color block (11,19,1) = Yellow,
When B[5] > 4 and Control[5] < 10				Do 	$color block (11,19,1) = Red, 
When B[5] = 0							Do	$color block (11,19,1) = Grey

When B[30] = 1 or B[30] = 2						Do 	$color block (1,21,1)=Green
				If $switch{T30}(1,19,1)=normal	Then  $color block(1,19,1)=Green		Endif
				If $switch{T1}(2,22,1)=normal		Then	$color block(3,23,1)=Green
										Else	$color block(3,22,1)=Green
											$color block(4,22,1)=Green		Endif
When B[30] = 3 or B[30] = 4						Do 	$color block (1,21,1)=Blue
				If $switch{T30}(1,19,1)=normal	Then  $color block(1,19,1)=Blue		Endif
				If $switch{T1}(2,22,1)=normal		Then	$color block(3,23,1)=Blue
										Else	$color block(3,22,1)=Blue
											$color block(4,22,1)=Blue		Endif
When B[30] > 4								Do 	$color block (1,21,1)=Red
				If $switch{T30}(1,19,1)=normal	Then  $color block(1,19,1)=Red		Endif
				If $switch{T1}(2,22,1)=normal		Then	$color block(3,23,1)=Red
										Else	$color block(3,22,1)=Red
											$color block(4,22,1)=Red		Endif
When B[30] = 0								Do 	$color block (1,21,1)=Grey
				If $switch{T30}(1,19,1)=normal	Then  $color block(1,19,1)= Grey		Endif
				If $switch{T1}(2,22,1)=normal		Then	$color block(3,23,1)= Grey
										Else	$color block(3,22,1)= Grey
											$color block(4,22,1)= Grey		Endif

When B[40] = 1 or B[40] = 2						Do 	$color block (3,21,1)=Green
				If $switch{T30}(1,19,1)=normal	Then  $color block(2,19,1)=Green
										Else	$color block(1,19,1)=Green	 	Endif
				If $switch{T2}(4,22,1)=reversed	Then  $color block(4,22,1)=Green
										Else	$color block(4,21,1)=Green	 	
					If $switch{T3}(5,21,1)=normal	Then  $color block(6,21,1)=Green
										Else	$color block(6,20,1)=Green	 	
					If $switch{T4}(6,20,1)=normal	Then  $color block(7,19,1)=Green	
										Else	$color block(7,20,1)=Green	 	Endif	Endif	Endif
When B[40] = 3 or B[40] = 4						Do	$color block (3,21,1) = Blue
				If $switch{T30}(1,19,1)=normal	Then  $color block(2,19,1)=Blue
										Else	$color block(1,19,1)=Blue		Endif
				If $switch{T2}(4,22,1)=reversed	Then  $color block(4,22,1)=Blue
										Else	$color block(4,21,1)=Blue	
					If $switch{T3}(5,21,1)=normal	Then  $color block(6,21,1)=Blue
										Else	$color block(6,20,1)=Blue	
					If $switch{T4}(6,20,1)=normal	Then  $color block(7,19,1)=Blue	
										Else	$color block(7,20,1)=Blue		Endif	Endif	Endif

When B[40] > 4								Do 	$color block (3,21,1)=Red, 
				If $switch{T30}(1,19,1)=normal	Then  $color block(2,19,1)=Red
										Else	$color block(1,19,1)=Red		Endif
				If $switch{T2}(4,22,1)=reversed	Then  $color block(4,22,1)=Red
										Else	$color block(4,21,1)=Red	
					If $switch{T3}(5,21,1)=normal	Then  $color block(6,21,1)=Red
										Else	$color block(6,20,1)=Red	
					If $switch{T4}(6,20,1)=normal	Then  $color block(7,19,1)=Red
										Else	$color block(7,20,1)=Red		Endif	Endif	Endif
When B[40] = 0								Do	$color block (3,21,1)=Grey
				If $switch{T30}(1,19,1)=normal	Then  $color block(2,19,1)=Grey
										Else	$color block(1,19,1)=Grey		Endif
				If $switch{T2}(4,22,1)=reversed	Then  $color block(4,22,1)=Grey
										Else	$color block(4,21,1)=Grey	
					If $switch{T3}(5,21,1)=normal	Then  $color block(6,21,1)=Grey 
										Else	$color block(6,20,1)=Grey	
					If $switch{T4}(6,20,1)=normal	Then  $color block(7,19,1)=Grey	
										Else	$color block(7,20,1)=Grey		Endif	Endif	Endif

When B[31] = 1 or B[31] = 2 						Do 	$color block (5,14,1) = Green,
When B[31] = 3								Do 	$color block (5,14,1) = Blue
When B[31] = 7								Do 	$color block (5,14,1) = Blue
When B[31] > 7								Do 	$color block (5,14,1) = Red, 
When B[31] = 0								Do	$color block (5,14,1) = Grey,	

When B[32] = 1 or B[32] = 2 						Do	$color block (11,14,1) = Green,
When B[32] > 4								Do 	$color block (11,14,1) = Red, 
When B[32] = 0								Do	$color block (11,14,1) = Grey,	

When B[33] = 1 or B[33] = 2						Do 	$color block (17,14,1) = Green,
When B[33] = 4								Do 	$color block (17,14,1) = Blue 
When B[33] = 7								Do 	$color block (17,14,1) = Blue
When B[33] > 7								Do 	$color block (17,14,1) = Red, 
When B[33] = 0								Do	$color block (17,14,1) = Grey,	

When B[41] = 1 or B[41] = 2						Do 	$color block (5,15,1) = Green,
When B[41] = 3								Do 	$color block (5,15,1) = Blue 
When B[41] = 7								Do 	$color block (5,15,1) = Blue
When B[41] > 7								Do 	$color block (5,15,1) = Red,
When B[41] = 0								Do	$color block (5,15,1) = Grey,	

When B[42] = 1 or B[42] = 2 						Do 	$color block (11,15,1) = Green, 
When B[42] > 4								Do 	$color block (11,15,1) = Red, 
When B[42] = 0								Do	$color block (11,15,1) = Grey,	

When B[43] = 1 or B[43] = 2 						Do 	$color block (18,15,1) = Green,
When B[43] = 4								Do 	$color block (18,15,1) = Blue 
When B[43] = 7								Do 	$color block (18,15,1) = Blue
When B[43] > 7								Do 	$color block (18,15,1) = Red,  
When B[43] = 0								Do	$color block (18,15,1) = Grey,	

When B[50] = 1 or B[50] = 2 						Do 	$color block (17,11,1)=Green
				If $switch{T21}(17,11,1)=normal	Then  $color block(18,11,1)=Green
										Else	$color block(18,10,1)=Green	Endif
				If $switch{T22}(16,11,1)=reversed	Then  $color block(15,10,1)=Green
										Else	$color block(15,11,1)=Green	
				If $switch{T23}(15,11,1)=normal	Then  $color track(14,11,1)=Green
										Else	$color track(14,12,1)=Green	Endif	Endif
When B[50] = 3 or B[50] = 4 						Do 	$color block (17,11,1)=Blue
				If $switch{T21}(17,11,1)=normal	Then  $color block(18,11,1)=Blue
										Else	$color block(18,10,1)=Blue		Endif
				If $switch{T22}(16,11,1)=reversed	Then  $color block(15,10,1)=Blue
										Else	$color block(15,11,1)=Blue	
				If $switch{T23}(15,11,1)=normal	Then  $color track(14,11,1)=Blue
										Else	$color track(14,12,1)=Blue		Endif	Endif
When B[50] > 4								Do 	$color block (17,11,1)=Red
				If $switch{T21}(17,11,1)=normal	Then  $color block(18,11,1)=Red
										Else	$color block(18,10,1)=Red		Endif
				If $switch{T22}(16,11,1)=reversed	Then  $color block(15,10,1)=Red
										Else	$color block(15,11,1)= Red			
				If $switch{T23}(15,11,1)=normal	Then  $color track(14,11,1)= Red
										Else	$color track(14,12,1)= Red		Endif 	Endif
When B[50] = 0								Do	$color block (17,11,1) = Grey
				If $switch{T21}(17,11,1)=normal	Then  $color block(18,11,1)=Grey
										Else	$color block(18,10,1)=Grey		Endif
				If $switch{T22}(16,11,1)=reversed	Then  $color block(15,10,1)=Grey

										Else	$color block(15,11,1)=Grey	
				If $switch{T23}(15,11,1)=normal	Then  $color track(14,11,1)=Grey
										Else	$color track(14,12,1)=Grey		Endif	Endif

When B[60] = 1 or B[60] = 2						Do 	$color block (17,10,1) = Green
											$color block (18,10,1) = Green
											$color block (15,10,1) = Green
When B[60] = 3 or B[60] = 4  						Do 	$color block (17,10,1) = Blue 
											$color block (18,10,1) = Blue
											$color block (15,10,1) = Blue
When B[60] > 4								Do 	$color block (17,10,1) = Red 
											$color block (18,10,1) = Red
											$color block (15,10,1) = Red
When B[60] = 0								Do	$color block (17,10,1) = Grey
											$color block (18,10,1) = Grey
											$color block (15,10,1) = Grey

When B[24] = 1								Do 	$color block (5,9,1) = Green, 
When B[24] > 4								Do 	$color block (5,9,1) = Red, 
When B[24] = 0								Do	$color block (5,9,1) = Grey

When B[21] = 1 or B[21] = 2						Do 	$color block (11,10,1) = Green, 
When Control[21] > 10							Do 	$color block (11,10,1) = Yellow, 
When B[21] > 4, Control[21] < 9					Do 	$color block (11,10,1) = Red, 
When B[21] = 0								Do	$color block (11,10,1) = Grey,	

When B[22] = 1 or B[22] = 2 						Do	$color block (11,11,1) = Green, 	
When Control[22] > 10							Do 	$color block (11,11,1) = Yellow, 
When B[22] > 4, Control[22] < 9					Do 	$color block (11,11,1) = Red,
When B[22] = 0								Do	$color block (11,11,1) = Grey,	

When B[23] = 1 or B[23] = 2						Do 	$color block (11,12,1) = Green,
When Control[23] > 10							Do 	$color block (11,12,1) = Yellow, 
When B[23] > 4, Control[23] < 9					Do 	$color block (11,12,1) = Red
When B[23] = 0								Do	$color block (11,12,1) = Grey,	

When B[25] = 1 or B[25] = 2 						Do	$color block (5,11,1)=Green
				If $switch{T25}(5,11,1)=normal	Then  $color track(6,11,1)=Green
										Else	$color track(6,10,1)=Green		Endif
When B[25] = 3 or B[25] = 4 						Do 	$color block (5,11,1)=Blue
				If $switch{T25}(5,11,1)=normal	Then  $color track(6,11,1)=Blue
										Else	$color track(6,10,1)=Blue		Endif
When B[25] > 4								Do 	$color block (5,11,1)=Red
				If $switch{T25}(5,11,1)=normal	Then  $color track(6,11,1)=Red
										Else	$color track(6,10,1)=Red		Endif
When B[25] = 0								Do	$color block (5,11,1)=Grey
				If $switch{T25}(5,11,1)=normal	Then 	$color track(6,11,1)=Grey
										Else	$color track(6,10,1)=Grey		Endif

When B[70] = 1 or B[70] = 2 						Do 	$color block (1,10,1)=Green
				If $switch{T27}(2,11,1)=normal	Then  $color block(3,12,1)=Green
										Else	$color block(3,11,1)=Green	
											$color block(4,11,1)=Green		Endif
When B[70] = 3 or B[70] = 4						Do 	$color block (1,10,1) = Blue
				If $switch{T27}(2,11,1)=normal	Then  $color block(3,12,1)=Blue
										Else	$color block(3,11,1)=Blue	
											$color block(4,11,1)=Blue		Endif
When B[70] > 4								Do 	$color block (1,10,1)=Red
				If $switch{T27}(2,11,1)=normal	Then  $color block(3,12,1)=Red
										Else	$color block(3,11,1)=Red	
											$color block(4,11,1)=Red		Endif
When B[70] = 0								Do	$color block (1,10,1)=Grey
				If $switch{T27}(2,11,1)=normal	Then  $color block(3,12,1)=Grey
										Else	$color block(3,11,1)=Grey
											$color block(4,11,1)=Grey		Endif

When B[80] = 1 or B[80] = 2 						Do 	$color block (2,9,1) = Green
				If $switch{T26}(4,11,1)=normal	Then  $color block(4,10,1)=Green
											$color track(6,10,1)=Green
										Else	$color block(4,11,1)=Green		Endif
When B[80] = 3 or B[80] = 4	 					Do	$color block (2,9,1) =Blue
				If $switch{T26}(4,11,1)=normal	Then  $color block(4,10,1)=Blue
											$color track(6,10,1)=Blue
										Else	$color block(4,11,1)=Blue		Endif
When B[80] > 4								Do 	$color block (2,9,1) =Red
				If $switch{T26}(4,11,1)=normal	Then  $color block(4,10,1)=Red
											$color track(6,10,1)=Red
										Else	$color block(4,11,1)=Red		Endif
When B[80] = 0								Do	$color block (2,9,1) =Grey
				If $switch{T26}(4,11,1)=normal	Then  $color block(4,10,1)=Grey
											$color track(6,10,1)=Grey
										Else	$color block(4,11,1)=Grey		Endif	

When B[81] = 1 or B[81] = 2						Do 	$color block (7,3,1) = Green, 
When B[81] = 3								Do 	$color block (7,3,1) = Blue, 
When B[81] > 4								Do 	$color block (7,3,1) = Red, 
When B[81] = 0								Do	$color block (7,3,1) = Grey, 

When B[82] = 1 or B[82] = 2						Do 	$color block (12,3,1) = Green, 
When B[82] = 4								Do	$color block (12,3,1) = Blue, 
When B[82] > 4								Do 	$color block (12,3,1) = Red, 
When B[82] = 0								Do	$color block (12,3,1) = Grey,	

When B[71] = 1 or B[71] = 2						Do 	$color block (6,1,1) = Green,
When B[71] = 3								Do 	$color block (6,1,1) = Blue, 
When B[71] > 4								Do 	$color block (6,1,1) = Red, 
When B[71] = 0								Do	$color block (6,1,1) = Grey,	

When B[72] = 1 or B[72] = 2						Do 	$color block (15,1,1) = Green, 
When B[72] = 4								Do 	$color block (15,1,1) = Blue, 
When B[72] > 4								Do 	$color block (15,1,1) = Red
When B[72] = 0								Do	$color block (15,1,1) = Grey,	

When B[75] = 1 or B[75] = 2							Do 	$color block (22,1,1)=Green
				If $switch{T51}(22,1,1)=normal		Then  $color block(23,1,1)=Green
											Else	$color block(23,2,1)=Green	
					If $switch{T52}(23,2,1)=reversed	Then  $color block(24,2,1)=Green
							Elseif	B[55] < 5	Then	$color block(24,3,1)=Green	
					If $switch{T53}(24,3,1)=normal	Then  $color block(25,4,1)=Green	Endif	Endif	Endif	
When B[75] = 3 or B[75] = 4							Do 	$color block (22,1,1) = Blue
				If $switch{T51}(22,1,1)=normal		Then  $color block(23,1,1)=Blue
											Else	$color block(23,2,1)=Blue	
					If $switch{T52}(23,2,1)=reversed	Then  $color block(24,2,1)=Blue
							Elseif	B[55] < 5	Then	$color block(24,3,1)=Blue	
					If $switch{T53}(24,3,1)=normal	Then  $color block(25,4,1)=Blue	Endif	Endif	Endif	
When B[75] > 4									Do	$color block (22,1,1)=Red
				If $switch{T51}(22,1,1)=normal		Then  $color block(23,1,1)=Red
											Else	$color block(23,2,1)=Red	
					If $switch{T52}(23,2,1)=reversed	Then  $color block(24,2,1)=Red
											Else	$color block(24,3,1)=Red	
					If $switch{T53}(24,3,1)=normal	Then  $color block(25,4,1)=Red	Endif	Endif	Endif	
When B[75] = 0									Do	$color block (22,1,1)=Grey
				If $switch{T51}(22,1,1)=normal		Then  $color block(23,1,1)=Grey
											Else	$color block(23,2,1)=Grey
					If $switch{T52}(23,2,1)=reversed	Then  $color block(24,2,1)=Grey
							Elseif	B[55] < 5	Then	$color block(24,3,1)=Grey
					If $switch{T53}(24,3,1)=normal	Then  $color block(25,4,1)=Grey	Endif	Endif	Endif	
When B[55] > 4								Do	$color track (24,3,1) = Red
When B[55] = 0								Do	$color track (24,3,1) = Grey

When B[51] = 1 or B[51] = 2						Do 	$color block (27,1,1) = Green,
When Control[51] > 10							Do 	$color block (27,1,1) = Yellow, 
When B[51] > 4 and Control[51] < 9					Do 	$color block (27,1,1) = Red, 
When B[51] = 0								Do	$color block (27,1,1) = Grey,	
	
When B[52] = 1 or B[52] = 2						Do 	$color block (27,2,1) = Green,
When Control[52] > 10							Do 	$color block (27,2,1) = Yellow, 
When B[52] > 4 and Control[52] < 9					Do 	$color block (27,2,1) = Red, 
When B[52] = 0								Do	$color block (27,2,1) = Grey,	

When B[53] = 1 or B[53] = 2						Do 	$color block (27,3,1) = Green,
When Control[53] > 10							Do 	$color block (27,3,1) = Yellow, 
When B[53] > 4 and Control[53] < 9					Do 	$color block (27,3,1) = Red, 
When B[53] = 0								Do	$color block (27,3,1) = Grey,

When B[54] = 1 or B[54] = 2						Do 	$color block (27,4,1) = Green, 
When B[54] > 4								Do 	$color block (27,4,1) = Red, 
When B[54] = 0								Do	$color block (27,4,1) = Grey,

When B[85] = 1 or B[85] = 2						Do 	$color block (34,1,1)=Green
				If $switch{T56}(33,1,1)=normal		Then   $color block(32,1,1)=Green
										Else	$color block(32,2,1)=Green	
					If $switch{T55}(32,2,1)=reversed	Then   $color track(31,2,1)=Green
										Else	$color track(31,3,1)=Green		Endif	Endif	
When B[85] = 3 or B[85] = 4						Do 	$color block (34,1,1)=Blue
				If $switch{T56}(33,1,1)=normal		Then   $color block(32,1,1)=Blue
										Else	$color block(32,2,1)=Blue	
					If $switch{T55}(32,2,1)=reversed	Then   $color track(31,2,1)=Blue
										Else	$color track(31,3,1)=Blue		Endif	Endif	
When B[85] > 4								Do 	$color block (34,1,1)=Red
				If $switch{T56}(33,1,1)=normal		Then   $color block(32,1,1)=Red
										Else	$color block(32,2,1)=Red	
					If $switch{T55}(32,2,1)=reversed	Then   $color track(31,2,1)=Red
										Else	$color track(31,3,1)=Red		Endif	Endif	
When B[85] = 0								Do 	$color block (34,1,1)=Grey
				If $switch{T56}(33,1,1)=normal		Then   $color block(32,1,1)=Grey
										Else	$color block(32,2,1)=Grey	
					If $switch{T55}(32,2,1)=reversed	Then   $color track(31,2,1)=Grey
										Else	$color track(31,3,1)=Grey		Endif	Endif	

When B[86] = 1 or B[86] = 2						Do 	$color block (35,8,1) = Green,
When B[86] = 4								Do 	$color block (35,8,1) = Blue, 
When B[86] > 4								Do 	$color block (35,8,1) = Red, 
When B[86] = 0								Do	$color block (35,8,1) = Grey,	

When B[84] = 1 or B[84] = 2						Do 	$color block (25,6,1) = Green, 
When B[84] = 3 or B[84] = 4						Do 	$color block (25,6,1) = Blue,
When B[84] > 4								Do 	$color block (25,6,1) = Red, 
When B[84] = 0								Do	$color block (25,6,1) = Grey,

When B[83] = 1 or B[83] = 2						Do 	$color block (18,3,1) = Green
											$color block (15,3,1) = Green
				If $switch{T8}(15,3,1)=normal		Then	$color track (14,3,1) = Green
										Else	$color track (14,4,1) = Green	Endif
When B[83] = 3 or B[83] = 4						Do 	$color block (18,3,1) = Blue
											$color block (15,3,1) = Blue
				If $switch{T8}(15,3,1)=normal		Then	$color track (14,3,1) = Blue
										Else	$color track (14,4,1) = Blue		Endif 
When B[83] > 4								Do	$color block (18,3,1) = Red 
											$color block (15,3,1) = Red 
				If $switch{T8}(15,3,1)=normal		Then	$color track (14,3,1) = Red
										Else	$color track (14,4,1) = Red		Endif
				If B[83] = 11 {Up train only}	Then wait 8	$color block (15,3,1) = Grey	'return T8 to grey
											$color track (14,4,1) = Grey	'and track joiners
											$color track (14,3,1) = Grey		Endif
When B[83] = 0								Do	$color block (18,3,1) = Grey
											$color block (15,3,1) = Grey
				If $switch{T8}(15,3,1)=normal		Then	$color track (14,3,1) = Grey
										Else	$color track (14,4,1) = Grey		Endif
 
When B[99] = 1 or B[99] = 2						Do 	$color block (11,4,1) = Green
When B[99] = 4								Do 	$color block (11,4,1) = Blue,
When B[99] > 4								Do 	$color block (11,4,1) = Red, 
When B[99] = 0								Do	$color block (11,4,1) = Grey,

When B[98] = 1 or B[98] = 2						Do 	$color block (11,7,1) = Green, 
When B[98] = 3 								Do 	$color block (11,7,1) = Blue,
When B[98] > 4								Do 	$color block (11,7,1) = Red, 
When B[98] = 0								Do	$color block (11,7,1) = Grey,	

When B[96] = 1 or B[96] = 2						Do 	$color block (14,7,1)=Green
				If $switch{T96}(14,7,1)=normal	Then  $color track(15,7,1)=Green
										Else	$color block(15,8,1)=Green		Endif
When B[96] = 3 or B[96] = 4						Do 	$color block (14,7,1)=Blue
				If $switch{T96}(14,7,1)=normal	Then  $color track(15,7,1)=Blue
										Else	$color block(15,8,1)=Blue		Endif
When B[96] > 4								Do 	$color block (14,7,1)=Red
				If $switch{T96}(14,7,1)=normal	Then  $color track(15,7,1)=Red
										Else	$color block(15,8,1)=Red		Endif
When B[96] = 0								Do	$color block (14,7,1)=Grey
				If $switch{T96}(14,7,1)=normal	Then  $color track(15,7,1)=Grey
										Else	$color block(15,8,1)=Grey		Endif

When B[92] = 1 or B[92] = 2						Do 	$color block (19,8,1) = Green, 
When B[92] > 4								Do 	$color block (19,8,1) = Red, 
When B[92] = 0								Do	$color block (19,8,1) = Grey,

When B[91] = 1 or B[91] = 2						Do 	$color block (19,7,1) = Green, 
When B[91] > 4								Do 	$color block (19,7,1) = Red, 
When B[91] = 0								Do	$color block (19,7,1) = Grey,

When B[95] = 1 or B[95] = 2						Do 	$color block (23,8,1)=Green
				If $switch{T95}(23,8,1)=normal	Then  $color track(22,7,1)=Green
										Else	$color block(22,8,1)=Green		Endif
When B[95] = 3 or B[95] = 4						Do 	$color block (23,8,1)=Blue
				If $switch{T95}(23,8,1)=normal	Then  $color track(22,7,1)=Blue
										Else	$color block(22,8,1)=Blue		Endif
When B[95] > 4								Do 	$color block (23,8,1)=Red
				If $switch{T95}(23,8,1)=normal	Then  $color track(22,7,1)=Red
										Else	$color block(22,8,1)=Red		Endif
When B[95] = 0								Do	$color block (23,8,1)=Grey
				If $switch{T95}(23,8,1)=normal	Then  $color track(22,7,1)=Grey
										Else	$color block(22,8,1)=Grey		Endif

When B[94] = 1 or B[94] = 2						Do 	$color block (25,12,1) = Green, 
When B[94] = 4								Do 	$color block (25,12,1) = Blue,
When B[94] > 4								Do 	$color block (25,12,1) = Red, 
When B[94] = 0								Do	$color block (25,12,1) = Grey	

When B[93] = 1 or B[93] = 2						Do 	$color block (22,20,1) = Green, 
When B[93] = 3								Do 	$color block (22,20,1) = Blue,
When B[93] > 4								Do 	$color block (22,20,1) = Red, 
When B[93] = 0								Do	$color block (22,20,1) = Grey 

When B[11] = 1 or B[11] = 2						Do 	$color block (23,22,1) = Green, 
When B[11] = 3 or B[11] = 4						Do 	$color block (23,22,1) = Blue,
When B[11] > 4								Do 	$color block (23,22,1) = Red, 
When B[11] = 0								Do	$color block (23,22,1) = Grey 
When B[12] = 1 or B[12] = 2						Do 	$color block (23,21,1) = Green, 
When B[12] = 3 or B[12] = 4						Do 	$color block (23,21,1) = Blue,
When B[12] > 4								Do 	$color block (23,21,1) = Red, 
When B[12] = 0								Do	$color block (23,21,1) = Grey 

When B[10] = 1 or B[10] = 2						Do 	$color block (18,22,1)=Green
											$color track (20,22,1)=Green	'D T10
				If $switch(17,22,1){T11}=normal	Then	$color track (16,22,1)=Green	'B PL2-B[10]
											$color track (15,22,1)= Green	'C T12a
										Else	$color block (16,23,1)= Green	Endif	'A PL1-B[10] 
When B[10] = 3 or B[10] = 4						Do 	$color block (18,22,1) = Blue
						 					$color track (20,22,1) = Blue	
				If $switch(17,22,1){T11}=normal	Then	$color track (16,22,1) = Blue,	
											$color track (15,22,1) = Blue	
										Else	$color block (16,23,1) = Blue	Endif
When B[10] > 4								Do 	$color block (18,22,1) = Red,
											$color track (20,22,1) = Red	
				If $switch(17,22,1){T11}=normal	Then	$color track (16,22,1) = Red	
											$color track (15,22,1) = Red	
										Else	$color block (16,23,1) = Red	Endif 
When B[10] = 0								Do	$color block (18,22,1) = Grey 
					 						$color track (20,22,1) = Grey	
				If $switch(17,22,1){T11}=normal	Then	$color track (16,22,1) = Grey,	
											$color track (15,22,1) = Grey	
										Else	$color block (16,23,1) = Grey	Endif
 
When B[20] = 1 or B[20] = 2	Do If {20R}$switch(18,20,1)=reversed or 
		{64R}$switch(16,21,1)=1 or $switch(16,21,1)=2   Then   'do nothing
										Else 	$color block (18,21,1)=Green
											$color track (16,21,1)=Green
											$color track (19,21,1)=Green	Endif
When B[20] = 3 or B[20] = 4	Do If {20R}$switch(18,20,1)=reversed or 
		{64R}$switch(16,21,1)=1 or $switch(16,21,1)=2	Then 	'do nothing
										Else 	$color block (18,21,1) = Blue	
											$color track (16,21,1)=Blue
											$color track (19,21,1)=Blue	Endif
When B[20] > 4			Do If {20R}$switch(18,20,1)=reversed or 
		{64R}$switch(16,21,1)=1 or $switch(16,21,1)=2	Then 	'do nothing
										Else 	$color block (18,21,1)=Red
											$color track (16,21,1)=Red
											$color track (19,21,1)=Red	Endif
When B[20] = 0								Do	$color block (18,21,1)=Grey
											$color track (16,21,1)=Grey
											$color track (19,21,1)=Grey	

When B[90] = 1 or B[90] = 2						Do 	$color block (17,20,1)=Green
		If $switch(17,20,1)=1 or $switch(17,20,1)=2	Then 	$color track (18,19,1)=Green 
										Else	$color track (18,20,1)=Green 
			If $switch (18,20,1){T20}=normal		Then 	$color track (19,20,1)=Green 
										Else	$color track (19,21,1)=Green	Endif Endif
		If $switch(17,20,1)=1 or $switch(17,20,1)=3	Then 	$color track (16,21,1)=Green 
										Else	$color track (16,20,1)=Green	 
			If $switch(16,20,1) = normal			Then 	$color track (15,20,1)=Green 
										Else	$color track (15,19,1)=Green	Endif	Endif 
When B[90] = 3 or B[90] = 4						Do 	$color block (17,20,1)=Blue
		If $switch(17,20,1)=1 or $switch(17,20,1)=2	Then 	$color track (18,19,1)=Blue 
										Else	$color track (18,20,1)=Blue 
			If $switch (18,20,1){T20}=normal		Then 	$color track (19,20,1)=Blue 
										Else	$color track (19,21,1)=Blue	Endif Endif
		If $switch(17,20,1)=1 or $switch(17,20,1)=3	Then 	$color track (16,21,1)=Blue 
										Else	$color track (16,20,1)=Blue	 
			If $switch(16,20,1) = normal			Then 	$color track (15,20,1)=Blue 
										Else	$color track (15,19,1)=Blue	Endif	Endif 
When B[90] > 4								Do 	$color block (17,20,1)=Red
		If $switch(17,20,1)=1 or $switch(17,20,1)=2	Then 	$color track (18,19,1)=Red 
										Else	$color track (18,20,1)=Red 
			If $switch (18,20,1){T20}=normal		Then 	$color track (19,20,1)=Red 
										Else	$color track (19,21,1)=Red	Endif Endif
		If $switch(17,20,1)=1 or $switch(17,20,1)=3	Then 	$color track (16,21,1)=Red
										Else	$color track (16,20,1)=Red	 
			If $switch(16,20,1) = normal			Then 	$color track (15,20,1)=Red 
										Else	$color track (15,19,1)=Red	Endif	Endif 
When B[90] = 0								Do	$color block (17,20,1)=Grey 
		If $switch(17,20,1)=1 or $switch(17,20,1)=2	Then 	$color track (18,19,1)=Grey
										Else	$color track (18,20,1)=Grey
			If $switch (18,20,1){T20}=normal		Then 	$color track (19,20,1)=Grey
										Else	$color track (19,21,1)=Grey	Endif Endif
		If $switch(17,20,1)=1 or $switch(17,20,1)=3	Then 	$color track (16,21,1)=Grey
										Else	$color track (16,20,1)=Grey	 
			If $switch(16,20,1) = normal			Then 	$color track (15,20,1)=Grey
										Else	$color track (15,19,1)=Grey	Endif	Endif 

When $color(19,21,1) = $RGB_FF00	Do	{extend colour from dbl slip 61/62 toward Block 21 or Turnout 61}
		If $switch(19,21,1)=0 or $switch(19,21,1)=3	Then 	$color track (20,21,1) = Green
										Else	$color track (20,22,1) = Green Endif	

When $color(19,21,1) = $RGB_FFFF00	Do 
		If $switch(19,21,1)=0 or $switch(19,21,1)=3	Then 	$color track (20,21,1) = Blue
										Else	$color track (20,22,1) = Blue	Endif 
When $color(19,21,1) = Red		Do 
		If $switch(19,21,1)=0 or $switch(19,21,1)=3	Then 	$color track (20,21,1) = Red			 
										Else	$color track (20,22,1) = Red	Endif	 
When $color(19,21,1) = $RGB_8F8F8F	Do 
		If $switch(19,21,1)=0 or $switch(19,21,1)=3	Then 	$color track (20,21,1) = Grey
										Else	$color track (20,22,1) = Grey	Endif	

When $color(16,21,1) = $RGB_FF00	Do 	{extend colour from dbl slip 64/65 toward platforms 2 or 3}
			If $switch(15,22,1){T12}=normal		Then 	$color track (15,21,1) = Green
										Else	$color track (15,22,1) = Green Endif 
When $color(16,21,1) = $RGB_FFFF00	Do 
			If $switch(15,22,1){T12}=normal		Then 	$color track (15,21,1) = Blue
										Else	$color track (15,22,1) = Blue	Endif
When $color(16,21,1) = Red		Do 
			If $switch(15,22,1){T12}=normal		Then 	$color track (15,21,1) = Red 	
										Else	$color track (15,22,1) = Red	Endif	 
When $color(16,21,1) = $RGB_8F8F8F	Do 
			If $switch(15,22,1){T12}=normal		Then 	$color track (15,21,1) = Grey
										Else	$color track (15,22,1) = Grey	Endif



{Section 12	@@@@@@@@@@@@@@@@@@@@@@   Signal Operation   @@@@@@@@@@@@@@@@@@@@@@@}

When $color (18,10,1) = $RGB_FF00	Do {Sig60}$signal (19,10,1) = "G-"
When $color (18,10,1) <>$RGB_FF00	Do If	$signal (19,10,1) <> "RR"	Then	 $signal (19,10,1) = "-R"	Endif
When $color (18,11,1) = $RGB_FF00	Do {Sig50}$signal (19,11,1) = "G-"	
When $color (18,11,1) <>$RGB_FF00	Do If	$signal (19,11,1) <> "RR"	Then	 $signal (19,11,1) = "-R"	Endif
When $color (2,9,1) = 	$RGB_FF00 	Do {Sig80}$signal (2,8,1) = "-G"		
When $color (2,9,1)  <> $RGB_FF00	Do If	$signal (2,8,1) <> "RR"		Then	 $signal (2,8,1) = "R-"	Endif	
When $color (14,10,1) =	$RGB_FF00	Do {Sig21}$signal (13,10,1) = "-G"	
When $color (14,10,1) <>$RGB_FF00	Do If	$signal (13,10,1) <> "RR"	Then	 $signal (13,10,1) = "R-"	Endif
When $color (14,11,1) =	$RGB_FF00 	Do {Sig22}$signal (13,11,1) = "-G"	
When $color (14,11,1) <>$RGB_FF00 	Do If	$signal (13,11,1) <> "RR"	Then	 $signal (13,11,1) = "R-"	Endif
When $color (14,12,1) = $RGB_FF00	Do {Sig23}$signal (13,12,1) = "-G"	
When $color (14,12,1) <>$RGB_FF00	Do If	$signal (13,12,1) <> "RR"	Then	 $signal (13,12,1) = "R-"	Endif
When $color (6,10,1) = 	$RGB_FF00 	Do {Sig25}$signal (7,10,1) = "G-"	
When $color (6,10,1) <> $RGB_FF00 	Do If	$signal (7,10,1) <> "RR"	Then	 $signal (7,10,1) = "-R"	Endif
When $color (4,11,1) = 	$RGB_FF00, {T25N} $switch (5,11,1) = Normal	Do 	{Sig26}$signal (7,11,1) = "G-"
When $color (4,11,1) <> $RGB_FF00 or {T25N} $switch (5,11,1) = Reversed	Do 	If $signal (7,11,1) <> "RR" 
												Then	 $signal (7,11,1) = "-R"	Endif
When $color (6,12,1) =	$RGB_FF00 	Do {Sig27}$signal (7,12,1) = "G-"	
When $color (6,12,1) <> $RGB_FF00 	Do If	$signal (7,12,1) <> "RR"	Then	 $signal (7,12,1) = "-R"	Endif
When $color (1,9,1) = 	$RGB_FF00 	Do {Sig70}$signal (1,8,1) = "-G"		
When $color (1,9,1) <> 	$RGB_FF00 	Do If	$signal (1,8,1) <> "RR"		Then	 $signal (1,8,1) = "R-"	Endif
When $color (22,1,1) = 	$RGB_FF00 	Do {Sig75}$signal (21,1,1) = "-G"		
When $color (22,1,1) <>	$RGB_FF00 	Do If	$signal (21,1,1) <> "RR"	Then	 $signal (21,1,1) = "R-"	Endif
When $color (24,1,1) = 	$RGB_FF00 	Do {Sig51}$signal (25,1,1) = "G-"	
When $color (24,1,1) <> $RGB_FF00 	Do If	$signal (25,1,1) <> "RR"	Then	 $signal (25,1,1) = "-R"	Endif        
When $color (24,2,1) = 	$RGB_FF00 	Do {Sig52}$signal (25,2,1) = "G-"	
When $color (24,2,1) <>	$RGB_FF00 	Do If	$signal (25,2,1) <> "RR"	Then	 $signal (25,2,1) = "-R"	Endif        
When $color (23,2,1) = 	$RGB_FF00, {T52R}$switch(23,2,1)=Normal,{T53N}$switch(24,3,1)=Reversed  
						Do {Sig53}$signal(25,3,1)="G-"
When $color (23,2,1) = 	$RGB_FF00, {T52R} $switch (23,2,1) = Normal, {T53R} $switch (24,3,1) = Normal	
						Do {54}$signal (26,4,1) = "G-"
When $color (23,2,1) <>	$RGB_FF00	Do If	$signal {53} (25,3,1) <> "RR"	Then	 $signal (25,3,1) = "-R"	Endif	
						If	$signal {S0} (26,4,1) <> "RR"	Then	 $signal (26,4,1) = "-R"	Endif
When $color (31,1,1) = 	$RGB_FF00 	Do {Sig55}$signal (30,1,1) = "-G"	
When $color (31,1,1) <>	$RGB_FF00 	Do If	$signal (30,1,1) <> "RR"	Then	 $signal (30,1,1) = "R-"	Endif
When $color (31,2,1) = 	$RGB_FF00 	Do {Sig56}$signal (30,2,1) = "-G"	
When $color (31,2,1) <> $RGB_FF00 	Do If	$signal (30,2,1) <> "RR"	Then	 $signal (30,2,1) = "R-"	Endif
When $color (31,3,1) = 	$RGB_FF00 	Do {Sig57}$signal (30,3,1) = "-G"	
When $color (31,3,1) <> $RGB_FF00 	Do If	$signal (30,3,1) <> "RR"	Then	 $signal (30,3,1) = "R-"	Endif
When $color (35,2,1) = 	$RGB_FF00 	Do {Sig85}$signal (35,3,1) = "G-"		
When $color (35,2,1) <> $RGB_FF00 	Do If	$signal (35,3,1) <> "RR"	Then	 $signal (35,3,1) = "-R"	Endif	
When $color (21,3,1) = 	$RGB_FF00 	Do {Sig84}$signal (22,4,1) = "G-"		
When $color (21,3,1) <>	$RGB_FF00 	Do If	$signal (22,4,1) <> "RR"	Then	 $signal (22,4,1) = "-R"	Endif
When $color (15,3,1) = 	$RGB_FF00 	Do {Sig83}$signal (16,3,1) = "G-"		
When $color (15,3,1) <> $RGB_FF00	Do If	$signal (16,3,1) <> "RR"	Then	 $signal (16,3,1) = "-R"	Endif
When $color (14,3,1) = 	$RGB_FF00 	Do {Sig8}$signal (13,3,1) = "-G"		
When $color (14,3,1) <>	$RGB_FF00 	Do If	$signal (13,3,1) <> "RR"	Then	 $signal (13,3,1) = "R-"	Endif
When $color (14,4,1) = 	$RGB_FF00 	Do {Sig9}$signal (13,4,1) = "-G"		
When $color (14,4,1) <>	$RGB_FF00 	Do If	$signal (13,4,1) <> "RR"	Then	 $signal (13,4,1) = "R-"	Endif
When $color (14,7,1) = 	$RGB_FF00 	Do {Sig96}$signal (13,7,1) = "-G"		
When $color (14,7,1) <>	$RGB_FF00 	Do If	$signal (13,7,1) <> "RR"	Then	 $signal (13,7,1) = "R-"	Endif
When $color (15,7,1) = 	$RGB_FF00 	Do {Sig93}$signal (16,7,1) = "G-"	
When $color (15,7,1) <>	$RGB_FF00 	Do If	$signal (16,7,1) <> "RR"	Then	 $signal (16,7,1) = "-R"	Endif 
When $color (15,8,1) = 	$RGB_FF00 	Do {Sig94}$signal (16,8,1) = "G-"	
When $color (15,8,1) <>	$RGB_FF00 	Do If	$signal (16,8,1) <> "RR"	Then	 $signal (16,8,1) = "-R"	Endif       
When $color (22,7,1) = 	$RGB_FF00 	Do {Sig91}$signal (21,7,1) = "-G"	
When $color (22,7,1) <>	$RGB_FF00 	Do If	$signal (21,7,1) <> "RR"	Then	 $signal (21,7,1) = "R-"	Endif
When $color (22,8,1) = 	$RGB_FF00 	Do {Sig92}$signal (21,8,1) = "-G"	
When $color (22,8,1) <> $RGB_FF00 	Do If	$signal (21,8,1) <> "RR"	Then	 $signal (21,8,1) = "R-"	Endif
When $color (23,8,1) = 	$RGB_FF00 	Do {Sig95}$signal (24,9,1) = "G-"		
When $color (23,8,1) <>	$RGB_FF00 	Do If	$signal (24,9,1) <> "RR"	Then	 $signal (24,9,1) = "-R"	Endif
When $color (1,19,1) = 	$RGB_FF00 	Do {Sig30}$signal (1,18,1) = "-G"		
When $color (1,19,1) <>	$RGB_FF00 	Do If	$signal (1,18,1) <> "RR"	Then	 $signal (1,18,1) = "R-"	Endif
When $color (2,19,1) = 	$RGB_FF00 	Do {Sig40}$signal (2,18,1) = "-G"		
When $color (2,19,1) <>	$RGB_FF00 	Do If	$signal (2,18,1) <> "RR"	Then	 $signal (2,18,1) = "R-"	Endif
When $color (7,23,1) = 	$RGB_FF00 	Do {Sig1}$signal (8,23,1) = "G-"	
When $color (7,23,1) <> $RGB_FF00 	Do If	$signal (8,23,1) <> "RR"	Then	 $signal (8,23,1) = "-R"	Endif
When $color (7,22,1) = 	$RGB_FF00 	Do {Sig2}$signal (8,22,1) = "G-"	
When $color (7,22,1) <> $RGB_FF00 	Do If	$signal (8,22,1) <> "RR"	Then	 $signal (8,22,1) = "-R"	Endif         
When $color (7,21,1) = 	$RGB_FF00 	Do {Sig3}$signal (8,21,1) = "G-"	
When $color (7,21,1) <>	$RGB_FF00 	Do If	$signal (8,21,1) <> "RR"	Then	 $signal (8,21,1) = "-R"	Endif
When $color (7,20,1) = 	$RGB_FF00 	Do {Sig4}$signal (8,20,1) = "G-"	
When $color (7,20,1) <>	$RGB_FF00 	Do If	$signal (8,20,1) <> "RR"	Then	 $signal (8,20,1) = "-R"	Endif
When $color (7,19,1) = 	$RGB_FF00 	Do {Sig5}$signal (8,19,1) = "G-"	
When $color (7,19,1) <>	$RGB_FF00 	Do If	$signal (8,19,1) <> "RR"	Then	 $signal (8,19,1) = "-R"	Endif         
When $color (15,23,1) =	$RGB_FF00 	Do {Sig11}$signal (14,23,1) = "-G"	
When $color (15,23,1)<>	$RGB_FF00 	Do If	$signal (14,23,1) <> "RR"	Then	 $signal (14,23,1) = "R-"	Endif
When $color (15,22,1) =	$RGB_FF00 	Do {Sig12}$signal (14,22,1) = "-G"	
When $color (15,22,1)<>	$RGB_FF00 	Do If	$signal (14,22,1) <> "RR"	Then	 $signal (14,22,1) = "R-"	Endif
When $color (15,21,1) =	$RGB_FF00 	Do {Sig13}$signal (14,21,1) = "-G"	
When $color (15,21,1)<>	$RGB_FF00 	Do If	$signal (14,21,1) <> "RR"	Then	 $signal (14,21,1) = "R-"	Endif
When $color (15,20,1) = $RGB_FF00 	Do {Sig14}$signal (14,20,1) = "-G"	
When $color (15,20,1)<>	$RGB_FF00 	Do If	$signal (14,20,1) <> "RR"	Then	 $signal (14,20,1) = "R-"	Endif
When $color (15,19,1) = $RGB_FF00 	Do {Sig15}$signal (14,19,1) = "-G"	
When $color (15,19,1)<>	$RGB_FF00 	Do If	$signal (14,19,1) <> "RR"	Then	 $signal (14,19,1) = "R-"	Endif
When $color (20,22,1) =	$RGB_FF00 	Do {Sig10}$signal (21,22,1) = "G-"	
When $color (20,22,1)<>	$RGB_FF00 	Do If	$signal (21,22,1) <> "RR"	Then	 $signal (21,22,1) = "-R"	Endif
When $color (20,21,1) =	$RGB_FF00 	Do {Sig20}$signal (21,21,1) = "G-"	
When $color (20,21,1)<>	$RGB_FF00 	Do If	$signal (21,21,1) <> "RR"	Then	 $signal (21,21,1) = "-R"	Endif
When B[12] = 1			 	Do 	$signal (26,22,1) = "-G"	
When B[11] = 1			 	Do 	$signal (26,21,1) = "-G"	
When B[12] <> 1			 	Do 	$signal (26,22,1) = "R-"	
When B[11] <> 1			 	Do 	$signal (26,21,1) = "R-"	
When $color (19,20,1) = $RGB_FF00 	Do {Sig90}$signal (20,20,1) = "G-"	
When $color (19,20,1)<>	$RGB_FF00 	Do If	$signal (20,20,1) <> "RR"	Then	 $signal (20,20,1) = "-R"	Endif
When $color (18,19,1) =	$RGB_FF00 	Do {Sig6}$signal (19,19,1) = "G-"	
When $color (18,19,1)<>	$RGB_FF00 	Do If	$signal (19,19,1) <> "RR"	Then	 $signal (19,19,1) = "-R"	Endif
When R41 = 1 or R14 = 1			Do {Sig24} $signal (7,9,1) = "G-"
When R41 = 0, R14 = 0			Do {Sig24} $signal (7,9,1) = "-R"
When B[32] = 1 or B[31] = 2		Do {Sig31} $signal (8,14,1) = "G-"
When B[32] <> 1, B[31] <> 2		Do {Sig31} $signal (8,14,1) = "-R"
When B[33] = 1 or B[32] = 2		Do {Sig32} $signal (14,14,1) = "G-"
When B[33] <> 1, B[32] <> 2		Do {Sig32} $signal (14,14,1) = "-R"
When B[42] = 1 or B[41] = 2		Do {Sig41} $signal (8,15,1) = "G-"
When B[42] <> 1, B[41] <> 2		Do {Sig41} $signal (8,15,1) = "-R"
When B[43] = 1 or B[42] = 2		Do {Sig42} $signal (14,15,1) = "G-"
When B[43] <> 1, B[42] <> 2		Do {Sig42} $signal (14,15,1) = "-R"



{Section 13	@@@@@@@@@@@@@@@@@   Signal Cancel or Lock Commands   @@@@@@@@@@@@@@@@@@@@}
{Parameters are: 1) the coordinates of the signal, 2) the normal aspect for this signal when idle, 3) the first routeblock infront of this signal, 4-5) up to 2 routes that cross that routeblock, 6-8) a 2nd routeblock and 2 more routes if required, 9-10) a 3rd routeblock and route if required.}
 
When $command = C30 	or SignalEntry = 30 	or $right_mouse = {Sig30} 	(1,18,1), 	
				Do	RightClickSignal ((1,18,1),  "R-", &B[30], &R301, &R302, &B[40], &R303, &R304, &B[40], &R305)
When $command = C40 	or SignalEntry = 40 	or $right_mouse = {Sig40} 	(2,18,1)	
				Do	RightClickSignal ((2,18,1), "R-", &B[40], &R402, &R403, &B[40], &R404, &R405, &B0, &B0)
When $command = C1 	or SignalEntry = 1 	or $right_mouse = {Sig1} 	(8,23,1)	
				Do	RightClickSignal ((8,23,1), "-R", &B[30], &R130, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C2 	or SignalEntry = 2 	or $right_mouse = {Sig2} 	(8,22,1), 	
				Do	RightClickSignal ((8,22,1), "-R", &B[30], &R230, &B0, &B[40], &R240, &B0, &B0, &B0)
When $command = C3 	or SignalEntry = 3 	or $right_mouse = {Sig3} 	(8,21,1)	
				Do	RightClickSignal ((8,21,1), "-R", &B[40], &R330, &R340, &B0, &B0, &B0, &B0, &B0)
When $command = C4 	or SignalEntry = 4 	or $right_mouse = {Sig4} 	(8,20,1)	
				Do	RightClickSignal ((8,20,1), "-R", &B[40], &R440, &R430, &B0, &B0, &B0, &B0, &B0)
When $command = C5 	or SignalEntry = 5	or $right_mouse = {Sig5} 	(8,19,1)	
				Do	RightClickSignal ((8,19,1), "-R", &B[40], &R530, &R540, &B0, &B0, &B0, &B0, &B0)
When $command = C10 	or SignalEntry = 10 	or $right_mouse = {Sig10}   (21,22,1)	
				Do	RightClickSignal ((21,22,1), "-R", &B[10], &R102, &R101, &B[90], &R104, &R105, &B[20], &R103)
When $command = C20 	or SignalEntry = 20 	or $right_mouse = {Sig20}    (21,21,1)	
				Do	RightClickSignal ((21,21,1),  "-R", &B[20], &R202, &R203, &B[90], &R204, &R205, &B0, &B0)
When $command = C90 	or SignalEntry = 90 	or $right_mouse = {Sig90}    (20,20,1)	
				Do	RightClickSignal ((20,20,1), "-R", &B[90], &R902, &R903, &B[90], &R904, &R905, &B0, &B0)
When $command = C6 	or SignalEntry = 6 	or $right_mouse = {Sig6}  	 (19,19,1)	
				Do 	RightClickSignal ((19,19,1), "-R", &B[90], &R65, &R64, &B[90], &R63, &R62, &B0, &B0)
When $command = C11 	or SignalEntry = 11 	or $right_mouse = {Sig11}	 (14,23,1)	
				Do	RightClickSignal ((14,23,1), "R-",  &B[10], &R110, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C12 	or SignalEntry = 12 	or $right_mouse = {Sig12}	 (14,22,1)	
				Do	RightClickSignal ((14,22,1), "R-", &B[90], &R290, &R26, &B[10], &R210, &B0, &B[20], &R220)
When $command = C13 	or SignalEntry = 13 	or $right_mouse = {Sig13}	 (14,21,1) 	
				Do	RightClickSignal ((14,21,1), "R-", &B[20], &R320, &R310, &B[90], &R390, &R36, &B0, &B0)
When $command = C14 	or SignalEntry = 14 	or $right_mouse = {Sig14}	 (14,20,1) 	
				Do 	RightClickSignal ((14,20,1), "R-", &B[90], &R490, &R46, &B[90], &R410, &R420, &B0, &B0)
When $command = C15 	or SignalEntry = 15 	or $right_mouse = {Sig15}	 (14,19,1) 	
				Do 	RightClickSignal ((14,19,1), "R-",  &B[90], &R590, &R56, &B[90], &R510, &R520, &B0 ,&B0)
When $command = C50 	or SignalEntry = 50 	or $right_mouse = {Sig50}   	(19,11,1)	
				Do 	RightClickSignal ((19,11,1), "-R", &B[50], &R501, &R502, &B[50], &R503, &B0, &B0, &B0)
When $command = C23 	or SignalEntry = 23 	or $right_mouse = {Sig23}	(13,12,1)	
				Do 	RightClickSignal ((13,12,1), "R-", &B[50], &R360, &R350, &B0, &B0, &B0, &B0, &B0)
When $command = C22 	or SignalEntry = 22 	or $right_mouse = {Sig22}	(13,11,1)	
				Do 	RightClickSignal ((13,11,1), "R-", &B[50], &R250, &R260, &B0, &B0, &B0, &B0, &B0)
When $command = C21 	or SignalEntry = 21 	or $right_mouse = {Sig21}	(13,10,1), 	
				Do	RightClickSignal ((13,10,1), "R-", &B[60], &R160, &B0, &B[50], &R150, &B0, &B0, &B0)
When $command = C60 	or SignalEntry = 60 	or $right_mouse = {Sig60}	 (19,10,1), 	
				Do	RightClickSignal ((19,10,1), "-R", &B[60], &R601, &B0, &B[50], &R602, &R603, &B0, &B0)
When $command = C80 	or SignalEntry = 80 	or $right_mouse = {Sig80}	 (2,8,1)	
				Do 	RightClickSignal ((2,8,1), "R-", &B[80], &R801, &R802, &B0, &B0, &B0, &B0, &B0)	
When $command = C70 	or SignalEntry = 70 	or $right_mouse = {Sig70}	 (1,8,1)	
				Do 	RightClickSignal ((1,8,1), "R-", &B[70], &R701, &R702, &B[70], &R703, &B0, &B0, &B0)
When $command = C24 	or SignalEntry = 24	or $right_mouse = {Sig24} 	(7,9,1)		Do 	R41 = 0, R14 = 0	
When $command = C25 	or SignalEntry = 25 	or $right_mouse = {Sig25} 	(7,10,1), 	
				Do	RightClickSignal ((7,10,1), "-R", &B[80], &R180, &B0, &B[70], &R170, B0, &B0, &B0)
When $command = C26 	or SignalEntry = 26 	or $right_mouse = {Sig26} 	(7,11,1),	
				Do	RightClickSignal ((7,11,1), "-R", &B[70], &R270, &B0, &B[80], &R280, &B0, &B0, &B0)
When $command = C27 	or SignalEntry = 27 	or $right_mouse = {Sig27} 	(7,12,1)	
				Do 	RightClickSignal ((7,12,1), "-R", &B[70], &R370, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C95 	or SignalEntry = 95 	or $right_mouse = {Sig95}	(24,9,1)	
				Do 	RightClickSignal ((24,9,1), "R-", &B[95], &R951, &R952, &B0, &B0, &B0, &B0, &B0)
When $command = C91 	or SignalEntry = 91 	or $right_mouse = {Sig91}	(21,7,1)	
				Do 	RightClickSignal ((21,7,1), "R-", &B[95], &R195, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C92 	or SignalEntry = 92 	or $right_mouse = {Sig92}	(21,8,1)		
				Do 	RightClickSignal ((21,8,1), "R-", &B[95], &R295, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C96 	or SignalEntry = 96 	or $right_mouse = {Sig96}	(13,7,1)	
				Do 	RightClickSignal ((13,7,1), "R-", &B[96], &R961, &R962, &B0, &B0, &B0, &B0, &B0)
When $command = C93 	or SignalEntry = 93 	or $right_mouse = {Sig93}	(16,7,1)	
				Do 	RightClickSignal ((16,7,1), "-R", &B[96], &R196, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C94 	or SignalEntry = 94 	or $right_mouse = {Sig94}	(16,8,1)	
				Do 	RightClickSignal ((16,8,1), "-R", &B[96], &R296, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C75 	or SignalEntry = 75 	or $right_mouse = {Sig75}	(21,1,1)	
				Do 	RightClickSignal ((21,1,1), "R-", &B[75], &R751, &R752, &B[75], &R753, &R754, &B0, &B0)
When $command = C51 	or SignalEntry = 51 	or $right_mouse = {Sig51}	(25,1,1)	
				Do 	RightClickSignal ((25,1,1), "-R", &B[75], &R175, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C52 	or SignalEntry = 52 	or $right_mouse = {Sig52}	(25,2,1)	
				Do 	RightClickSignal ((25,2,1), "-R", &B[75], &R275, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C53 	or SignalEntry = 53 	or $right_mouse = {Sig53}	(25,3,1)	
				Do 	RightClickSignal ((25,3,1), "-R", &B[75], &R375, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C54 	or SignalEntry = 54 	or $right_mouse = {Sig54}	(26,4,1)	
				Do 	RightClickSignal ((26,4,1), "-R", &B[75], &R475, &B0, &B0, &B0, &B0, &B0, &B0)	
When $command = C85 	or SignalEntry = 85 	or $right_mouse = {Sig85}	(35,3,1)	
				Do 	RightClickSignal ((35,3,1),  "-R", &B[85], &R851, &R852, &B[85], &R853, &B0, &B0, &B0)
When $command = C55 	or SignalEntry = 55 	or $right_mouse = {Sig55}	(30,1,1)	
				Do 	RightClickSignal ((30,1,1), "R-", &B[85], &R185, &R186, &B0, &B0, &B0, &B0, &B0)	
When $command = C56 	or SignalEntry = 56 	or $right_mouse = {Sig56}	(30,2,1)	
				Do 	RightClickSignal ((30,2,1), "R-",  &B[85], &R285, &R286 &B0, &B0, &B0, &B0, &B0)	
When $command = C57 	or SignalEntry = 57 	or $right_mouse = {Sig57}	(30,3,1)	
				Do 	RightClickSignal ((30,3,1), "R-", &B[85], &R385, &R386, &B0, &B0, &B0, &B0, &B0)	
When $command = C9 	or SignalEntry = 9 	or $right_mouse = {Sig9}	(13,4,1)	
				Do 	RightClickSignal ((13,4,1), "R-", &B[83], &R984, &B0, &B0, &B0, &B0, &B0, &B0)
When $command = C8 	or SignalEntry = 8 	or $right_mouse = {Sig8}	(13,3,1)	
				Do 	RightClickSignal ((13,3,1),  "R-", &B[83], &R884, &B0, &B0, &B0, &B0, &B0, &B0)	
When $command = C84 	or SignalEntry = 84 	or $right_mouse = {Sig84}	(22,4,1)	
				Do 	RightClickSignal ((22,4,1), "-R", &B[83], &R848, &R849, &B0, &B0, &B0, &B0, &B0)
When $command = C31 	or SignalEntry = 31 	or $right_mouse = {Sig31} 	(8,14,1), 
				Do	If	$signal (8,14,1) = "RR"	Then	$signal (8,14,1) = "-R"
					ElseIf	$signal (8,14,1) = "-R"	Then	$signal (8,14,1) = "RR"
					ElseIf	$signal (8,14,1) = "G-"	Then	$signal (8,14,1) = "-R",	
						If 	B[31]<10 		Then 	B[31]=7, Control[31]=0	Endif
						If	B[32]=1		Then	B[32]=0			Endif	Endif	
When $command = C32 	or SignalEntry = 32 	or $right_mouse = {Sig32} 	(14,14,1), 
				Do	If	$signal (14,14,1) = "RR"	Then	$signal (14,14,1) = "-R"
					ElseIf	$signal (14,14,1) = "-R"	Then	$signal (14,14,1) = "RR"
					ElseIf	$signal (14,14,1) = "G-"	Then	$signal (14,14,1) = "-R",	
						If 	B[33]<10 		Then	B[33]=7, Control[33]	= 0 	Endif
						If	B[32]=2		Then	B[32]=0			Endif	Endif	
When $command = C41 	or SignalEntry = 41 	or $right_mouse = {Sig41} 	(8,15,1), 
				Do	If	$signal (8,15,1) = "RR"	Then	$signal (8,15,1) = "-R"
					ElseIf	$signal (8,15,1) = "-R"	Then	$signal (8,15,1) = "RR"
					ElseIf	$signal (8,15,1) = "G-"	Then	$signal (8,15,1) = "-R",	
						If 	B[41]<10 		Then 	B[41]=7, Control[41] = 0 	Endif
						If	B[42]=1		Then	B[42]=0			Endif	Endif	
When $command = C42 	or SignalEntry = 42 	or $right_mouse = {Sig42} 	(14,15,1), 
				Do	If	$signal (14,15,1) = "RR"	Then	$signal (14,15,1) = "-R"
					ElseIf	$signal (14,15,1) = "-R"	Then	$signal (14,15,1) = "RR"
					ElseIf	$signal (14,15,1) = "G-"	Then	$signal (14,15,1) = "-R",	
						If 	B[43]<10 		Then 	B[43]=7, Control[43] = 0 	Endif
						If	B[42]=2		Then	B[42]=0			Endif	Endif	

{When a Starter Signal is cancelled apply the brake to any train standing at the platform}
When {Sig51}$signal (25,1,1) <> "G-", {Sig55}$signal (30,1,1) <> "-G"	Do *L[51].momentum = 0, *L[51].brake = on
When {Sig52}$signal (25,2,1) <> "G-", {Sig56}$signal (30,2,1) <> "-G"	Do *L[52].momentum = 0, *L[52].brake = on
When {Sig53}$signal (25,1,1) <> "G-", {Sig57}$signal (30,3,1) <> "-G"	Do *L[53].momentum = 0, *L[53].brake = on
When {Sig25}$signal (7,10,1) <> "G-", {Sig21}$signal (13,10,1) <> "-G"	Do 	
	If B[25] = 10, $switch (5,11,1) = Reversed	Then			Else *L[21].momentum = 0, *L[21].brake = on Endif
When {Sig26}$signal (7,11,1) <> "G-", {Sig22}$signal (13,11,1) <> "-G"	Do *L[22].momentum = 0, *L[22].brake = on
When {Sig27}$signal (7,12,1) <> "G-", {Sig23}$signal (13,12,1) <> "-G"	Do *L[23].momentum = 0, *L[23].brake = on
When {Sig1}$signal (8,23,1) <> "G-", {Sig11}$signal (14,23,1) <> "-G"	Do *L[1].momentum = 0, *L[1].brake = on
When {Sig2}$signal (8,22,1) <> "G-", {Sig12}$signal (14,22,1) <> "-G"	Do *L[2].momentum = 0, *L[2].brake = on
When {Sig3}$signal (8,21,1) <> "G-", {Sig13}$signal (14,21,1) <> "-G"	Do *L[3].momentum = 0, *L[3].brake = on
When {Sig4}$signal (8,20,1) <> "G-", {Sig14}$signal (14,20,1) <> "-G"	Do *L[4].momentum = 0, *L[4].brake = on
When {Sig5}$signal (8,19,1) <> "G-", {Sig15}$signal (14,19,1) <> "-G"	Do *L[5].momentum = 0, *L[5].brake = on
When {Sig93}$signal (16,7,1) <> "G-"	Do 	If B[91] = 11	Then	   *L[91].momentum = 0, *L[91].brake = on	Endif
When {Sig91}$signal (21,7,1) <> "-G"	Do 	If B[91] = 12	Then	   *L[91].momentum = 0, *L[91].brake = on	Endif
When {Sig94}$signal (16,8,1) <> "G-"	Do 	If B[92] = 11	Then	   *L[92].momentum = 0, *L[92].brake = on	Endif
When {Sig92}$signal (21,8,1) <> "-G"	Do 	If B[92] = 12	Then	   *L[92].momentum = 0, *L[92].brake = on	Endif



{Section 14	@@@@@@@@@@@@@@@@@@@@@  Train Braking and Acceleration   @@@@@@@@@@@@@@@@@}
{Reliable braking at each signal relies on the correct momentum being applied to stop the train at this signal. An initial wait time may also be inserted depending on the distance between the sensor and the signal. A brake ramp is also used to insert additional wait times when the train is travelling at reduced speed. This brake ramp also acts as a supervisor if the driver is stopping the train manually. i.e. if the driver is slowing the train the PC will not interfere unless the train is not slowing sufficiently to stop at the signal.

When a train approaches a signal a sensor triggers a When Do statement which inserts the initial wait time if required then sets the variable Ramp equal to the block number the train is on. As soon Ramp is set it looks at the pool of 4 brake ramps and chooses the first idle one. The block number is then passed to this ramp and it checks the speed of the loco on the block and applies the correct wait time. Once all wait times have been completed the block number is passed to the variable Brake. The value of this variable then triggers the sub routine AutoBrake which applies the brake with the correct amount of momentum if the signal is red or if the train is entering a platform and due to perform a station stop.}
 
When Ramp1 > 0	Do		If *L[ramp1].speed < 14	Then	Wait 0.8   	Endif	
					If *L[ramp1].speed < 13	Then	Wait 0.8   	Endif	
					If *L[ramp1].speed < 12	Then	Wait 0.8   	Endif	
					If *L[ramp1].speed < 11	Then	Wait 1.2   	Endif	
					If *L[ramp1].speed < 10	Then	Wait 1.2   	Endif	
					If *L[ramp1].speed > 8	Then	Brake = ramp1  	Endif	Ramp1 = 0	'set brake = ramp1
When Ramp2 > 0	Do		If *L[ramp2].speed < 14	Then	Wait 0.8   	Endif	
					If *L[ramp2].speed < 13	Then	Wait 0.8   	Endif	
					If *L[ramp2].speed < 12	Then	Wait 0.8   	Endif	
					If *L[ramp2].speed < 11	Then	Wait 1.2	Endif	
					If *L[ramp2].speed < 10	Then	Wait 1.2   	Endif	
					If *L[ramp2].speed > 8	Then	Brake = ramp2 	Endif	Ramp2 = 0	'set brake = ramp2
When Ramp3 > 0	Do		If *L[ramp3].speed < 14	Then	Wait 0.8   	Endif	
					If *L[ramp3].speed < 13	Then	Wait 0.8   	Endif	
					If *L[ramp3].speed < 12	Then	Wait 0.8   	Endif	
					If *L[ramp3].speed < 11	Then	Wait 1.2   	Endif	
					If *L[ramp3].speed < 10	Then	Wait 1.2   	Endif	
					If *L[ramp3].speed > 8	Then	Brake = ramp3  	Endif	Ramp3 = 0	'set brake = ramp3
When Ramp4 > 0	Do		If *L[ramp4].speed < 14	Then	Wait 0.8   	Endif	
					If *L[ramp4].speed < 13	Then	Wait 0.8 	Endif	
					If *L[ramp4].speed < 12	Then	Wait 0.8   	Endif	
					If *L[ramp4].speed < 11	Then	Wait 1.2   	Endif	
					If *L[ramp4].speed < 10	Then	Wait 1.2   	Endif	
					If *L[ramp4].speed > 8	Then	Brake = ramp4 	Endif	Ramp4 = 0	'set brake = ramp4

{Autobrake parameters: (index, UpSignal, DnSignal, fast momentum, slow momentum, station) 	Station=1 if at a platform, otherwise 0}
When B[99] = 11, 		Do 	Wait 1	Ramp (99)		When Brake = 99	Do Autobrake (99, (13,4,1), 0, 50, 75, 0) 
When B[98] = 12, 		Do 			Ramp (98)		When Brake = 98	Do Autobrake (98, 0, (13,7,1), 45, 65, 0) 
When B[93] = 11, 		Do 	Wait 1	Ramp (93)		When Brake = 93	Do Autobrake (93, (20,20,1), 0, 60, 90, 0)
When B[86] = 11, 		Do 	Wait 3	Ramp (86)		When Brake = 86	Do Autobrake (86, (35,3,1), 0, 40, 60, 0) 
When B[84] = 12, 		Do 	Wait 8	Ramp (84)		When Brake = 84	Do Autobrake (84, 0, (22,4,1), 45, 65, 0)
When B[82] = 11, 		Do 			Ramp (82)		When Brake = 82	Do Autobrake (82, (13,3,1), 0, 65, 85, 0) 
When B[81] = 12, 		Do 	Wait 1.5 	Ramp (81)		When Brake = 81	Do Autobrake (81, 0, (2,8,1), 60, 80, 0) 
When B[72] = 12, 		Do 	Wait 3.5 	Ramp (72)		When Brake = 72	Do Autobrake (72, 0, (21,1,1), 50, 70, 0) 
When B[71] = 12, 		Do 	Wait 3.5 	Ramp (71)		When Brake = 71	Do Autobrake (71, 0, (1,8,1), 60, 80, 0) 
When B[43] = 11, S44=on	Do 	Wait 2	Ramp (43)		When Brake = 43	Do Autobrake (43, (19,10,1), 0, 50, 75, 0)
When B[42] = 12		Do 	Wait 1	Ramp (42)		When Brake = 42	Do AutoBrake (42,(14,15,1),(8,15,1),50,75,0) 
When B[42] = 11, 		Do 	Wait 3	Ramp (42)			
When B[41] = 12, S41=on	Do 	Wait 1	Ramp (41)		When Brake = 41	Do Autobrake (41,0,(2,18,1), 50, 75, 0)
When B[33] = 11, S34=on	Do 	Wait 1	Ramp (33)		When Brake = 33	Do Autobrake (33,(19,11,1), 0, 50, 75, 0)
When B[32] = 11, 		Do 	Wait 3	Ramp (32)		When Brake = 32	Do Autobrake (32,(14,14,1),(8,14,1),50,75,0)
When B[32] = 12		Do 	Wait 1	Ramp (32)		
When B[31] = 12, S31=on	Do 	Wait 1	Ramp (31)		When Brake = 31	Do Autobrake (31,(14,15,1),(1,18,1),50,75,0)
When B[11] = 12 		Do 	Wait 3.5 	Ramp (11)		When Brake = 11	Do Autobrake (11,(21,22,1),(26,22,1),0,30,0)
When B[11] = 11		Do	Wait 1	Ramp (11)	
When B[12] = 12		Do	Wait 3	Ramp (12)		When Brake = 12	Do Autobrake (12,(21,21,1),(26,21,1),60,85,0)
When B[12] = 11		Do			Ramp (12)
When B[91] > 10		Do			Ramp (91)		When Brake = 91	Do Autobrake (91, (16,7,1),(21,7,1),65,90,0)
When B[92] > 10		Do			Ramp (92)		When Brake = 92	Do Autobrake (92, (16,8,1),(21,8,1),65,90,0)
When B[94] = 11,		Do			Ramp (94)		When Brake = 94	Do Autobrake (94, (24,9,1), 0, 30, 40, 0)
When B[51] > 10		Do	Wait 0.2	Ramp (51)		When Brake = 51	Do Autobrake (51, (25,1,1),(30,1,1),65,80,1)
When B[52] > 10		Do			Ramp (52)		When Brake = 52	Do Autobrake (52, (25,2,1),(30,2,1),50,75,1)
When B[53] > 10		Do			Ramp (53)		When Brake = 53	Do Autobrake (53, (25,3,1),(30,3,1),40,60,1)
When B[54] = 10		Do	*L[54].momentum = 0
When B[21] = 11		Do			Ramp (21)		When Brake = 21	Do Autobrake (21, (7,10,1),(13,10,1),60,85,1)
When B[21] = 12, 		Do	If $switch(5,11,1) = reversed	Then	Wait 1	Endif	Ramp (21)
When B[22] = 11		Do	Wait 1.5	Ramp (22)		When Brake = 22	Do Autobrake (22, (7,11,1),(13,11,1),40,60,1)
When B[22] = 12, 		Do			Ramp (22)
When B[23] > 10		Do			Ramp (23)		When Brake = 23	Do Autobrake (23, (7,12,1),(13,12,1),60,85,1)
When B[1] > 10		Do	Wait 1.5	Ramp (1)		When Brake = 1	Do Autobrake (1, (8,23,1),(14,23,1),65,105,1)
When B[2] > 10		Do			Ramp (2)		When Brake = 2	Do Autobrake (2, (8,22,1),(14,22,1),70,100,1)
When B[3] > 10		Do			Ramp (3)		When Brake = 3	Do Autobrake (3, (8,21,1),(14,21,1),65,95,1)
When B[4] > 10		Do			Ramp (4)		When Brake = 4	Do Autobrake (4, (8,20,1),(14,20,1),65,100,1)
When B[5] > 10		Do			Ramp (5)		When Brake = 5	Do Autobrake (5, (8,19,1),(14,19,1),65,100,1)

{The code below removes the brake when the signal turns Green}
When B[91] = 11, $signal (16,7,1) = "G-"				Do	BrakeControl (&L[91], 60, 0)
When B[92] = 11, $signal (16,8,1) = "G-"				Do	BrakeControl (&L[92], 60, 0)
When B[94] = 11, $signal (24,9,1) = "G-"				Do	BrakeControl (&L[94], 0, 0)
When B[99] = 11, $signal (13,4,1) = "-G"				Do	BrakeControl (&L[99], 60, 0)
When B[82] = 11, $signal (13,3,1) = "-G"				Do	BrakeControl (&L[82], 60, 0)
When B[86] = 11, $signal (35,3,1) = "G-"				Do	BrakeControl (&L[86], 60, 0)
When B[51] = 11, $signal (25,1,1) = "G-", Control[51]<10	Do	BrakeControl (&L[51], 60, 0)
When B[52] = 11, $signal (25,2,1) = "G-", Control[52]<10	Do	BrakeControl (&L[52], 60, 0)
When B[53] = 11, $signal (25,3,1) = "G-", Control[53]<10	Do	BrakeControl (&L[53], 60, 0)
When B[72] = 12, $signal (21,1,1) = "-G"				Do	BrakeControl (&L[72], 60, 0)
When B[21] = 11 and $signal (7,10,1) = "G-", Control[21]<10	Do	BrakeControl (&L[21], 60, 0)
When B[22] = 11 and $signal (7,11,1) = "G-", Control[22]<10	Do	BrakeControl (&L[22], 60, 0)
When B[23] = 11 and $signal (7,12,1) = "G-", Control[23]<10	Do	BrakeControl (&L[23], 60, 0)
When B[33] = 11 and S34 = on, $signal (19,11,1) = "G-"	Do	BrakeControl (&L[33], 60, 0)
When B[43] = 11 and S44 = on, $signal (19,10,1) = "G-"	Do	BrakeControl (&L[43], 60, 0)
When B[42] = 11 and 	$signal (14,15,1) = "G-"		Do	BrakeControl (&L[42], 60, 0)
When B[32] = 11 and $signal (14,14,1) = "G-"			Do	BrakeControl (&L[32], 60, 0)
When B[1] = 11 and $signal (8,23,1) = "G-", Control[1]<10	Do	BrakeControl (&L[1], 60, 0)	   
When B[2] = 11 and $signal (8,22,1) = "G-", Control[2]<10	Do	BrakeControl (&L[2], 60, 0)
When B[3] = 11 and $signal (8,21,1) = "G-", Control[3]<10	Do	BrakeControl (&L[3], 60, 0)  
When B[4] = 11 and $signal (8,20,1) = "G-", Control[4]<10	Do	BrakeControl (&L[4], 60, 0)
When B[5] = 11 and $signal (8,19,1) = "G-", Control[5]<10	Do	BrakeControl (&L[5], 60, 0)
When B[11] = 11 and $signal (21,22,1) = "G-"			Do	BrakeControl (&L[11], 60, 0)
When B[12] = 11 and $signal (21,21,1) = "G-"			Do	BrakeControl (&L[12], 60, 0)
When B[93] = 11, $signal (20,20,1) = "G-"				Do	BrakeControl (&L[93], 60, 0)
When B[91] = 12, $signal (21,7,1) = "-G"				Do	BrakeControl (&L[91], 60, 0)
When B[92] = 12, $signal (21,8,1) = "-G"				Do	BrakeControl (&L[92], 60, 0)
When B[98] = 12, $signal (13,7,1) = "-G"				Do	BrakeControl (&L[98], 60, 0)
When B[81] = 12, $signal (2,8,1) = "-G"				Do	BrakeControl (&L[81], 60, 0)
When B[84] = 12, $signal (22,4,1) = "G-"				Do	BrakeControl (&L[84], 60, 0)
When B[51] = 12, $signal (30,1,1) = "-G", Control[51]<10	Do	BrakeControl (&L[51], 60, 0)
When B[52] = 12, $signal (30,2,1) = "-G", Control[52]<10	Do	BrakeControl (&L[52], 60, 0)
When B[53] = 12, $signal (30,3,1) = "-G", Control[53]<10	Do	BrakeControl (&L[53], 60, 0)
When B[71] = 12, $signal (1,8,1) = "-G"				Do	BrakeControl (&L[71], 40, 0)
When B[21] = 12 and $signal(13,10,1) = "-G", Control[21]<10	Do	BrakeControl (&L[21], 60, 0)
When B[22] = 12 and $signal(13,11,1) = "-G", Control[22]<10	Do	BrakeControl (&L[22], 60, 0)
When B[23] = 12 and $signal(13,12,1) = "-G", Control[23]<10	Do	BrakeControl (&L[23], 60, 0)
When B[42] = 12 and $signal(8,15,1) = "G-"			Do	BrakeControl (&L[42], 60, 0)
When B[32] = 12 and $signal(8,14,1) = "G-"			Do	BrakeControl (&L[32], 60, 0)
When B[31] = 12, S31 = on, $signal (1,18,1) = "-G"		Do	BrakeControl (&L[31], 40, 0)
When B[41] = 12, S41 = on, $signal (2,18,1) = "-G"		Do	BrakeControl (&L[41], 40, 0)
When B[1] = 12 and $signal (14,23,1) = "-G", Control[1]<10	Do	BrakeControl (&L[1], 60, 0)	 
When B[2] = 12 and $signal (14,22,1) = "-G", Control[2]<10	Do	BrakeControl (&L[2], 60, 0)
When B[3] = 12 and $signal (14,21,1) = "-G", Control[3]<10	Do	BrakeControl (&L[3], 60, 0)	
When B[4] = 12 and $signal (14,20,1) = "-G", Control[4]<10	Do	BrakeControl (&L[4], 60, 0)
When B[5] = 12 and $signal (14,19,1) = "-G", Control[5]<10	Do	BrakeControl (&L[5], 60, 0)
When B[11] = 12 and B[12] = 1						Do	BrakeControl (&L[11], 0, 0)
When B[12] = 12 and B[11] = 1						Do	BrakeControl (&L[12], 0, 0)



{Section 15	@@@@@@@@@@@@@@@@@@@@@@@@@  Train Movement  @@@@@@@@@@@@@@@@@@@@@@}
{There are 4 sub routines used to move trains in response to sensors on the layout. 
The sub MoveTrain is used for fairly simple moves where the program simply looks for a train on an adjacent block. Parameters are: 1) the new block, 2) the block on the down side of the sensor. 3) the block on the up side. 
MoveTrainIR 	is used for infrared sensors. The parameters are 1) the block on the down side of the sensor. 2) the block on the up side. 3) the rescue block. 4) the direction for rescue block
MoveTrainThroat 	is the most complex one and starts by checking the path across the turnouts at the end of a station and then finding the correct train to move. Parameters are: 1) the throat block. 2) the approach track. 3) the index number of platform1 at this station. 4) the index number of the shunt beacon for platform1. 5-7) the coordinates of up to 3 turnouts across this throat.
MoveTrainPlat 	+checks the throat variable and the blocks at both ends of the platform to determine where the train has come from. The parameters are: 1) the platform block. 2-3) up to 2 blocks on the down side of the platform. 4-5) up to 2 blocks on the up side.}

When S86 = on	Do	MoveTrain 		(86, 84, 85)											
When S84 = on	Do	MoveTrain 		(84, 83, 86)			
When S81 = on	Do	MoveTrain 		(81, 80, 0)		{because of the positon of the sensor we don't want to move a train from the up end of sensor 81 so a 0 is passed to the sub as the final parameter}
When S72 = on	Do	MoveTrain 		(72, 75, 71)									
When S71 = on	Do	MoveTrain 		(71, 70, 72)								
When S41 = on	Do	MoveTrain 		(41, 40, 0)	
When S34 = on	Do	MoveTrain 		(33, 0, 50)
When S93 = on	Do	MoveTrain 		(93, 94, 90) 	Wait 6	ClearBlock (94)
When S44 = on	Do	If $switch (18,10,1) = normal		Then
				MoveTrain 		(43, 0, 60)		Else
				MoveTrain 		(43, 0, 50)		Endif
When S31 = on	Do	If $switch (1,19,1) = normal		Then
				MoveTrain 		(31, 30, 0)		Else
				MoveTrain 		(31, 40, 0)		Endif
When S11 = on	Do	If $switch (20,22,1) = normal		Then
				MoveTrain 		(11, 0, 10)		Else
				MoveTrain 		(11, 0, 20)		Endif
When S83 = on	Do	If $switch (15,3,1) = normal		Then		
				MoveTrain 		(83, 82, 84)	Else 	
				MoveTrain 		(83, 99, 84)	Endif
				wait 6		If	 B[82] = 5	Then B[82] = 0	
							Elseif B[99] = 5	Then B[99] = 0	Endif
When S12 = on	Do	If $switch (16,21,1) = 1 or $switch (16,21,1) = 2	Then
				MoveTrain 		(12, 11, 0)		Else	
				MoveTrain 		(12, 11, 20)	Endif
				Wait 6		If B[11] = 5	Then	B[11] = 0	Endif
{Infrared Sensors}
When S99 = on	Do	MoveTrainIR 	(98, 99, 0, 0)	
When S82 = on	Do	MoveTrainIR 	(81, 82, 0, 0)
When S43 = on	Do	MoveTrainIR 	(42, 43, 41, 1)
When S42 = on	Do	MoveTrainIR 	(41, 42, 43, 2)
When S33 = on	Do	MoveTrainIR 	(32, 33, 31, 1)
When S32 = on	Do	MoveTrainIR 	(31, 32, 33, 2)
When S96 = on	Do	B[96] = 10		If $switch (14,7,1) = normal	Then	
				MoveTrainIR 	(91, 98, 0, 0)			Else 		
				MoveTrainIR 	(92, 98, 0, 0)			Endif
When S95 = on	Do	B[95] = 10		If $switch (23,8,1) = normal	Then	
				MoveTrainIR 	(94, 91, 0, 0)			Else 		
				MoveTrainIR 	(94, 92, 0, 0)			Endif

{Throat Blocks}
When S85 = on	Do	If	B[85] < 5	Then					'when sensor 85 turns on and Block 85 is vacant
	If 	$switch (33,1,1) = normal	Then	Control[85] = 1		'route is set for platform 1	
	ElseIf $switch (32,2,1) = reversed	Then	Control[85] = 2		'route is set for platform 2
	Else							Control[85] = 3	Endif	'route is set for platform 3	
	MoveTrainThroat (85, 86, 51, 64)					Endif	'call the sub to move the right train

When S80 = on	Do	If	B[80] < 5	Then					'when sensor 80 turns on and Block 80 is vacant
	If 	$switch (4,11,1) = normal	Then	Control[80] = 1		'route is set for platform 1	
	Else							Control[80] = 2	Endif	'route is set for platform 2
	MoveTrainThroat (80, 81, 21, 77)					Endif	'call the sub to move the right train

When S75 = on	Do	If	B[75] < 5	Then					'when sensor 75 turns on and Block 75 is vacant
	If 	$switch (22,1,1) = normal	Then	Control[75] = 1		'route is set for platform 1	
	ElseIf $switch (23,2,1) = reversed	Then	Control[75] = 2		'route is set for platform 2	
	ElseIf $switch (24,3,1) = reversed	Then	Control[75] = 3		'route is set for platform 3	
	Else							Control[75] = 4	Endif	'route is set for the yard	
	MoveTrainThroat (75, 72, 51, 61)					Endif	'call the sub to move the right train

When S70 = on	Do	If	B[70] < 5	Then					'when sensor 70 turns on and Block 70 is vacant
	If 	$switch (2,11,1) = normal	Then	Control[70] = 3		'route is set for platform 3	
	ElseIf $switch (5,11,1) = normal	Then	Control[70] = 2		'route is set for platform 2	
	Else							Control[70] = 1	Endif	'route is set for platform 1	
	MoveTrainThroat (70, 71, 21, 77)					Endif	'call the sub to move the right train

When S60 = on	Do	If	B[60] < 5	Then	Control[60] = 1		'platform 1 is the only option from Block 60
	MoveTrainThroat (60, 43, 21, 67)					Endif	'call the sub to move the right train

When S40 = on	Do	If	B[40] < 5	Then					'when sensor 40 turns on and Block 40 is vacant
	If 	$switch (3,21,1) = normal	Then	Control[40] = 2		'route is set for platform 2	
	ElseIf $switch (5,21,1) = normal	Then	Control[40] = 3		'route is set for platform 3	
	ElseIf $switch (6,20,1) = reversed	Then	Control[40] = 4		'route is set for platform 4	
	Else							Control[40] = 5	Endif	'route is set for platform 5	
	If	$switch (1,19,1) = reversed	Then					'check the turnout on the other side of the block
		MoveTrainThroat (40, 31, 1, 45)					'if turnout 30 set for UpMain B[31]
	Else	MoveTrainThroat (40, 41, 1, 45) 			Endif Endif	'if turnout 30 set for Dn Main B[41]

When S30 = on	Do	If	B[30] < 5	Then					'when sensor 30 turns on and Block 30 is vacant
	If 	$switch (2,22,1) = normal	Then	Control[30] = 1		'route is set for platform 1	
	Else							Control[30] = 2	Endif	'route is set for platform 2	
	MoveTrainThroat (30, 31, 1, 45)					Endif	'call the sub to move the right train

When S50 = on	Do	If	B[50] < 5	Then					'when sensor 50 turns on and Block 50 is vacant
	If 	$switch (16,11,1) = reversed	Then	Control[50] = 1		'route is set for platform 1	
	ElseIf $switch (15,11,1) = normal	Then	Control[50] = 2		'route is set for platform 2	
	Else							Control[50] = 3	Endif	'route is set for platform 3	
	If	$switch (17,11,1) = normal	Then					'check the turnout on the other side of the block
		MoveTrainThroat (50, 33, 21, 77)					'if turnout 21 set for UpMain B[33]
	Else	MoveTrainThroat (50, 43, 21, 77) 			Endif Endif	'if turnout 21 set for Dn Main B[43]

When S10 = on	Do	If	B[10] < 5	Then					'when sensor 10 turns on and Block 10 is vacant
	If 	$switch (17,22,1) = reversed	Then	Control[10] = 1		'route is set for platform 1	
	Else							Control[10] = 2	Endif	'route is set for platform 2	
	MoveTrainThroat (10, 11, 1, 15)					Endif	'call the sub to move the right train

When S20 = on	Do	If	B[20] < 5	Then					'when sensor 20 turns on and Block 20 is vacant
	If 	$switch (16,21,1) = 1		Then	Control[20] = 2		'route is set for platform 2	
	ElseIf $switch (16,21,1) = 2		Then	Control[20] = 3		'route is set for platform 3	
	ElseIf $switch (18,20,1) = Reversed	Then	Control[20] = 90		'route is set from block 20 to block 90 or v.v.
	ElseIf $switch (16,21,1) = 0		Then	Control[20] = 3		'route is set for platform 3		
	Else							Control[20] = 2	Endif	'route is set for platform 2	
	If	$switch(16,21,1) = 1 or 
		$switch(16,21,1) = 2		Then					'if dbl slip set for block 90 then
		MoveTrainThroat (20, 90, 1, 15)					'pass block 90 to the sub
	Elseif $switch(20,22,1) = reversed	Then					'if turnout set for block 11
		MoveTrainThroat(20, 11, 1, 15)					'pass block 11 to the sub
	Else	MoveTrainThroat(20, 12, 1, 15)			Endif	Endif	'otherwise pass block 12 to the sub

When S90 = on	Do	If	B[90] < 5	Then					'when sensor 90 turns on and Block 90 is vacant
	If 	$switch (17,20,1) = 1	or
		$switch (17,20,1) = 3		Then	Control[90] = 20		'route is set from block 90 to block 20 or v.v.	
	ElseIf $switch (16,20,1) = reversed	Then	Control[90] = 5		'route is set for platform 5	
	Else							Control[90] = 4	Endif	'route is set for platform 4	
	If	$switch(17,20,1) = 1 or 
		$switch(17,20,1) = 2		Then					'if dbl slip set for the yard then
		MoveTrainThroat (90, 6, 1, 15)					'pass block 6 to the sub
	Elseif $switch(18,20,1) = normal	Then					'if turnout set for block 93
		MoveTrainThroat(90, 93, 1, 15)					'pass block 93 to the sub
	Else	MoveTrainThroat(90, 20, 1, 15)			Endif	Endif	'otherwise pass block 20 to the sub

{Platform Blocks}
When S53 = on	Do	MoveTrainPlat 	(53, 85, 0, 75, 0)							
When S52 = on	Do	MoveTrainPlat 	(52, 85, 0, 75, 0)							
When S51 = on	Do	MoveTrainPlat 	(51, 85, 0, 75, 0)										
When S23 = on	Do	MoveTrainPlat 	(23, 50, 0, 70, 0)			
When S22 = on	Do	MoveTrainPlat 	(22, 50, 0, 70, 80)
When S5 = on	Do	MoveTrainPlat 	(5, 90, 0, 40, 0)								
When S4 = on	Do	MoveTrainPlat 	(4, 90, 0, 40, 0)						
When S3 = on	Do	MoveTrainPlat 	(3, 20, 0, 40, 0)						
When S2 = on	Do	MoveTrainPlat 	(2, 10, 20, 30, 40)						
When S1 = on	Do	MoveTrainPlat 	(1, 10, 0, 30, 0)							
When S21 = on	Do	If $switch (8,10,1) = reversed		Then	
				MoveTrainPlat 	(21, 50, 60, 24, 0)	Else	
				MoveTrainPlat 	(21, 50, 60, 70, 80)	Endif		

When S55 = on	Do	B[55] = 10		'these blocks protect turnouts and are set to 10 as soon as occupied 
When S25 = on	Do	B[25] = 10	

When S99 = off	Do			ClearBlock (98)	ClearBlock (99)		
When S86 = off	Do	wait 6	ClearBlock (86)
When S85 = off	Do	wait 6	ClearThroat (85)
When S84 = off	Do  	wait 6  	ClearBlock (84)
When S82 = off	Do			ClearBlock (81)	ClearBlock (82)
When S81 = off	Do	wait 6	ClearBlock (81)
When S80 = off	Do	wait 6	ClearThroat (80)
When S72 = off	Do	wait 6	ClearBlock (72)
When S71 = off	Do	wait 6	ClearBlock (71)
When S70 = off	Do	wait 6	ClearThroat (70)
When S60 = off	Do	wait 6	ClearThroat (60)
When S53 = off	Do	wait 6	ClearBlock (53)				
When S52 = off	Do	wait 6	ClearBlock (52)	
When S51 = off	Do	wait 6	ClearBlock (51)	
When S50 = off	Do	wait 6	ClearThroat (50)	
When S43 = off	Do			ClearBlock (43)	ClearBlock (42)		
When S42 = off	Do			ClearBlock (41)	ClearBlock (42)	
When S41 = off	Do	wait 6	ClearBlock (41)
When S40 = off	Do	wait 6	ClearThroat (40)	
When S33 = off	Do			ClearBlock (33)	ClearBlock (32)		
When S32 = off	Do			ClearBlock (31)	ClearBlock (32)		
When S31 = off	Do	wait 6	ClearBlock (31)						
When S30 = off	Do	wait 6	ClearThroat (30)	
When S25 = off	Do	wait 6	ClearBlock (22)	B[25] = 0		
When S23 = off	Do	wait 6	ClearBlock (23)		
When S22 = off	Do	wait 6	ClearBlock (22)	
When S20 = off	Do	wait 6	ClearThroat (20)	
When S11 = off	Do	wait 6	ClearBlock (11)
When S10 = off	Do	wait 6	ClearThroat (10)	
When S5 = off	Do	wait 6	ClearBlock (5)		
When S4 = off	Do	wait 6	ClearBlock (4)		
When S3 = off	Do	wait 6	ClearBlock (3)		
When S2 = off	Do	wait 6	ClearBlock (2)		
When S1 = off	Do	wait 6	ClearBlock (1)		
When S55 = off	Do	wait 6	ClearBlock (53)	ClearBlock(54)		B[55] = 0	
When S44 = off	Do	wait 6	If B[43] = 5					Then	B[43] = 0				Endif	
When S34 = off	Do	wait 6	If B[33] = 5					Then	B[33] = 0				Endif	
When S96 = off	Do	B[96] = 0	If	B[91] = 5					Then	B[91] = 0
						ElseIf	B[92] = 5				Then	B[92] = 0			
						ElseIf	B[98] = 6				Then	B[98] = 0				Endif
When S95 = off	Do	B[95] = 0	If	B[91] = 6					Then	B[91] = 0
						ElseIf	B[92] = 6				Then	B[92] = 0			
						ElseIf	B[94] = 5				Then	B[94] = 0				Endif
When S93 = off	Do			If	B[93] > 9					Then	MoveTrain (94, 93, 0, 0)	Endif	
				Wait 6 	ClearBlock (93)
When S83 = off	Do	If 		B[83] > 9, $switch (15,3,1) = normal	Then	MoveTrain (82, 0, 83, 0)	
				ElseIf 	B[83] > 9, $switch (15,3,1) = reversed	Then	MoveTrain (99, 0, 83, 0)	Endif
				wait 6	ClearBlock (83)
When S90 = off	Do			If 	B[6] = 2		Then	B[6] = 10, L[6] = L[90], L[90] = 0, B[90] = 5	Endif
			 	wait 6	ClearThroat (90)
When S75 = off	Do	If		B[75] > 9, Control[75] = 54	Then	B[54]=10,  L[54]=L[75], B[75]=5, L[75]=0 	Endif
				wait 6	ClearThroat (75)
When S12 = off	Do			If S20 = off, 	B[12] > 9	Then	MoveTrain (11, 12, 0, 0)			Endif	
				wait 6	ClearBlock (12)		
When S21 = off	Do			If B[21] > 9, $switch(8,10,1)=reversed  Then	B[24]=10, L[24]=L[21], L[21]=0, B[21]=5
			Else	wait 6	ClearBlock (21)											Endif



{Section 16	@@@@@@@@@@@@@@@@@@ Train Image and Schedule Display @@@@@@@@@@@@@@@@@@@@}
{The draw sub routine draws the loco's image and schedule when the block is occupied.
The parameters are: Draw (block, facing, left end of loco image, display) 	Facing is 1 if an up train should be facing right on this block. 0 if facing left. If Display is set to 0 then the display will not be drawn. 1 means it will be drawn.}

When B[21] > 9		Do	Draw (21, 0, (9,10,1), 1)		When B[21] < 10		Do	Erase ((8,10,1))	
When B[22] > 9		Do	Draw (22, 0, (9,11,1), 1)		When B[22] < 10		Do	Erase ((8,11,1)) 
When B[23] > 9		Do	Draw (23, 0, (9,12,1), 1)		When B[23] < 10		Do	Erase ((8,12,1)) 
When B[24] > 9		Do	Draw (24, 0, (3, 9,1), 0)		When B[24] < 10		Do	Erase ((2,9,1))
When B[51] > 9		Do	Draw (51, 0, (27,1,1), 1)		When B[51] < 10		Do	Erase ((26,1,1))
When B[52] > 9		Do	Draw (52, 0, (27,2,1), 1)		When B[52] < 10		Do	Erase ((26,2,1))
When B[53] > 9		Do	Draw (53, 0, (27,3,1), 1)		When B[53] < 10		Do	Erase ((26,3,1))
When B[54] > 9		Do	Draw (54, 0, (27,4,1), 0)		When B[54] < 10		Do	Erase ((26,4,1))
When B[1] > 9		Do	Draw (1, 0, (10,23,1), 1)		When B[1] < 10		Do	Erase ((9,23,1))
When B[2] > 9		Do	Draw (2, 0, (10,22,1), 1)		When B[2] < 10		Do	Erase ((9,22,1))
When B[3] > 9		Do	Draw (3, 0, (10,21,1), 1)		When B[3] < 10		Do	Erase ((9,21,1))
When B[4] > 9		Do	Draw (4, 0, (10,20,1), 1)		When B[4] < 10		Do	Erase ((9,20,1))
When B[5] > 9		Do	Draw (5, 0, (10,19,1), 1)		When B[5] < 10		Do	Erase ((9,19,1))
When B[6] > 9		Do	Draw (6, 0, (20,19,1), 0)		When B[6] < 10		Do	Erase ((19,19,1))
When B[99] > 9		Do	Draw (99, 1, (9,4,1), 0)		When B[99] < 10		Do	Erase ((8,4,1))
When B[98] > 9		Do	Draw (98, 0, (9,7,1), 0)		When B[98] < 10		Do	Erase ((8,7,1))
When B[92] > 9		Do	Draw (92, 0, (17,8,1), 0)		When B[92] < 10		Do	Erase ((16,8,1))
When B[91] > 9		Do	Draw (91, 0, (17,7,1), 0)		When B[91] < 10		Do	Erase ((16,7,1))
When B[94] > 9		Do	Draw (94, 0, (24,11,1), 0)		When B[94] < 10		Do	Erase ((23,11,1))
When B[93] > 9		Do	Draw (93, 0, (22,20,1), 1)		When B[93] < 10		Do	Erase ((21,20,1))
When B[86] > 9		Do	Draw (86, 1, (31,10,1), 1)		When B[86] < 10		Do	Erase ((30,10,1))
When B[84] > 9		Do	Draw (84, 1, (24,6,1), 1)		When B[84] < 10		Do	Erase ((23,6,1))
When B[83] > 9		Do	Draw (83, 1, (17,3,1), 0)		When B[83] < 10		Do	Erase ((17,3,1))
When B[82] > 9		Do	Draw (82, 1, (9,3,1), 1)		When B[82] < 10		Do	Erase ((9,3,1)) 
When B[81] > 9		Do	Draw (81, 1, (4,3,1), 1)		When B[81] < 10		Do	Erase ((4,3,1))
When B[72] > 9		Do	Draw (72, 0, (15,1,1), 1)		When B[72] < 10		Do	Erase ((14,1,1))
When B[71] > 9		Do	Draw (71, 1, (3,1,1), 1)		When B[71] < 10		Do	Erase ((2,1,1))
When B[43] > 9		Do	Draw (43, 1, (16,15,1), 1)		When B[43] < 10		Do	Erase ((15,15,1))
When B[42] > 9		Do	Draw (42, 1, (10,15,1), 1)		When B[42] < 10		Do	Erase ((9,15,1))
When B[41] > 9		Do	Draw (41, 1, (4,15,1), 1)		When B[41] < 10		Do	Erase ((3,15,1))
When B[33] > 9		Do	Draw (33, 1, (16,14,1), 1)		When B[33] < 10		Do	Erase ((15,14,1))
When B[32] > 9		Do	Draw (32, 1, (10,14,1), 1)		When B[32] < 10		Do	Erase ((9,14,1))	
When B[31] > 9		Do	Draw (31, 1, (4,14,1), 1)		When B[31] < 10		Do	Erase ((3,14,1))
When B[12] > 9		Do	Draw (12, 0, (23,21,1), 1)		When B[12] < 10		Do	Erase ((22,21,1))
When B[11] > 9		Do	Draw (11, 0, (23,22,1), 1)		When B[11] < 10		Do	Erase ((22,22,1))
When L[8] > 0		Do	Draw (8, 0, (29,23,1), 0)		'Handheld 1
When L[9] > 0		Do	Draw (9, 0, (33,23,1), 0)		'Handheld 2	


{Section 17	@@@@@@@@@@@@@@@@@@@@@@@@ new train commands @@@@@@@@@@@@@@@@@@@@}
{parameters are: AssignTrain (block, coordinate for lefthand end of loco image)}

When $left_mouse = (10,10,1) 		Do	AssignTrain (21, (9,10,1))	
When $left_mouse = (10,11,1) 		Do	AssignTrain (22, (9,11,1))	
When $left_mouse = (10,12,1) 		Do	AssignTrain (23, (9,12,1))	
When $left_mouse = (4-5,9,1) 		Do	AssignTrain (24, (3,9,1))		
When $left_mouse = (27-28,1,1) 	Do	AssignTrain (51, (26,1,1))	
When $left_mouse = (27-28,2,1) 	Do	AssignTrain (52, (26,2,1))	
When $left_mouse = (27-28,3,1) 	Do	AssignTrain (53, (26,3,1))
When $left_mouse = (29-31,4,1) 	Do	AssignTrain (54, (27,4,1))
When $left_mouse = (21-22,19,1)	Do	AssignTrain (6, (20,19,1))	
When $left_mouse = (11,23,1) 		Do	AssignTrain (1, (10,23,1))	
When $left_mouse = (11,22,1) 		Do	AssignTrain (2, (10,22,1))	
When $left_mouse = (11,21,1) 		Do	AssignTrain (3, (10,21,1))	
When $left_mouse = (11,20,1) 		Do	AssignTrain (4, (10,20,1))	
When $left_mouse = (11,19,1) 		Do	AssignTrain (5, (10,19,1))
When $left_mouse = (8-12,4,1) 	Do	AssignTrain (99, (9,4,1))
When $left_mouse = (8-12,7,1) 	Do	AssignTrain (98, (9,7,1))	
When $left_mouse = (18-19,8,1) 	Do	AssignTrain (92, (17,8,1))	
When $left_mouse = (18-19,7,1) 	Do	AssignTrain (91, (17,7,1))
When $left_mouse = (25,10-13,1) 	Do	AssignTrain (94, (24,11,1))	
When $left_mouse = (21-24,20,1) 	Do	AssignTrain (93, (21,20,1))	
When $left_mouse = (19,20,1) 		Do	AssignTrain (90, (16,20,1))	
When $left_mouse = (30-34,10,1)	Do	AssignTrain (86, (31,10,1))
When $left_mouse = (34,1,1)		Do	AssignTrain (85, (33,1,1))			
When $left_mouse = (24-26,6,1)	Do	AssignTrain (84, (24,6,1))		
When $left_mouse = (17-21,3,1)	Do	AssignTrain (83, (17,3,1))		
When $left_mouse = (8-12,3,1)		Do	AssignTrain (82, (9,3,1))	
When $left_mouse = (3-7,3,1)		Do	AssignTrain (81, (4,3,1))	
When $left_mouse = (2,9,1)		Do	AssignTrain (80, (2,10,1))				
When $left_mouse = (12-20,1,1)	Do	AssignTrain (72, (15,1,1))
When $left_mouse = (3-10,1,1)		Do	AssignTrain (71, (3,1,1))
When $left_mouse = (1,9-10,1)		Do	AssignTrain (70, (1,11,1))			
When $left_mouse = (16-17,10,1)	Do	AssignTrain (60, (15,10,1))	
When $left_mouse = (18,11,1)		Do	AssignTrain (50, (15,11,1))
When $left_mouse = (15-21,15,1)	Do	AssignTrain (43, (16,15,1))
When $left_mouse = (9-13,15,1)	Do	AssignTrain (42, (10,15,1))
When $left_mouse = (3-7,15,1)		Do	AssignTrain (41, (4,15,1))
When $left_mouse = (2,20,1)		Do	AssignTrain (40, (2,21,1))					
When $left_mouse = (15-20,14,1)	Do	AssignTrain (33, (16,14,1))	
When $left_mouse = (9-14,14,1)	Do	AssignTrain (32, (10,14,1))
When $left_mouse = (3-7,14,1)		Do	AssignTrain (31, (4,14,1))	
When $left_mouse = (1,21,1)		Do	AssignTrain (30, (1,22,1))				
When $left_mouse = (22-25,21,1)	Do	AssignTrain (12, (22,21,1))
When $left_mouse = (18,21,1) 		Do	AssignTrain (20, (16,21,1))		
When $left_mouse = (22-25,22,1)	Do	AssignTrain (11, (22,22,1))
When $left_mouse = (18,22,1) 		Do	AssignTrain (10, (17,22,1))	
When $left_mouse = (29-31,23,1) 	Do	AssignTrain (8, (29,23,1))			{Handheld1}
When $left_mouse = (33-35,23,1) 	Do	AssignTrain (9, (33,23,1))			{Handheld2}	


{Section 18	@@@@@@@@@@@@@@@@@@ block/train cancel by mouse click @@@@@@@@@@@@@@@@@@@@}
When $right_mouse = (10,10,1) 	Do	B[21] = 0, L[21] = off, 	
When $right_mouse = (10,11,1) 	Do	B[22] = 0, L[22] = off, 
When $right_mouse = (6,11,1) 		Do	B[25] = 0, L[25] = off, 
When $right_mouse = (10,12,1) 	Do	B[23] = 0, L[23] = off, 
When $right_mouse = (4-5,9,1) 	Do	B[24] = 0, L[24] = off, 
When $right_mouse = (29-31,4,1)	Do	B[54] = 0, L[54] = off, 
When $right_mouse = (27-28,1,1)	Do	B[51] = 0, L[51] = off, 
When $right_mouse = (27-28,2,1)	Do	B[52] = 0, L[52] = off, 
When $right_mouse = (27-28,3,1)	Do	B[53] = 0, L[53] = off,
When $right_mouse = (21-22,19,1) 	Do	B[6] = 0, L[6] = off, 
When $right_mouse = (11,23,1)		Do	B[1] = 0, L[1] = off,
When $right_mouse = (11,22,1)		Do	B[2] = 0, L[2] = off,
When $right_mouse = (11,21,1)		Do	B[3] = 0, L[3] = off, 
When $right_mouse = (11,20,1)		Do	B[4] = 0, L[4] = off,
When $right_mouse = (11,19,1)		Do	B[5] = 0, L[5] = off, 
When $right_mouse = (8-12,4,1)	Do	B[99] = 0, L[99] = off, 
When $right_mouse = (8-12,7,1)	Do	B[98] = 0, L[98] = off, 
When $right_mouse = (18-19,8,1)	Do	B[92] = 0, L[92] = off, 
When $right_mouse = (18-19,7,1)	Do	B[91] = 0, L[91] = off, 
When $right_mouse = (25,10-13,1) 	Do	B[94] = 0, L[94] = off,
When $right_mouse = (21-24,20,1) 	Do	B[93] = 0, L[93] = off,
When $right_mouse = (19,20,1)		Do	B[90] = 0, L[90] = off,
When $right_mouse = (30-34,10,1) 	Do	B[86] = 0, L[86] = off, 
When $right_mouse = (34,1,1)		Do	B[85] = 0, L[85] = off, 
When $right_mouse = (24-26,6,1)	Do	B[84] = 0, L[84] = off, 
When $right_mouse = (17-21,3,1)	Do	B[83] = 0, L[83] = off, 
When $right_mouse = (8-12,3,1)	Do	B[82] = 0, L[82] = off, 
When $right_mouse = (3-7,3,1)		Do	B[81] = 0, L[81] = off, 
When $right_mouse = (2,9,1)		Do	B[80] = 0, L[80] = off, 
When $right_mouse = (12-20,1,1)	Do	B[72] = 0, L[72] = off, 
When $right_mouse = (3-10,1,1)	Do	B[71] = 0, L[71] = off, 
When $right_mouse = (1,9-10,1)	Do	B[70] = 0, L[70] = off, 
When $right_mouse = (16-17,10,1) 	Do	B[60] = 0, L[60] = off, 
When $right_mouse = (18,11,1)		Do	B[50] = 0, L[50] = off, 
When $right_mouse = (15-21,15,1) 	Do	B[43] = 0, L[43] = off, 
When $right_mouse = (9-13,15,1)	Do	B[42] = 0, L[42] = off, 
When $right_mouse = (3-7,15,1)	Do	B[41] = 0, L[41] = off, 
When $right_mouse = (2,20,1)		Do	B[40] = 0, L[40] = off, 
When $right_mouse = (15-20,14,1) 	Do	B[33] = 0, L[33] = off, 
When $right_mouse = (9-13,14,1)	Do	B[32] = 0, L[32] = off, 
When $right_mouse = (3-7,14,1)	Do	B[31] = 0, L[31] = off, 
When $right_mouse = (1,21,1)		Do	B[30] = 0, L[30] = off,
When $right_mouse = (22-25,21,1) 	Do	B[12] = 0, L[12] = off, 
When $right_mouse = (18,21,1)		Do	B[20] = 0, L[20] = off, 
When $right_mouse = (22-25,22,1) 	Do	B[11] = 0, L[11] = off, 
When $right_mouse = (18,22,1)		Do	B[10] = 0, L[10] = off, 


{Section 19	@@@@@@@@@@@@@@@@@@@ Train Properties and Throttle Controls @@@@@@@@@@@@@@@@@@}

Always Do	
speed[1]=V100.speed		$Draw Message (33.5,13,1) = "@speed[1]"		$color sprite (33,13,1) = white
speed[2]=spare2.speed		$Draw Message (33.5,14,1) = "@speed[2]"		$color sprite (33,14,1) = white
speed[3]=Steam.speed		$Draw Message (33.5,15,1) = "@speed[3]" 		$color sprite (33,15,1) = white
speed[4]=Re44.speed		$Draw Message (33.5,16,1) = "@speed[4]"	 	$color sprite (33,16,1) = white
speed[5]=DB101.speed		$Draw Message (33.5,17,1) = "@speed[5]"	 	$color sprite (33,17,1) = white
speed[6]=spare6.speed		$Draw Message (33.5,18,1) = "@speed[6]"		$color sprite (33,18,1) = white
speed[7]=W740.speed		$Draw Message (33.5,19,1) = "@speed[7]" 		$color sprite (33,19,1) = white	

When	$left_mouse = (29-31,13,1) 		or $command = S1F		Do	V100.speed = 12		
When	$Right_Mouse = (29-31,13,1)		or $command = S10		Do	V100.speed = 0
When	$left_mouse = (29-31,14,1) 		or $command = S2F		Do	spare2.speed = 12		
When	$Right_Mouse = (29-31,14,1)		or $command = S20		Do	spare2.speed = 0
When	$left_mouse = (29-31,15,1)		or $command = S3F		Do	Steam.speed= 12		
When	$Right_Mouse = (29-31,15,1)		or $command = S30		Do	Steam.speed = 0
When	$left_mouse = (29-31,16,1)		or $command = S4F		Do	Re44.speed = 12		
When	$Right_Mouse = (29-31,16,1)		or $command = S40		Do	Re44.speed = 0
When	$left_mouse = (29-31,17,1)		or $command = S5F		Do	DB101.speed = 12		
When	$Right_Mouse = (29-31,17,1)		or $command = S50		Do	DB101.speed = 0
When	$left_mouse = (29-31,18,1) 		or $command = S6F		Do	spare6.speed = 12		
When	$Right_Mouse = (29-31,18,1)		or $command = S60		Do	spare6.speed = 0
When	$left_mouse = (29-31,19,1)		or $command = S7F		Do	W740.speed = 12		
When	$Right_Mouse = (29-31,19,1)		or $command = S70		Do	W740.speed = 0

When	$left_mouse = (33,13,1)	Do	V100.speed = +		When	$Right_Mouse = (33,13,1)	Do	V100.speed = -
When	$left_mouse = (33,14,1)	Do	spare2.speed = +		When	$Right_Mouse = (33,14,1)	Do	spare2.speed = -
When	$left_mouse = (33,15,1)	Do	Steam.speed = +		When	$Right_Mouse = (33,15,1)	Do	Steam.speed = -
When	$left_mouse = (33,16,1)	Do	Re44.speed = +		When	$Right_Mouse = (33,16,1)	Do	Re44.speed = -
When	$left_mouse = (33,17,1)	Do	DB101.speed = +		When	$Right_Mouse = (33,17,1)	Do	DB101.speed = -
When	$left_mouse = (33,18,1)	Do	spare6.speed = +		When	$Right_Mouse = (33,18,1)	Do	spare6.speed = -
When	$left_mouse = (33,19,1)	Do	W740.speed = +		When	$Right_Mouse = (33,19,1)	Do	W740.speed = -

When	$command = S1H	Do	V100.speed = 9
When	$command = S2H	Do	spare2.speed = 9
When	$command = S3H	Do	Steam.speed = 9
When	$command = S4H	Do	Re44.speed = 9
When	$command = S5H	Do	DB101.speed = 9
When	$command = S6H	Do	spare6.speed = 9
When	$command = S7H	Do	W740.speed = 9

{Brake}	
When V100.brake = on	Do	$Signal (34,13,1) = "xR"	
'When spare2.brake = on	Do	$Signal (34,14,1) = "xR"
When Steam.brake = on	Do	$Signal (34,15,1) = "xR"	
When Re44.brake = on	Do	$Signal (34,16,1) = "xR"	
When DB101.brake = on	Do	$Signal (34,17,1) = "xR"		
'When spare6.brake = on	Do	$Signal (34,18,1) = "xR"
When W740.brake = on	Do	$Signal (34,19,1) = "xR"	

When	$left_mouse = (34,13,1) or $command = B1	Do If V100.brake = on	Then 	V100.brake = off	$Signal (34,13,1) = "--"
								Else 	V100.brake = on    	$Signal (34,13,1) = "RR"	Endif
When	$left_mouse = (34,14,1) or $command = B2	Do If spare2.brake = on	Then 	spare2.brake = off $Signal (34,14,1) = "--"
								Else 	spare2.brake = on    	$Signal (34,14,1) = "RR"	Endif
When	$left_mouse = (34,15,1) or $command = B3	Do If Steam.brake = on	Then	Steam.brake = off	$Signal (34,15,1) = "--"
								Else 	Steam.brake = on    	$Signal (34,15,1) = "RR"  	Endif
When	$left_mouse = (34,16,1) or $command = B4	Do If Re44.brake = on	Then	Re44.brake = off	$Signal (34,16,1) = "--"
								Else 	Re44.brake = on    	$Signal (34,16,1) = "RR"    	Endif
When	$left_mouse = (34,17,1) or $command = B5	Do If DB101.brake = on	Then	DB101.brake = off	$Signal (34,17,1) = "--"
								Else 	DB101.brake = on    	$Signal (34,17,1) = "RR"   	Endif
When	$left_mouse = (34,18,1) or $command = B6	Do If spare6.brake = on	Then 	spare6.brake = off $Signal (34,18,1) = "--"
								Else 	spare6.brake = on    	$Signal (34,18,1) = "RR"	Endif
When	$left_mouse = (34,19,1) or $command = B7	Do If W740.brake = on	Then	W740.brake = off	$Signal (34,19,1) = "--"
								Else 	W740.brake = on    	$Signal (34,19,1) = "RR"   	Endif
When $command = BA	Do Index = &V100.brake,	Until Index > 2850	Loop	'set index = to address of 1st loco's brake
					*Index = on	Index = ++	Endloop	Index = 0	'turns brake on for all trains	
	$Signal (34,13,1) = "RR",	$Signal (34,15,1) = "RR",	$Signal (34,16,1) = "RR",	$Signal (34,17,1) = "RR",	$Signal (34,19,1) = "RR"

{Light}		
When V100.Fl = on		Do	$Signal (36,13,1) = "W"	When 	V100.Fl = off		Do	$Signal (36,13,1) = "-"
When spare2.Fl = on	Do	$Signal (36,14,1) = "W"	When 	V100.Fl = off		Do	$Signal (36,14,1) = "-"
When Steam.Fl = on	Do	$Signal (36,15,1) = "W"	When 	Steam.Fl = off		Do	$Signal (36,15,1) = "-"
When Re44.Fl = on		Do	$Signal (36,16,1) = "W"	When 	Re44.Fl = off		Do	$Signal (36,16,1) = "-"
When DB101.Fl = on	Do	$Signal (36,17,1) = "W"	When 	DB101.Fl = off		Do	$Signal (36,17,1) = "-"
When spare6.Fl = on	Do	$Signal (36,18,1) = "W"	When 	V100.Fl = off		Do	$Signal (36,18,1) = "-"
When W740.Fl = on		Do	$Signal (36,19,1) = "W"	When 	W740.Fl = off		Do	$Signal (36,19,1) = "-"

When	$left_mouse = (36,13,1) or $command = L1	Do 	If V100.Fl = on	Then	V100.Fl = off	Else V100.Fl = on	Endif
When	$left_mouse = (36,14,1) or $command = L2	Do 	If spare2.Fl = on	Then	spare2.Fl = off	Else spare2.Fl = on Endif
When	$left_mouse = (36,15,1) or $command = L3	Do 	If Steam.Fl = on	Then	Steam.Fl = off	Else Steam.Fl = on Endif
When	$left_mouse = (36,16,1) or $command = L4	Do	If Re44.Fl = on	Then	Re44.Fl = off	Else Re44.Fl = on	Endif
When	$left_mouse = (36,17,1) or $command = L5	Do	If DB101.Fl = on	Then	DB101.Fl = off	Else DB101.Fl = on Endif
When	$left_mouse = (36,18,1) or $command = L6	Do	If spare2.Fl = on	Then	spare6.Fl = off	Else spare6.Fl = on Endif
When	$left_mouse = (36,19,1) or $command = L7	Do	If W740.Fl = on	Then	W740.Fl = off	Else W740.Fl = on	Endif

{Direction}	
When	$left_mouse = (35,13,1) or $command = D1		Do 	Direction (1)
When	$left_mouse = (35,14,1) or $command = D2		Do 	Direction (2)
When	$left_mouse = (35,15,1) or $command = D3		Do 	Direction (3)
When	$left_mouse = (35,16,1) or $command = D4		Do 	Direction (4)
When	$left_mouse = (35,17,1) or $command = D5		Do 	Direction (5)
When	$left_mouse = (35,18,1) or $command = D6		Do 	Direction (6)
When	$left_mouse = (35,19,1) or $command = D7		Do 	Direction (7)	

{Mode}	
When	$left_mouse = (37,13,1) or $command = M1		Do	Mode (1)
When	$left_mouse = (37,14,1) or $command = M2		Do	Mode (2)
When	$left_mouse = (37,15,1) or $command = M3		Do	Mode (3)
When	$left_mouse = (37,16,1) or $command = M4		Do	Mode (4)
When	$left_mouse = (37,17,1) or $command = M5		Do	Mode (5)
When	$left_mouse = (37,18,1) or $command = M6		Do	Mode (6)
When	$left_mouse = (37,19,1) or $command = M7		Do	Mode (7)

{Set all trains to Automatic, Random Trains, with lights on}
When $left_mouse = (37,2,1) 	Do	Index = 1,	Until Index = 10	Loop		Schedule[index] = 2,	Schedule (index),								'set all trains to schedule 2 - the sub then changes it to 3 and displays it
	Mode[Index] = 1,	Mode (index)	'set all trains to mode 1 - then sub changes it to 0 and displays it
	Index = +		Endloop					'increase the index to point to the next train and repeat
	Index = &V100.Fl	Until Index > 2850	Loop		'set index = to address of light (f1) for 1st loco
	*Index = on	Index = ++	Endloop	Index = 0		'turns light on for all trains	

{Schedule}	When	$left_mouse = (38,13,1) or $command = R1	 or $reset=true		Do	Schedule (1)
		When	$left_mouse = (38,14,1) or $command = R2	 or $reset=true		Do	Schedule (2)
		When	$left_mouse = (38,15,1) or $command = R3	 or $reset=true		Do	Schedule (3)
		When	$left_mouse = (38,16,1) or $command = R4	 or $reset=true		Do	Schedule (4)
		When	$left_mouse = (38,17,1) or $command = R5	 or $reset=true		Do	Schedule (5)
		When	$left_mouse = (38,18,1) or $command = R6	 or $reset=true		Do	Schedule (6)
		When	$left_mouse = (38,19,1) or $command = R7	 or $reset=true		Do	Schedule (7)

{Passenger Train} When	Schedule[1] > 9		Do	$Draw Picture (39,13,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[1] < 9		Do	$Erase SmallPicture (39,13,1) 
			When	Schedule[2] > 9		Do	$Draw Picture (39,14,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[2] < 9		Do	$Erase SmallPicture (39,14,1)
			When	Schedule[3] > 9		Do	$Draw Picture (39,15,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[3] < 9		Do	$Erase SmallPicture (39,15,1)
			When	Schedule[4] > 9		Do	$Draw Picture (39,16,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[4] < 9		Do	$Erase SmallPicture (39,16,1) 
			When	Schedule[5] > 9		Do	$Draw Picture (39,17,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[5] < 9		Do	$Erase SmallPicture (39,17,1) 
			When	Schedule[6] > 9		Do	$Draw Picture (39,18,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[6] < 9		Do	$Erase SmallPicture (39,18,1)
			When	Schedule[7] > 9		Do	$Draw Picture (39,19,1) = "C:\Program Files\TBrain\Station.jpg"
			When 	Schedule[7] < 9		Do	$Erase SmallPicture (39,19,1)  
When	$left_mouse = (39,13,1) or $command = P1	Do If schedule[1] > 9 	Then 	schedule[1] = 10-	Else	schedule[1]=10+ Endif
When	$left_mouse = (39,14,1) or $command = P2	Do If Schedule[2] > 9	Then 	schedule[2] = 10-	Else 	schedule[2]=10+ Endif
When	$left_mouse = (39,15,1) or $command = P3	Do If Schedule[3] > 9	Then 	schedule[3] = 10-	Else 	schedule[3]=10+ Endif
When	$left_mouse = (39,16,1) or $command = P4	Do If schedule[4] > 9	Then 	schedule[4] = 10-	Else 	schedule[4]=10+ Endif
When	$left_mouse = (39,17,1) or $command = P5	Do If schedule[5] > 9	Then 	schedule[5] = 10-	Else	schedule[5]=10+ Endif
When	$left_mouse = (39,18,1) or $command = P6	Do If Schedule[6] > 9	Then 	schedule[6] = 10-	Else 	schedule[6]=10+ Endif
When	$left_mouse = (39,19,1) or $command = P7	Do If schedule[7] > 9	Then 	schedule[7] = 10-	Else 	schedule[7]=10+ Endif

{Hold Train at Next Station}
When $command = H1	or	L[7] = &V100	or $command = HA	Do	Hold (1, (38,13,1))	
When $command = H2	or	L[7] = &spare2	or $command = HA	Do	Hold (2, (38,14,1))	
When $command = H3	or	L[7] = &Steam	or $command = HA	Do	Hold (3, (38,15,1))
When $command = H4	or	L[7] = &Re44	or $command = HA	Do	Hold (4, (38,16,1))	
When $command = H5	or	L[7] = &DB101	or $command = HA	Do	Hold (5, (38,17,1))
When $command = H6	or	L[7] = &spare6	or $command = HA	Do	Hold (6, (38,18,1))	
When $command = H7	or	L[7] = &W740	or $command = HA	Do	Hold (7, (38,19,1))	



{Section 20	@@@@@@@@@@@@@@@@@  Keyboard Commands for Direct Point Control  @@@@@@@@@@@@@@@@}

When $command = T30	Do If $switch (1,19,1) = Normal	
				Then 	$switch (1,19,1) = Reversed	Else $switch (1,19,1) = Normal	Endif	
						When $switch (1,19,1) = Normal 		Do 	$switch (2,20,1) = Reversed 		
						When $switch (1,19,1) = Reversed		Do 	$switch (2,20,1) = Normal 
When $command = T1	Do If $switch (2,22,1) = Normal	
				Then 	$switch (2,22,1) = Reversed 	Else $switch (2,22,1) = Normal	Endif	
When $command = T2	Do If $switch (4,22,1) = Normal	
				Then 	$switch (4,22,1) = Reversed 	Else $switch (4,22,1) = Normal	Endif	
						When $switch (4,22,1) = Normal 		Do 	$switch (3,21,1) = Reversed 		
						When $switch (4,22,1) = Reversed		Do 	$switch (3,21,1) = Normal 
When $command = T3	Do If $switch (5,21,1) = Normal	
				Then $switch (5,21,1) = Reversed	Else $switch (5,21,1) = Normal	Endif	
When $left_mouse=(7,19,1) or $command = T4	or RouteEntry = 4		'for operation of T4 (from plat. 5 to the yard) 
				Do If $switch (6,20,1) = Normal	
				Then 	$switch (6,20,1) = Reversed	Else $switch (6,20,1) = Normal	Endif	
						When $switch (6,20,1) = Normal 		Do 	$switch (7,19,1) = 3 		
						When $switch (6,20,1) = Reversed		Do 	$switch (7,19,1) = 0
When $command = T11	Do If $switch (17,22,1) = Normal	
				Then $switch (17,22,1) = Reversed   Else $switch (17,22,1) = Normal	Endif	
When $command = T14	Do If $switch (16,20,1) = Normal	
				Then $switch (16,20,1) = Reversed Else $switch (16,20,1) = Normal	Endif	
						When $switch (16,20,1) = Normal 		Do	$switch (15,19,1) = Normal 		
						When $switch (16,20,1) = Reversed	Do	$switch (15,19,1) = Reversed
When $command = T21	Do If $switch (17,11,1) = Normal	
				Then $switch (17,11,1) = Reversed Else $switch (17,11,1) = Normal	Endif	
						When $switch (17,11,1) = Normal  		Do	$switch (18,10,1) = Normal   		
						When $switch (17,11,1) = Reversed  	Do	$switch (18,10,1) = Reversed
When $command = T22	Do If $switch (16,11,1) = Normal	
				Then $switch (16,11,1) = Reversed Else $switch (16,11,1) = Normal	Endif	
						When $switch (16,11,1) = Normal  		Do	$switch (15,10,1) = Normal 								When $switch (16,11,1) = Reversed  	Do	$switch (15,10,1) = Reversed
When $command = T23	Do If $switch (15,11,1) = Normal	
				Then $switch (15,11,1) = Reversed  Else $switch (15,11,1) = Normal	Endif	
When $command = T24	Do If $switch (8,10,1) = Normal	
				Then $switch (8,10,1) = Reversed	Else $switch (8,10,1) = Normal	Endif	
When $command = T25	Do If $switch (5,11,1) = Normal	
				Then $switch (5,11,1) = Reversed	Else $switch (5,11,1) = Normal	Endif	
						When $switch (5,11,1) = Normal		Do	$switch (6,10,1) = Normal 	
						When $switch (5,11,1) = Reversed		Do	$switch (6,10,1) = Reversed 
When $command = T26	Do If $switch (4,11,1) = Normal	
				Then $switch (4,11,1) = Reversed	Else $switch (4,11,1) = Normal	Endif	
						When $switch (4,11,1) = Normal		Do	$switch (3,10,1) = Reversed 		
						When $switch (4,11,1) = Reversed		Do	$switch (3,10,1) = Normal  
When $command = T27	Do If $switch (2,11,1) = Normal	
				Then $switch (2,11,1) = Reversed	Else $switch (2,11,1) = Normal	Endif	
When $command = T8	Do If $switch (15,3,1) = Normal	
				Then $switch (15,3,1) = Reversed	Else $switch (15,3,1) = Normal	Endif	
When $command = T51	Do If $switch (22,1,1) = Normal	
				Then $switch (22,1,1) = Reversed	Else $switch (22,1,1) = Normal	Endif	
When $command = T52	Do If $switch (23,2,1) = Normal	
				Then $switch (23,2,1) = Reversed	Else $switch (23,2,1) = Normal	Endif	
When $command = T53	Do If $switch (24,3,1) = Normal	
				Then $switch (24,3,1) = Reversed	Else $switch (24,3,1) = Normal	Endif	
When $command = T55	Do If $switch (32,2,1) = Normal	
				Then $switch (32,2,1) = Reversed	Else $switch (32,2,1) = Normal	Endif	
When $command = T56	Do If $switch (33,1,1) = Normal	
				Then $switch (33,1,1) = Reversed	Else $switch (33,1,1) = Normal	Endif	
When $command = T96	Do If $switch (14,7,1) = Normal	
				Then $switch (14,7,1) = Reversed	Else $switch (14,7,1) = Normal	Endif	
When $command = T95	Do If $switch (23,8,1) = Normal	
				Then $switch (23,8,1) = Reversed	Else $switch (23,8,1) = Normal	Endif	

When $command = T10	Do If $switch (20,22,1) = Normal	
				Then $switch (20,22,1) = Reversed 	Else $switch (20,22,1) = Normal	Endif	
						When $switch (20,22,1) = Normal 		Do
						If	$switch (19,21,1) = 1		Then	$switch (19,21,1) = 3		
						Elseif $switch (19,21,1) = 2		Then 	$switch (19,21,1) = 0	Endif
						When $switch (20,22,1) = Reversed 	Do
						If	$switch (19,21,1) = 3		Then	$switch (19,21,1) = 1			
						Elseif $switch (19,21,1) = 0		Then 	$switch (19,21,1) = 2	Endif
						When $switch (19,21,1) = 1 or $switch (19,21,1) = 2	Do $switch (20,22,1) = Reversed
						When $switch (19,21,1) = 0 or $switch (19,21,1) = 3	Do $switch (20,22,1) = Normal
When $command = T20	Do If $switch (18,20,1) = Normal   	
				Then $switch (18,20,1) = Reversed Else $switch (18,20,1) = Normal 	Endif			
						When $switch (18,20,1) = Normal 		Do
						If	$switch (19,21,1) = 1		Then	$switch (19,21,1) = 2		
						Elseif $switch (19,21,1) = 3		Then 	$switch (19,21,1) = 0	Endif
						When $switch (18,20,1) = Reversed 	Do
						If	$switch (19,21,1) = 2		Then	$switch (19,21,1) = 1			
						Elseif $switch (19,21,1) = 0		Then 	$switch (19,21,1) = 3	Endif
						When $switch (19,21,1) = 1 or $switch (19,21,1) = 3	Do $switch (18,20,1) = Reversed
						When $switch (19,21,1) = 0 or $switch (19,21,1) = 2	Do $switch (18,20,1) = Normal
When $command = T12	Do If $switch (15,22,1) = Normal  	
				Then $switch (15,22,1) = Reversed Else $switch (15,22,1) = Normal	Endif	
						When $switch (15,22,1) = Normal		Do
						If	$switch (16,21,1) = 1		Then	$switch (16,21,1) = 2	
						Elseif $switch (16,21,1) = 3		Then 	$switch (16,21,1) = 0	Endif
						When $switch (15,22,1) = Reversed	Do
						If	$switch (16,21,1) = 2		Then	$switch (16,21,1) = 1
						Elseif $switch (16,21,1) = 0		Then 	$switch (16,21,1) = 3	Endif
						When $switch (16,21,1) = 0 or $switch (16,21,1) = 2	Do $switch (15,22,1) = Normal
						When $switch (16,21,1) = 1 or $switch (16,21,1) = 3	Do $switch (15,22,1) = Reversed
When $command = T13	Do If $switch (16,21,1) = 0	or $switch (16,21,1) = 3	'if T13N change to reverse
				Then 		If	{T12R}$switch (15,22,1) = Reversed 	Then	$switch (16,21,1) = 1
													Else 	$switch (16,21,1) = 2	Endif	
				Else		If	{T12R}$switch (15,22,1) = Reversed 	Then	$switch (16,21,1) = 3
													Else 	$switch (16,21,1) = 0	Endif	Endif
						When $switch (15,22,1) = Normal		Do
						If	$switch (16,21,1) = 1		Then	$switch (16,21,1) = 2	
						Elseif $switch (16,21,1) = 3		Then 	$switch (16,21,1) = 0	Endif
						When $switch (15,22,1) = Reversed	Do
						If	$switch (16,21,1) = 2		Then	$switch (16,21,1) = 1
						Elseif $switch (16,21,1) = 0		Then 	$switch (16,21,1) = 3	Endif
						When $switch (16,21,1) = 0 or $switch (16,21,1) = 2	Do $switch (15,22,1) = Normal
						When $switch (16,21,1) = 1 or $switch (16,21,1) = 3	Do $switch (15,22,1) = Reversed

When $command = T90	Do If $switch (17,20,1) = 0	or $switch (17,20,1) = 3	'if T90N change to reverse
				Then		If	{T13R}$switch (16,21,1) = 1 or $switch (16,21,1) = 2 	
							Then	$switch (17,20,1) = 1		Else 	$switch (17,20,1) = 2	Endif	
				Else		If	{T13R}$switch (16,21,1) = 1 or $switch (16,21,1) = 2 	
						Then	$switch (17,20,1) = 3			Else 	$switch (17,20,1) = 0	Endif	Endif
						When $switch (16,21,1) = 0 or $switch (16,21,1) = 3	Do	'if T13 goes to normal
						If	$switch (17,20,1) = 1		Then	$switch (17,20,1) = 2	'if T90R ...
						ElseIf $switch (17,20,1) = 3		Then 	$switch (17,20,1) = 0 Endif	'if T90N ...
						When $switch (16,21,1) = 1 or $switch (16,21,1) = 2	Do		'if T13 goes to rev
						If	$switch (17,20,1) = 2		Then	$switch (17,20,1) = 1	'if T90R ...
						ElseIf $switch (17,20,1) = 0		Then 	$switch (17,20,1) = 3 Endif	'if T90N ...
When $switch (17,20,1) = 0 or $switch (17,20,1) = 2	Do If	$switch (15,22,1) = Normal	
									Then	$switch (16,21,1)=0	Else	$switch (16,21,1) = 3 Endif


{Section 21	@@@@@@@@@@@@@@@@@@@@@@@  Point Motor Controls  @@@@@@@@@@@@@@@@@@@@@}

When $switch (14,7,1) = Normal	Do T96N = Pulse 0.1		When $switch (14,7,1) = Reversed	Do T96R = Pulse 0.1
When $switch (23,8,1) = Normal	Do T95N = Pulse 0.1		When $switch (23,8,1) = Reversed	Do T95R = Pulse 0.1
When $switch (18,10,1) = Normal	Do T21N = Pulse 0.1		When $switch (18,10,1) = Reversed	Do T21R = Pulse 0.1
When $switch (15,10,1) = Normal	Do T22N = Pulse 0.1		When $switch (15,10,1) = Reversed	Do T22R = Pulse 0.1
When $switch (15,11,1) = Normal	Do T23N = Pulse 0.1		When $switch (15,11,1) = Reversed	Do T23R = Pulse 0.1
When $switch (6,10,1) = Normal	Do T25N = Pulse 0.1		When $switch (6,10,1) = Reversed	Do T25R = Pulse 0.1
When $switch (4,11,1) = Normal	Do T26N = Pulse 0.1		When $switch (4,11,1) = Reversed	Do T26R = Pulse 0.1
When $switch (2,11,1) = Normal	Do T27R = Pulse 0.1		When $switch (2,11,1) = Reversed	Do T27N = Pulse 0.1
When $switch (22,1,1) = Normal	Do T51N = Pulse 0.1		When $switch (22,1,1) = Reversed	Do T51R = Pulse 0.1
When $switch (23,2,1) = Normal	Do T52R = Pulse 0.1		When $switch (23,2,1) = Reversed	Do T52N = Pulse 0.1
When $switch (24,3,1) = Normal	Do T53R = Pulse 0.1		When $switch (24,3,1) = Reversed	Do T53N = Pulse 0.1
When $switch (32,2,1) = Normal	Do T55R = Pulse 0.1		When $switch (32,2,1) = Reversed	Do T55N = Pulse 0.1
When $switch (33,1,1) = Normal	Do T56N = Pulse 0.1		When $switch (33,1,1) = Reversed	Do T56R = Pulse 0.1
When $switch (15,3,1) = Normal	Do T8N = Pulse 0.1		When $switch (15,3,1) = Reversed	Do T8R = Pulse 0.1
When $switch (1,19,1) = Normal	Do T30N = Pulse 0.1		When $switch (1,19,1) = Reversed	Do T30R = Pulse 0.1
When $switch (2,22,1) = Normal	Do T1R = Pulse 0.1		When $switch (2,22,1) = Reversed	Do T1N = Pulse 0.1
When $switch (4,22,1) = Normal	Do T2N = Pulse 0.1		When $switch (4,22,1) = Reversed	Do T2R = Pulse 0.1
When $switch (5,21,1) = Normal	Do T3N = Pulse 0.1		When $switch (5,21,1) = Reversed	Do T3R = Pulse 0.1
When $switch (6,20,1) = Normal	Do T4R = Pulse 0.1		When $switch (6,20,1) = Reversed	Do T4N = Pulse 0.1
When $switch (20,22,1) = Normal	Do T10N = Pulse 0.1		When $switch (20,22,1) = Reversed	Do T10R = Pulse 0.1
When $switch (18,20,1) = Normal	Do T20N = Pulse 0.1		When $switch (18,20,1) = Reversed	Do T20R = Pulse 0.1
When $switch (15,22,1) = Normal	Do T12N = Pulse 0.1		When $switch (15,22,1) = Reversed	Do T12R = Pulse 0.1
When $switch (17,22,1) = Normal	Do T11N = Pulse 0.1		When $switch (17,22,1) = Reversed	Do T11R = Pulse 0.1
When $switch (16,20,1) = Normal	Do T14N = Pulse 0.1		When $switch (16,20,1) = Reversed	Do T14R = Pulse 0.3
When $switch (17,20,1) = 0 or $switch (17,20,1) = 3	Do T90N = Pulse 0.1	
When $switch (17,20,1) = 1 or $switch (17,20,1) = 2	Do T90R = Pulse 0.1
When $switch (16,21,1) = 0 or $switch (16,21,1) = 3	Do T13N = Pulse 0.1	
When $switch (16,21,1) = 1 or $switch (16,21,1) = 2	Do T13R = Pulse 0.1
When $switch (8,10,1) = Normal	Do T24N = Pulse 0.1		
When $switch (8,10,1) = Reversed	Do T24R = Pulse 0.1, Control[24] = 21	'always set control variable for Block24 to = plat1 


{Section 22	@@@@@@@@@@@@@@@@@@@@  System Reset Commands  @@@@@@@@@@@@@@@@@@@@@}

{apply brake to all locos and redraw signal}
When $reset = true 		Do
Index = &V100.brake	Until Index > 2820	Loop
*index = on	index = ++	Endloop
Index = (34,13,1)		Until Index > 8521	Loop
$signal (index) = "RR"	index = 50+			Endloop

{Operate all points}
When $Reset = True		Do
$switch (2,11,1) = Normal	$switch (5,11,1) = Normal	$switch (4,11,1) = Normal	$switch (16,11,1) = Normal
$switch (1,19,1) = Normal	$switch (2,22,1) = Normal	$switch (4,22,1) = Normal	$switch (5,21,1) = Normal
$switch (6,20,1) = Normal	$switch (20,22,1) = Normal	$switch (18,20,1) = Normal	$switch (15,22,1) = Normal
$switch (17,22,1) = Normal	$switch (16,20,1) = Normal	$switch (17,20,1) = 0 		$switch (16,21,1) = 0 
$switch (19,21,1) = 0 		$switch (14,7,1) = Normal	$switch (23,8,1) = Normal	$switch (15,3,1) = Normal
$switch (17,11,1) = Normal	$switch (15,11,1) = Normal	$switch (8,10,1) = Normal	$switch (22,1,1) = Normal
$switch (23,2,1) = Normal	$switch (24,3,1) = Normal	$switch (32,2,1) = Normal	$switch (33,1,1) = Normal
$switch (13,19,1) = Normal	$switch (18,19,1) = Reversed	$switch (28,4,1) = Normal	$switch (33,4,1) = Normal


When $left_mouse = (37,1,1)	or	$command = x		Do		'ensures all turnouts are in the position shown on the CTC screen.
If	$switch (2,11,1) = Normal		Then	T27R = Pulse 0.1	Else 	T27N = Pulse 0.1	Endif
If	$switch (5,11,1) = Normal		Then	T25N = Pulse 0.1	Else 	T25R = Pulse 0.1	Endif
If	$switch (4,11,1) = Normal		Then	T26N = Pulse 0.1	Else 	T26R = Pulse 0.1	Endif
If	$switch (16,11,1) = Normal		Then	T22N = Pulse 0.1	Else 	T22R = Pulse 0.1	Endif	
If	$switch (1,19,1) = Normal		Then	T30N = Pulse 0.1	Else 	T30R = Pulse 0.1	Endif
If	$switch (2,22,1) = Normal		Then	T1R = Pulse 0.1	Else 	T1N = Pulse 0.1	Endif
If	$switch (4,22,1) = Normal		Then	T2N = Pulse 0.1	Else 	T2R = Pulse 0.1	Endif
If	$switch (5,21,1) = Normal		Then	T3N = Pulse 0.1	Else 	T3R = Pulse 0.1	Endif
If	$switch (6,20,1) = Normal		Then	T4R = Pulse 0.1	Else 	T4N = Pulse 0.1	Endif		
If	$switch (20,22,1) = Normal		Then	T10N = Pulse 0.1	Else	T10R = Pulse 0.1	Endif
If	$switch (18,20,1) = Normal		Then	T20N = Pulse 0.1	Else	T20R = Pulse 0.1	Endif
If	$switch (15,22,1) = Normal		Then	T12N = Pulse 0.1	Else	T12R = Pulse 0.1	Endif		Wait 1
If	$switch (17,22,1) = Normal		Then	T11N = Pulse 0.1	Else	T11R = Pulse 0.1	Endif		
If	$switch (16,20,1) = Normal		Then	T14N = Pulse 0.1	Else	T14R = Pulse 0.1	Endif
If	$switch (17,20,1) = 0 or $switch (17,20,1) = 3	Then	T90N = Pulse 0.1	Else	T90R = Pulse 0.1	Endif
If	$switch (16,21,1) = 0 or $switch (16,21,1) = 3	Then	T13N = Pulse 0.1	Else	T13R = Pulse 0.1	Endif
If	$switch (14,7,1) = Normal		Then	T96N = Pulse 0.1	Else 	T96R = Pulse 0.1	Endif
If	$switch (23,8,1) = Normal		Then	T95N = Pulse 0.1	Else 	T95R = Pulse 0.1	Endif
If	$switch (15,3,1) = Normal		Then	T8N = Pulse 0.1	Else 	T8R = Pulse 0.1	Endif
If	$switch (17,11,1) = Normal		Then	T21N = Pulse 0.1	Else 	T21R = Pulse 0.1	Endif		Wait 1
If	$switch (15,11,1) = Normal		Then	T23N = Pulse 0.1	Else 	T23R = Pulse 0.1	Endif	
If	$switch (8,10,1) = Normal		Then	T24N = Pulse 0.1	Else 	T24R = Pulse 0.1	Endif
If	$switch (22,1,1) = Normal		Then	T51N = Pulse 0.1	Else 	T51R = Pulse 0.1	Endif		
If	$switch (23,2,1) = Normal		Then	T52R = Pulse 0.1	Else 	T52N = Pulse 0.1	Endif
If	$switch (24,3,1) = Normal		Then	T53R = Pulse 0.1	Else 	T53N = Pulse 0.1	Endif
If	$switch (32,2,1) = Normal		Then	T55R = Pulse 0.1	Else 	T55N = Pulse 0.1	Endif
If	$switch (33,1,1) = Normal		Then	T56N = Pulse 0.1	Else 	T56R = Pulse 0.1	Endif
$switch (13,19,1) = Normal
$switch (18,19,1) = Reversed
$switch (28,4,1) = Normal
$switch (33,4,1) = Normal

{Reset all routes to 0 if waiting to set}
When $left_mouse = (37,3,1)	or $command = z	Do
RoutePointer = 	&R848						'Point RoutePointer to 1st route declared 
Until RoutePointer = 	&RoutePointer	Loop		'until RoutePointer is pointing to the last route declared 
If *RoutePointer > 1				Then		'if the route pointed to by RoutePointer is waiting to set
*RoutePointer = 0					Endif		'set the route pointed to by RoutePointer to 0
RoutePointer = +					Endloop	'point RoutePointer to the next route in the list



{Section 23	@@@@@@@@@@@@@@@@@@@@  Handheld Controllers  @@@@@@@@@@@@@@@@@@@@@}
{The code for the handheld controllers comes with the installation pack for the handsets. See the handsets page of my website www.users.tpg.com.au/bsken for more info.

I have written the code that comes with the installation pack so that it can be easily copied into anyone's code, but If you have used some of the sub routines from this file you can take advantage of those subs by making a few minor changes, make sure you read the chapter on Handheld Controllers in the guide for this code.
}



{Handheld1}

{Onboard Signalling}
While B[81] > 9	Do	OnboardSignal(L[81],(13,3,1),(2,8,1))
While B[82] > 9	Do	OnboardSignal(L[82],(13,3,1),(2,8,1))
While B[84] > 9	Do	OnboardSignal(L[84],(35,3,1),(22,4,1))
While B[86] > 9	Do	OnboardSignal(L[86],(35,3,1),(22,4,1))
While B[51] > 9	Do	OnboardSignal(L[51],(25,1,1),(30,1,1))
While B[52] > 9	Do	OnboardSignal(L[52],(25,2,1),(30,2,1))
While B[53] > 9	Do	OnboardSignal(L[53],(25,3,1),(30,3,1))
While B[72] > 9	Do	OnboardSignal(L[72],(21,1,1),(1,8,1))
While B[71] > 9	Do	OnboardSignal(L[71],(21,1,1),(1,8,1))
While B[21] > 9	Do	OnboardSignal(L[21],(7,10,1),(13,10,1))
While B[22] > 9	Do	OnboardSignal(L[22],(7,11,1),(13,11,1))
While B[23] > 9	Do	OnboardSignal(L[23],(7,12,1),(13,12,1))
While B[33] > 9	Do	OnboardSignal(L[33],(19,11,1),(14,14,1))
While B[32] > 9	Do	OnboardSignal(L[32],(14,14,1),(8,14,1))
While B[31] > 9	Do	OnboardSignal(L[31],(8,14,1),(1,18,1))
While B[43] > 9	Do	OnboardSignal(L[43],(19,10,1),(14,15,1))
While B[42] > 9	Do	OnboardSignal(L[42],(14,15,1),(8,15,1))
While B[41] > 9	Do	OnboardSignal(L[41],(8,15,1),(2,18,1))
While B[1] > 9	Do	OnboardSignal(L[1],(8,23,1),(14,23,1))
While B[2] > 9	Do	OnboardSignal(L[2],(8,22,1),(14,22,1))
While B[3] > 9	Do	OnboardSignal(L[3],(8,21,1),(14,21,1))
While B[4] > 9	Do	OnboardSignal(L[4],(8,20,1),(14,20,1))
While B[5] > 9	Do	OnboardSignal(L[5],(8,19,1),(14,19,1))
While B[11] > 9	Do	OnboardSignal(L[11],(21,22,1),(26,22,1))
While B[12] > 9	Do	OnboardSignal(L[12],(21,21,1),(26,21,1))
While B[93] > 9	Do	OnboardSignal(L[93],(20,20,1),(24,9,1))
While B[94] > 9	Do	OnboardSignal(L[94],(20,20,1),(24,9,1))
While B[91] > 9	Do	OnboardSignal(L[91],(16,7,1),(21,7,1))
While B[92] > 9	Do	OnboardSignal(L[92],(16,8,1),(21,8,1))
While B[98] > 9	Do	OnboardSignal(L[98],(13,4,1),(13,7,1))
While B[99] > 9	Do	OnboardSignal(L[99],(13,4,1),(13,7,1))




















































































































































































































































































































































