SMARTCABS: A, B, C

VARIABLES: DCC_SPEED

ACTIONS:
WHEN A.Direction=Reverse DO B.Direction=Forward
WHEN A.Direction=Forward DO B.Direction=Reverse

WHEN Train1.Direction=Forward DO C.Direction=Forward
WHEN Train1.Direction=Reverse DO C.Direction=Reverse

'WHEN A.Speed DO B.Speed=A.Speed

'ALWAYS DO
'	B.Speed=A.Speed
'	C.Speed=Train1.Speed

WHEN Train1.Speed <> DCC_SPEED DO
	C.Speed = Train1.Speed
	DCC_SPEED = Train1.Speed

WHEN Train2.F8 DO
	IF C.Direction=Forward THEN C.Direction=Reverse ELSE C.Direction=Forward ENDIF