VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmAcelaApp 
   Caption         =   " A Very Simple Application Illustrating Use of the Acela Network Bridge (Version 1.3)"
   ClientHeight    =   6390
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10455
   Icon            =   "frmAcelaApp.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6390
   ScaleWidth      =   10455
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkOnline 
      Caption         =   "Go Online"
      Height          =   450
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   3120
      Width           =   1335
   End
   Begin VB.Timer Timer1 
      Interval        =   50
      Left            =   9360
      Top             =   5760
   End
   Begin VB.TextBox txtNumModules 
      Height          =   285
      Left            =   8640
      TabIndex        =   22
      Text            =   " 0"
      Top             =   5880
      Width           =   495
   End
   Begin VB.TextBox txtStatus 
      Height          =   285
      Left            =   840
      TabIndex        =   20
      Text            =   " Ready"
      Top             =   5880
      Width           =   5775
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset Network"
      Height          =   450
      Left            =   240
      TabIndex        =   18
      Top             =   4560
      Width           =   1335
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit Program"
      Height          =   450
      Left            =   240
      TabIndex        =   6
      Top             =   5040
      Width           =   1335
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   9840
      Top             =   5640
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Frame Frame1 
      Caption         =   "COM Port"
      Height          =   2655
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   1335
      Begin VB.OptionButton optCom 
         Caption         =   "Offline"
         Height          =   240
         Index           =   0
         Left            =   240
         TabIndex        =   95
         Top             =   360
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 8"
         Height          =   255
         Index           =   8
         Left            =   240
         TabIndex        =   59
         Top             =   2280
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 7"
         Height          =   210
         Index           =   7
         Left            =   240
         TabIndex        =   58
         Top             =   2040
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 6"
         Height          =   255
         Index           =   6
         Left            =   240
         TabIndex        =   57
         Top             =   1800
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 5"
         Height          =   255
         Index           =   5
         Left            =   240
         TabIndex        =   56
         Top             =   1560
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 4"
         Height          =   255
         Index           =   4
         Left            =   240
         TabIndex        =   55
         Top             =   1320
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 3"
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   54
         Top             =   1080
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 2"
         Height          =   240
         Index           =   2
         Left            =   240
         TabIndex        =   53
         Top             =   840
         Width           =   855
      End
      Begin VB.OptionButton optCom 
         Caption         =   "COM 1"
         Height          =   240
         Index           =   1
         Left            =   240
         TabIndex        =   3
         Top             =   600
         Width           =   855
      End
   End
   Begin VB.CommandButton cmdRevisionCode 
      Caption         =   "Revision Code"
      Height          =   450
      Left            =   240
      TabIndex        =   1
      Top             =   4080
      Width           =   1335
   End
   Begin VB.CommandButton cmdPoll 
      Caption         =   "Poll Network"
      Height          =   450
      Left            =   240
      TabIndex        =   0
      Top             =   3600
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Caption         =   "Controls"
      Height          =   2655
      Left            =   1800
      TabIndex        =   4
      Top             =   240
      Width           =   2655
      Begin VB.CheckBox chkControls 
         Caption         =   "12"
         Height          =   375
         Index           =   11
         Left            =   1800
         Style           =   1  'Graphical
         TabIndex        =   93
         Top             =   1920
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "11"
         Height          =   375
         Index           =   10
         Left            =   1800
         Style           =   1  'Graphical
         TabIndex        =   92
         Top             =   1440
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "10"
         Height          =   375
         Index           =   9
         Left            =   1800
         Style           =   1  'Graphical
         TabIndex        =   91
         Top             =   960
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "9"
         Height          =   375
         Index           =   8
         Left            =   1800
         Style           =   1  'Graphical
         TabIndex        =   90
         Top             =   480
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "8"
         Height          =   375
         Index           =   7
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   89
         Top             =   1920
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "7"
         Height          =   375
         Index           =   6
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   88
         Top             =   1440
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "6"
         Height          =   375
         Index           =   5
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   87
         Top             =   960
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "5"
         Height          =   375
         Index           =   4
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   86
         Top             =   480
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "4"
         Height          =   375
         Index           =   3
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   85
         Top             =   1920
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "3"
         Height          =   375
         Index           =   2
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   84
         Top             =   1440
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "2"
         Height          =   375
         Index           =   1
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   83
         Top             =   960
         Width           =   495
      End
      Begin VB.CheckBox chkControls 
         Caption         =   "1"
         Height          =   375
         Index           =   0
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   82
         Top             =   480
         Width           =   495
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Throttle"
      Height          =   2415
      Left            =   4680
      TabIndex        =   7
      Top             =   3120
      Width           =   5535
      Begin VB.CheckBox chkIdle 
         Caption         =   " Apply Idling Voltage"
         Height          =   735
         Left            =   3600
         TabIndex        =   52
         Top             =   1320
         Width           =   1815
      End
      Begin VB.CheckBox chkBrake 
         Caption         =   "Brake"
         Height          =   495
         Left            =   4320
         Style           =   1  'Graphical
         TabIndex        =   47
         Top             =   480
         Width           =   975
      End
      Begin ComctlLib.Slider sldInertia 
         Height          =   495
         Left            =   1680
         TabIndex        =   10
         Top             =   1440
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   873
         _Version        =   327682
         LargeChange     =   1
         Max             =   7
      End
      Begin VB.OptionButton optRev 
         Caption         =   "Rev"
         Height          =   255
         Left            =   600
         TabIndex        =   9
         Top             =   1850
         Width           =   735
      End
      Begin VB.OptionButton optFwd 
         Caption         =   "Fwd"
         Height          =   375
         Left            =   600
         TabIndex        =   8
         Top             =   1500
         Width           =   735
      End
      Begin VB.Frame Frame6 
         Caption         =   "Direction"
         Height          =   975
         Left            =   360
         TabIndex        =   51
         Top             =   1250
         Width           =   1095
      End
      Begin ComctlLib.Slider sldSpeed 
         Height          =   495
         Left            =   240
         TabIndex        =   94
         Top             =   450
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   873
         _Version        =   327682
         Max             =   100
         TickFrequency   =   5
      End
      Begin VB.Label Label2 
         Caption         =   "0"
         Height          =   255
         Left            =   360
         TabIndex        =   12
         Top             =   960
         Width           =   255
      End
      Begin VB.Label Label1 
         Caption         =   "Speed"
         Height          =   375
         Left            =   1920
         TabIndex        =   11
         Top             =   210
         Width           =   735
      End
      Begin VB.Label Label6 
         Caption         =   "Max"
         Height          =   255
         Left            =   2880
         TabIndex        =   16
         Top             =   1920
         Width           =   375
      End
      Begin VB.Label Label5 
         Caption         =   "Min"
         Height          =   255
         Left            =   1800
         TabIndex        =   15
         Top             =   1920
         Width           =   375
      End
      Begin VB.Label Label4 
         Caption         =   "Inertia"
         Height          =   255
         Left            =   2160
         TabIndex        =   14
         Top             =   1200
         Width           =   495
      End
      Begin VB.Label Label3 
         Caption         =   "100"
         Height          =   375
         Left            =   3720
         TabIndex        =   13
         Top             =   960
         Width           =   375
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Signals"
      Height          =   2655
      Left            =   4680
      TabIndex        =   17
      Top             =   240
      Width           =   5535
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   7
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   80
         Top             =   2040
         Width           =   255
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   6
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   79
         Top             =   960
         Width           =   255
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   5
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   78
         Top             =   2040
         Width           =   255
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   4
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   77
         Top             =   960
         Width           =   255
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   3
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   76
         Top             =   2040
         Width           =   255
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   2
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   75
         Top             =   960
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   7
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   74
         Top             =   1800
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   6
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   73
         Top             =   720
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   5
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   72
         Top             =   1800
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   4
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   720
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   3
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   70
         Top             =   1800
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   2
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   69
         Top             =   720
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   7
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   68
         Top             =   1560
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   6
         Left            =   3240
         Style           =   1  'Graphical
         TabIndex        =   67
         Top             =   480
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   5
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   66
         Top             =   1560
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   4
         Left            =   2280
         Style           =   1  'Graphical
         TabIndex        =   65
         Top             =   480
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   3
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   64
         Top             =   1560
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   2
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   63
         Top             =   480
         Width           =   255
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   1
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   62
         Top             =   2040
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   1
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   61
         Top             =   1800
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   1
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   60
         Top             =   1560
         Width           =   255
      End
      Begin ComctlLib.Slider sldBrightness 
         Height          =   1815
         Left            =   4080
         TabIndex        =   48
         Top             =   240
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   3201
         _Version        =   327682
         Orientation     =   1
         LargeChange     =   16
         SmallChange     =   4
         Max             =   255
         TickFrequency   =   16
      End
      Begin VB.CommandButton cmdSigGreen 
         BackColor       =   &H00C0FFC0&
         Height          =   255
         Index           =   0
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   24
         Top             =   960
         Width           =   255
      End
      Begin VB.CommandButton cmdSigYellow 
         BackColor       =   &H00C0FFFF&
         Height          =   255
         Index           =   0
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   25
         Top             =   720
         Width           =   255
      End
      Begin VB.CommandButton cmdSigRed 
         BackColor       =   &H00C0C0FF&
         Height          =   255
         Index           =   0
         Left            =   360
         Style           =   1  'Graphical
         TabIndex        =   23
         Top             =   480
         Width           =   255
      End
      Begin ComctlLib.Slider sldHue 
         Height          =   1815
         Left            =   4800
         TabIndex        =   81
         Top             =   240
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   3201
         _Version        =   327682
         Orientation     =   1
         LargeChange     =   16
         SmallChange     =   4
         Max             =   255
         TickFrequency   =   16
      End
      Begin VB.Label Label19 
         Caption         =   "Hue"
         Height          =   255
         Left            =   4920
         TabIndex        =   50
         Top             =   2160
         Width           =   495
      End
      Begin VB.Label Label18 
         Caption         =   "Brightness"
         Height          =   255
         Left            =   3960
         TabIndex        =   49
         Top             =   2160
         Width           =   855
      End
      Begin VB.Label Label16 
         Caption         =   "8"
         Height          =   375
         Left            =   3720
         TabIndex        =   33
         Top             =   1560
         Width           =   255
      End
      Begin VB.Label Label15 
         Caption         =   "7"
         Height          =   255
         Left            =   3720
         TabIndex        =   32
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label14 
         Caption         =   "6"
         Height          =   375
         Left            =   2760
         TabIndex        =   31
         Top             =   1560
         Width           =   375
      End
      Begin VB.Label Label13 
         Caption         =   "5"
         Height          =   255
         Left            =   2760
         TabIndex        =   30
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label12 
         Caption         =   "4"
         Height          =   375
         Left            =   1800
         TabIndex        =   29
         Top             =   1560
         Width           =   255
      End
      Begin VB.Label Label11 
         Caption         =   "3"
         Height          =   375
         Left            =   1800
         TabIndex        =   28
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label10 
         Caption         =   "2"
         Height          =   255
         Left            =   840
         TabIndex        =   27
         Top             =   1560
         Width           =   255
      End
      Begin VB.Label Label9 
         Caption         =   "1"
         Height          =   255
         Left            =   840
         TabIndex        =   26
         Top             =   480
         Width           =   135
      End
      Begin VB.Shape Shape8 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Left            =   3120
         Shape           =   4  'Rounded Rectangle
         Top             =   1440
         Width           =   495
      End
      Begin VB.Shape Shape7 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Left            =   2160
         Shape           =   4  'Rounded Rectangle
         Top             =   1440
         Width           =   495
      End
      Begin VB.Shape Shape6 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Left            =   1200
         Shape           =   4  'Rounded Rectangle
         Top             =   1440
         Width           =   495
      End
      Begin VB.Shape Shape5 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Left            =   240
         Shape           =   4  'Rounded Rectangle
         Top             =   1440
         Width           =   495
      End
      Begin VB.Shape Shape4 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Left            =   3120
         Shape           =   4  'Rounded Rectangle
         Top             =   360
         Width           =   495
      End
      Begin VB.Shape Shape3 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Left            =   2160
         Shape           =   4  'Rounded Rectangle
         Top             =   360
         Width           =   495
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Index           =   0
         Left            =   1200
         Shape           =   4  'Rounded Rectangle
         Top             =   360
         Width           =   495
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H80000010&
         FillColor       =   &H80000013&
         FillStyle       =   0  'Solid
         Height          =   975
         Index           =   0
         Left            =   240
         Shape           =   4  'Rounded Rectangle
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Sensors"
      Height          =   2415
      Left            =   1800
      TabIndex        =   5
      Top             =   3120
      Width           =   2655
      Begin VB.Label Label17 
         Caption         =   "12"
         Height          =   255
         Index           =   11
         Left            =   2119
         TabIndex        =   45
         Top             =   1920
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "11"
         Height          =   255
         Index           =   10
         Left            =   2119
         TabIndex        =   44
         Top             =   1440
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "10"
         Height          =   255
         Index           =   9
         Left            =   2119
         TabIndex        =   43
         Top             =   960
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "9"
         Height          =   255
         Index           =   8
         Left            =   2119
         TabIndex        =   42
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "8"
         Height          =   255
         Index           =   7
         Left            =   1390
         TabIndex        =   41
         Top             =   1920
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "7"
         Height          =   255
         Index           =   6
         Left            =   1390
         TabIndex        =   40
         Top             =   1440
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "6"
         Height          =   255
         Index           =   5
         Left            =   1390
         TabIndex        =   39
         Top             =   960
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "5"
         Height          =   255
         Index           =   4
         Left            =   1390
         TabIndex        =   38
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "4"
         Height          =   255
         Index           =   3
         Left            =   670
         TabIndex        =   37
         Top             =   1920
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "3"
         Height          =   255
         Index           =   2
         Left            =   670
         TabIndex        =   36
         Top             =   1440
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "2"
         Height          =   255
         Index           =   1
         Left            =   670
         TabIndex        =   35
         Top             =   960
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   "1"
         Height          =   255
         Index           =   0
         Left            =   670
         TabIndex        =   34
         Top             =   480
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   11
         Left            =   1800
         Shape           =   3  'Circle
         Top             =   1920
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   10
         Left            =   1800
         Shape           =   3  'Circle
         Top             =   1440
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   9
         Left            =   1800
         Shape           =   3  'Circle
         Top             =   960
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   8
         Left            =   1800
         Shape           =   3  'Circle
         Top             =   480
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   7
         Left            =   1080
         Shape           =   3  'Circle
         Top             =   1920
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   6
         Left            =   1080
         Shape           =   3  'Circle
         Top             =   1440
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   5
         Left            =   1080
         Shape           =   3  'Circle
         Top             =   960
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   4
         Left            =   1080
         Shape           =   3  'Circle
         Top             =   480
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   3
         Left            =   360
         Shape           =   3  'Circle
         Top             =   1920
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   2
         Left            =   360
         Shape           =   3  'Circle
         Top             =   1440
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   1
         Left            =   360
         Shape           =   3  'Circle
         Top             =   960
         Width           =   255
      End
      Begin VB.Shape SensorIndicator 
         FillColor       =   &H0000C000&
         FillStyle       =   0  'Solid
         Height          =   255
         Index           =   0
         Left            =   360
         Shape           =   3  'Circle
         Top             =   480
         Width           =   255
      End
   End
   Begin VB.Label Label8 
      Caption         =   "Modules Responding: "
      Height          =   255
      Left            =   6960
      TabIndex        =   21
      Top             =   5880
      Width           =   1695
   End
   Begin VB.Label Label7 
      Caption         =   "Status:"
      Height          =   255
      Left            =   240
      TabIndex        =   19
      Top             =   5880
      Width           =   1215
   End
End
Attribute VB_Name = "frmAcelaApp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'This simple application illustrates the use of the Acela Network Bridge.
'The CTI hardware is assumed to be the example network described in
'the Acela Network Bridge Programmer's Guide.  To use the application
'in other environments, change the following constants accordingly:

'Base addresses of hardware entities in the example CTI network
 Const kControls_Base = 0
 Const kSignals_Base = 12
 Const kThrottle_Base = 28

'Declare global variables
 Dim NumControls As Long
 Dim NumSensors As Long
 Dim ReceiveBuffer As String
 Dim SensorActivity As Boolean
 Dim CommsFailure As Boolean
 
Private Sub Form_Load()

 'Start up offline
  optCom(0).Value = True
  
 'Init on-screen controls to match CTI hardware defaults
  sldBrightness = 255  ' full signal brightness
  sldHue = 170         ' 67% green, 33% red yellow hue
  
End Sub

Private Sub Form_Unload(Cancel As Integer)
 'Close the COM Port
  If MSComm1.PortOpen Then MSComm1.PortOpen = False
End Sub
  
Private Sub cmdExit_Click()
  Unload Me
End Sub

Private Sub chkOnline_Click() 'Put the network bridge online
  
  Dim CommandMsg As String
  Dim ResponseMsg As String
 
 'Build the command message
  If chkOnline.Value Then
    CommandMsg = Chr$(22)
    chkOnline.Caption = "Go Offline"
  Else
    CommandMsg = Chr$(23)
    chkOnline.Caption = "Go Online"
  End If
    
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg
  
  If chkOnline.Value Then
    cmdPoll_Click ' Determine network configuration
    ReadSensors   ' Read initial states of sensors
    ShowResult ResponseMsg
  End If

End Sub

Private Sub cmdPoll_Click() 'Determine the CTI network configuration

  Dim CommandMsg As String
  Dim ResponseMsg As String
  Dim ModStr As String
  Dim I As Integer, NumModules As Integer

  NumModules = 0
  NumControls = 0
  NumSensors = 0

 ' Trick: Assuming we don't know how many modules are in the network, we request
 ' RecvMessage to accept a huge (9999 byte) message.  After 1 second, RecvMessage
 ' will timeout, returning a string with the first byte = 4 (indicating a timeout)
 ' followed by the actual Poll response received from the network, which will tell us
 ' how many bytes were actually returned

 'Build and send the command message, receive the response
  CommandMsg = Chr$(24)
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 9999
  
 'Strip the timeout byte, since in this case, we fully expected a timeout, then show response
  ResponseMsg = Right$(ResponseMsg, Len(ResponseMsg) - 1)
  ShowResult ResponseMsg
     
 'Display the network configuration, calculate number of controls and sensors
  If Len(ResponseMsg) = 0 Then
    txtStatus.Text = "No Response Received ... Timed Out"
  Else
    NumModules = Asc(Mid$(ResponseMsg, 2, 1))
    txtNumModules.Text = Str$(NumModules)
                
    ModStr = "CTI Network ="
    
    For I = 1 To NumModules
      Select Case Asc(Mid$(ResponseMsg, 2 + I, 1))
        Case 1: ModStr = ModStr & " TB"
                NumControls = NumControls + 4
                NumSensors = NumSensors + 4
        Case 2: ModStr = ModStr & " D8"
                NumControls = NumControls + 8
        Case 3: ModStr = ModStr & " WM"
                NumSensors = NumSensors + 8
        Case 4: ModStr = ModStr & " SM"
                NumControls = NumControls + 16
        Case 5: ModStr = ModStr & " SC"
                NumControls = NumControls + 1
        Case 6: ModStr = ModStr & " SW"
                NumControls = NumControls + 16
        Case 7: ModStr = ModStr & " YM"
                NumControls = NumControls + 16
        Case 8: ModStr = ModStr & " SE"
                NumSensors = NumSensors + 16
        Case Else: ModStr = ModStr & " ??"
      End Select
    Next I
    
    txtStatus.Text = ModStr
    
  End If

End Sub

Private Sub cmdRevisionCode_Click()  'Read the Acela firmware revision code

  Dim CommandMsg As String
  Dim ResponseMsg As String

 'Send the command message, receive the response
  CommandMsg = Chr$(25)
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 3
    
 'Display the firmware revision
  txtStatus.Text = "Acela Firmware Version = " & Hex$(Asc(Mid$(ResponseMsg, 2, 1))) & "." & Hex$(Asc(Mid$(ResponseMsg, 3, 1)))
End Sub

Private Sub cmdReset_Click()  'Reset the CTI network

  Dim CommandMsg As String
  Dim ResponseMsg As String

 'Build the command message
  CommandMsg = Chr$(21)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg
  
  chkOnline.Value = False
      
End Sub

Private Sub chkControls_Click(Index As Integer) 'Set control selected by Index

  Dim AdrMsh As Long
  Dim AdrLsh As Long
  Dim CommandMsg As String
  Dim ResponseMsg As String

  'Compute controller address
  AdrLsh = kControls_Base + Index
  AdrMsh = 0
  
 'Build the command message
  If chkControls(Index).Value Then
    CommandMsg = Chr$(1) & Chr$(AdrMsh) & Chr$(AdrLsh)  'activate the control
  Else
    CommandMsg = Chr$(2) & Chr$(AdrMsh) & Chr$(AdrLsh)  'deactivate the control
  End If
    
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg
  
End Sub

Private Sub cmdSigRed_Click(Index As Integer) 'Set signal selected by Index to Red

  Dim AdrMsh As Long
  Dim AdrLsh As Long
  Dim CommandMsg As String
  Dim ResponseMsg As String

  cmdSigRed(Index).BackColor = RGB(255, 0, 0)
  cmdSigGreen(Index).BackColor = RGB(192, 255, 192)
  cmdSigYellow(Index).BackColor = RGB(255, 255, 192)

  AdrLsh = kSignals_Base + (2 * Index)
  AdrMsh = 0
   
  CommandMsg = Chr$(12) & Chr$(AdrMsh) & Chr$(AdrLsh) & Chr$(1)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg

End Sub

Private Sub cmdSigGreen_Click(Index As Integer) 'Set signal selected by Index to Green

  Dim AdrMsh As Long
  Dim AdrLsh As Long
  Dim CommandMsg As String
  Dim ResponseMsg As String
  
  cmdSigRed(Index).BackColor = RGB(255, 192, 192)
  cmdSigGreen(Index).BackColor = RGB(0, 192, 0)
  cmdSigYellow(Index).BackColor = RGB(255, 255, 192)

  AdrLsh = kSignals_Base + (2 * Index)
  AdrMsh = 0
  
  CommandMsg = Chr$(12) & Chr$(AdrMsh) & Chr$(AdrLsh) & Chr$(4)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg

End Sub

Private Sub cmdSigYellow_Click(Index As Integer) 'Set signal selected by Index to Yellow

  Dim AdrMsh As Long
  Dim AdrLsh As Long
  Dim CommandMsg As String
  Dim ResponseMsg As String
  
  cmdSigRed(Index).BackColor = RGB(255, 192, 192)
  cmdSigGreen(Index).BackColor = RGB(192, 255, 192)
  cmdSigYellow(Index).BackColor = RGB(255, 255, 0)
  
  AdrLsh = kSignals_Base + (2 * Index)
  AdrMsh = 0
   
  CommandMsg = Chr$(12) & Chr$(AdrMsh) & Chr$(AdrLsh) & Chr$(16)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg

End Sub

Private Sub optCom_Click(Index As Integer)
  Dim I As Long

  'If a COM port is already open, close it
  If MSComm1.PortOpen Then MSComm1.PortOpen = False
  
  If Index = 0 Then
   'Disable control buttons while Acela is offline
    cmdPoll.Enabled = False
    cmdReset.Enabled = False
    cmdRevisionCode.Enabled = False
    For I = 0 To 7
      cmdSigGreen(I).Enabled = False
      cmdSigRed(I).Enabled = False
      cmdSigYellow(I).Enabled = False
    Next I
    For I = 0 To 11
      chkControls(I).Enabled = False
    Next I
    chkOnline.Enabled = False
    chkBrake.Enabled = False
    chkIdle.Enabled = False
    sldSpeed.Enabled = False
    sldInertia.Enabled = False
    sldHue.Enabled = False
    sldBrightness.Enabled = False
    optFwd.Enabled = False
    optRev.Enabled = False
  Else
   'Enable control buttons while Acela is online
    cmdPoll.Enabled = True
    cmdReset.Enabled = True
    cmdRevisionCode.Enabled = True
    For I = 0 To 7
      cmdSigGreen(I).Enabled = True
      cmdSigRed(I).Enabled = True
      cmdSigYellow(I).Enabled = True
    Next I
    For I = 0 To 11
      chkControls(I).Enabled = True
    Next I
    chkOnline.Enabled = True
    chkBrake.Enabled = True
    chkIdle.Enabled = True
    sldSpeed.Enabled = True
    sldInertia.Enabled = True
    sldHue.Enabled = True
    sldBrightness.Enabled = True
    optFwd.Enabled = True
    optRev.Enabled = True
    
    MSComm1.CommPort = Index
  End If
End Sub

Private Sub sldBrightness_Scroll() 'Set signal brightness

  Dim CommandMsg As String
  Dim ResponseMsg As String
  
  CommandMsg = Chr$(27) & Chr$(sldBrightness.Value)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg

End Sub

Private Sub sldHue_Scroll() 'Set signal synthetic yellow hue

  Dim CommandMsg As String
  Dim ResponseMsg As String
  
  CommandMsg = Chr$(15) & Chr$(10) & Chr$(sldHue.Value)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg

End Sub

Private Sub sldSpeed_Scroll() 'Set speed of SmartCab
  SmartCab_Control
End Sub

Private Sub chkBrake_Click() 'Set brake of SmartCab
  SmartCab_Control
End Sub

Private Sub optFwd_Click() 'Set direction of Smartcab to Forward
  SmartCab_Control
End Sub

Private Sub optRev_Click() 'Set direction of Smartcab to Reverse
  SmartCab_Control
End Sub

Private Sub sldInertia_Scroll() 'Set momentum of SmartCab
  SmartCab_Control
End Sub

Private Sub chkIdle_Click() 'Set Idling Voltage of SmartCab
  SmartCab_Control
End Sub

Private Sub SmartCab_Control() ' Control the Smart Cab throttle

  Dim AdrMsh As Long
  Dim AdrLsh As Long
  Dim Speed As Long
  Dim Attributes As Long
  Dim CommandMsg As String
  Dim ResponseMsg As String

  AdrLsh = kThrottle_Base
  AdrMsh = 0
    
  Speed = sldSpeed.Value
  Attributes = sldInertia.Value + (chkBrake.Value * 8) + (optRev.Value And 16) + (chkIdle.Value * 32)
  
  CommandMsg = Chr$(10) & Chr$(AdrMsh) & Chr$(AdrLsh) & Chr$(Speed) & Chr$(Attributes)
  
 'Send the command message, receive the response, display the result
  SendMessage CommandMsg
  RecvMessage ResponseMsg, 1
  ShowResult ResponseMsg
  
End Sub

Private Sub SendMessage(MessageToSend As String)
 'Send a message to the CTI network
 
  Dim TimeOut As Single
 
  TimeOut = Timer + 1  'Wait up to 1 sec for output buffer to become empty

  Do
    CTI_Communicate
  Loop Until MSComm1.OutBufferCount = 0 Or Timer > TimeOut

  If Timer < TimeOut Then
    txtStatus.Text = "Sending Command Message"
    MSComm1.Output = MessageToSend
  Else
    txtStatus.Text = "Timed Out Waiting to Send"
  End If

End Sub

Private Sub RecvMessage(MessageToReceive As String, MessageLen As Long)
 'Receive a message from the CTI network

  Dim TimeOut As Single

  TimeOut = Timer + 1  'Give the network up to 1 second to respond
  
  Do
    CTI_Communicate
  Loop Until Len(ReceiveBuffer) >= MessageLen Or Timer > TimeOut

  If Timer < TimeOut Then  'the message was received successfully
    MessageToReceive = Left$(ReceiveBuffer, MessageLen)  'remove the message from the head of the receive queue
    ReceiveBuffer = Right$(ReceiveBuffer, Len(ReceiveBuffer) - MessageLen)
    txtStatus.Text = "Response Received"
  Else  'the message was not received successfully
    MessageToReceive = Chr$(4) & ReceiveBuffer  'return "timeout" error code along with whatever was received
    ReceiveBuffer = ""
    txtStatus.Text = "Timed Out Waiting for Response"
  End If

End Sub

Private Sub ShowResult(ResponseMsg As String)
 'Display status of most recent command in text window

  Dim Result As Long
  
  If Len(ResponseMsg) = 0 Then
    txtStatus.Text = "No Response Received ... Timed Out"
  Else
    Result = Asc(ResponseMsg)
        
    Select Case Result
      Case 0: txtStatus.Text = "Command Processed Normally"
      Case 1: txtStatus.Text = "Command will take effect when network goes online"
      Case 2: txtStatus.Text = "Command Address Out Of Range"
      Case 3: txtStatus.Text = "Unknown Command Ignored"
      Case 4: txtStatus.Text = "Incomplete Response Received ... Timed Out"
    End Select
  End If
  
End Sub

Private Sub ReadSensors()
 'Read and display the states of all sensors

  Dim CommandMsg As String
  Dim ResponseMsg As String
  Dim I, ByteNum, BitNum, BitMask, SensorState As Long
 
  If NumSensors > 0 Then
    
   'Send a "Read All Sensors" command message, receive the
   'response, and update the onsceeen sensor status display
    CommandMsg = Chr$(20)
    SendMessage CommandMsg
    RecvMessage ResponseMsg, 3 + ((NumSensors - 1) \ 8)
    
    For I = 0 To NumSensors - 1
      ByteNum = 3 + (I \ 8)
      BitNum = I Mod 8
            
      Select Case BitNum
        Case 0: BitMask = 1
        Case 1: BitMask = 2
        Case 2: BitMask = 4
        Case 3: BitMask = 8
        Case 4: BitMask = 16
        Case 5: BitMask = 32
        Case 6: BitMask = 64
        Case 7: BitMask = 128
      End Select
      
      SensorState = Asc(Mid$(ResponseMsg, ByteNum, 1)) And BitMask
      
      If I < 12 Then  'there are 12 sensor indicators on the control panel, don't try to display any more
        If SensorState Then
          SensorIndicator(I).FillColor = RGB(255, 0, 0)
        Else
          SensorIndicator(I).FillColor = RGB(0, 192, 0)
        End If
      End If
    Next I
    
  End If
  
End Sub
  
Private Sub Timer1_Timer()
 ' This timer process wakes up every 50 msec
 
 Dim CommandMsg As String
 Dim ResponseMsg As String
 
 'Periodically check if Acela has sent us anything
  CTI_Communicate
  
 'If Acela has reported sensor activity, go read the sensors
  If SensorActivity Then
    ReadSensors
    SensorActivity = False
    txtStatus.Text = "Sensor activity detected"
  End If
  
 'If Acela has reported a communications failure, go offline
  If CommsFailure Then
    chkOnline.Value = False
    CommsFailure = False
    txtStatus.Text = "Communications with CTI network lost"
  End If
  
End Sub

Private Sub CTI_Communicate()

  Dim TempVariant As Variant
  Dim RxByte() As Byte
  Dim I As Long

  'If working offline,  exit with no action taken
  If optCom(0).Value Then Exit Sub

 'If the COM port is not yet open, then open it
  If Not MSComm1.PortOpen Then
    MSComm1.InputMode = comInputModeBinary
    MSComm1.InputLen = 0
    MSComm1.Handshaking = comNone
    MSComm1.PortOpen = True
    txtStatus.Text = "Acela Ready"
  End If

 'If data has arrived from the Acela, append it to the receive buffer
  If MSComm1.InBufferCount > 0 Then
    TempVariant = MSComm1.Input
    RxByte = TempVariant
    For I = 0 To UBound(RxByte)
      ReceiveBuffer = ReceiveBuffer & Chr(RxByte(I))
    Next I
  End If
   
 'Check for any Service Requests from the Acela
  Do Until Len(ReceiveBuffer) = 0                                   'there could be more than one... loop till we find them all
  
    If Asc(ReceiveBuffer) = &H81 Then                               'Acela has detected sensor activity
      ReceiveBuffer = Right$(ReceiveBuffer, Len(ReceiveBuffer) - 1) 'remove the service request from the queue
      SensorActivity = True                                         'flag the fact that sensor activity has occurred
      
    ElseIf Asc(ReceiveBuffer) = &H82 Then                           'Acela has lost communications with the network
      ReceiveBuffer = Right$(ReceiveBuffer, Len(ReceiveBuffer) - 1) 'remove the service request from the queue
      CommsFailure = True                                           'flag the fact that a comms failure has occurred
    Else
      Exit Do                                                       'no more service requests, so we can stop looking
    End If
  Loop
  
End Sub

