1 REM PROGRAM: SPRITE TEST


1699 REM SPRINT FRAME OFFSETS
1700 FH(0) = $00 : FH(1) = $04 : FH(2) = $08 : FH(3) = $04
1710 FV(0) = $00 : FV(1) = $0C : FV(2) = $10 : FV(3) = $0C
1720 HZ = 1
1800 CF = 0 : REM CURRENT FRAME

1999 REM ENABLE SPRITES
2000 POKE $9F29,($40 OR PEEK($9F29))

2099 REM SET SPRITE DATA
2100 VPOKE $1,$FC10,$00
2200 VPOKE $1,$FC11,$07 : REM 4BPP, ADDRESS $0E000
2300 VPOKE $1,$FC12,$80 : REM XPOS 128
2400 VPOKE $1,$FC13,$00
2450 X = 128
2500 VPOKE $1,$FC14,$80 : REM YPOS 128
2600 VPOKE $1,$FC15,$00
2650 Y = 128
2700 VPOKE $1,$FC16,$0C : REM NO COLLISION, ZDEPTH 3, NO FLIP
2800 VPOKE $1,$FC17,$50 : REM 16X16 PIXELS, PALETTE OFFSET 0

3000 DATA $00,$00,$00,$77,$77,$00,$00,$00
3002 DATA $00,$00,$77,$77,$77,$77,$00,$00
3004 DATA $00,$07,$77,$77,$77,$77,$70,$00
3006 DATA $00,$77,$77,$77,$77,$77,$77,$00
3008 DATA $07,$77,$77,$77,$77,$77,$77,$70
3010 DATA $07,$77,$77,$77,$77,$77,$77,$70
3012 DATA $77,$77,$77,$77,$77,$77,$77,$77
3014 DATA $77,$77,$77,$77,$77,$77,$77,$77
3016 DATA $77,$77,$77,$77,$77,$77,$77,$77
3018 DATA $77,$77,$77,$77,$77,$77,$77,$77
3020 DATA $07,$77,$77,$77,$77,$77,$77,$70
3022 DATA $07,$77,$77,$77,$77,$77,$77,$70
3024 DATA $00,$77,$77,$77,$77,$77,$77,$00
3026 DATA $00,$07,$77,$77,$77,$77,$70,$00
3028 DATA $00,$00,$77,$77,$77,$77,$00,$00
3030 DATA $00,$00,$00,$77,$77,$00,$00,$00
3031 FOR I=0 TO 127: READ B: VPOKE $0,$E000+I,B: NEXT I
3032 DATA $00,$00,$00,$77,$77,$00,$00,$00
3034 DATA $00,$00,$77,$77,$77,$77,$00,$00
3036 DATA $00,$07,$77,$77,$77,$77,$70,$00
3038 DATA $00,$77,$77,$77,$77,$77,$77,$00
3040 DATA $07,$77,$77,$77,$77,$77,$77,$70
3042 DATA $07,$77,$77,$77,$77,$77,$00,$00
3044 DATA $77,$77,$77,$77,$77,$00,$00,$00
3046 DATA $77,$77,$77,$77,$00,$00,$00,$00
3048 DATA $77,$77,$77,$77,$00,$00,$00,$00
3050 DATA $77,$77,$77,$77,$77,$00,$00,$00
3052 DATA $07,$77,$77,$77,$77,$77,$00,$00
3054 DATA $07,$77,$77,$77,$77,$77,$77,$70
3056 DATA $00,$77,$77,$77,$77,$77,$77,$00
3058 DATA $00,$07,$77,$77,$77,$77,$70,$00
3060 DATA $00,$00,$77,$77,$77,$77,$00,$00
3062 DATA $00,$00,$00,$77,$77,$00,$00,$00
3063 FOR I=0 TO 127: READ B: VPOKE $0,$E080+I,B: NEXT I
3064 DATA $00,$00,$00,$77,$77,$00,$00,$00
3066 DATA $00,$00,$77,$77,$77,$77,$00,$00
3068 DATA $00,$07,$77,$77,$77,$77,$70,$00
3070 DATA $00,$77,$77,$77,$77,$77,$00,$00
3072 DATA $07,$77,$77,$77,$77,$70,$00,$00
3074 DATA $07,$77,$77,$77,$77,$00,$00,$00
3076 DATA $77,$77,$77,$77,$70,$00,$00,$00
3078 DATA $77,$77,$77,$77,$00,$00,$00,$00
3080 DATA $77,$77,$77,$77,$00,$00,$00,$00
3082 DATA $77,$77,$77,$77,$70,$00,$00,$00
3084 DATA $07,$77,$77,$77,$77,$00,$00,$00
3086 DATA $07,$77,$77,$77,$77,$70,$00,$00
3088 DATA $00,$77,$77,$77,$77,$77,$00,$00
3090 DATA $00,$07,$77,$77,$77,$77,$70,$00
3092 DATA $00,$00,$77,$77,$77,$77,$00,$00
3094 DATA $00,$00,$00,$77,$77,$00,$00,$00
3095 FOR I=0 TO 127: READ B: VPOKE $0,$E100+I,B: NEXT I
3096 DATA $00,$00,$00,$00,$00,$00,$00,$00
3098 DATA $00,$00,$70,$00,$00,$07,$00,$00
3100 DATA $00,$07,$70,$00,$00,$07,$70,$00
3102 DATA $00,$77,$70,$00,$00,$07,$77,$00
3104 DATA $07,$77,$77,$00,$00,$77,$77,$70
3106 DATA $07,$77,$77,$00,$00,$77,$77,$70
3108 DATA $77,$77,$77,$70,$07,$77,$77,$77
3110 DATA $77,$77,$77,$70,$07,$77,$77,$77
3112 DATA $77,$77,$77,$77,$77,$77,$77,$77
3114 DATA $77,$77,$77,$77,$77,$77,$77,$77
3116 DATA $07,$77,$77,$77,$77,$77,$77,$70
3118 DATA $07,$77,$77,$77,$77,$77,$77,$70
3120 DATA $00,$77,$77,$77,$77,$77,$77,$00
3122 DATA $00,$07,$77,$77,$77,$77,$70,$00
3124 DATA $00,$00,$77,$77,$77,$77,$00,$00
3126 DATA $00,$00,$00,$77,$77,$00,$00,$00
3127 FOR I=0 TO 127: READ B: VPOKE $0,$E180+I,B: NEXT I
3128 DATA $00,$00,$00,$00,$00,$00,$00,$00
3130 DATA $00,$00,$00,$00,$00,$00,$00,$00
3132 DATA $00,$00,$00,$00,$00,$00,$00,$00
3134 DATA $00,$70,$00,$00,$00,$00,$07,$00
3136 DATA $07,$77,$00,$00,$00,$00,$77,$70
3138 DATA $07,$77,$70,$00,$00,$07,$77,$70
3140 DATA $77,$77,$77,$00,$00,$77,$77,$77
3142 DATA $77,$77,$77,$70,$07,$77,$77,$77
3144 DATA $77,$77,$77,$77,$77,$77,$77,$77
3146 DATA $77,$77,$77,$77,$77,$77,$77,$77
3148 DATA $07,$77,$77,$77,$77,$77,$77,$70
3150 DATA $07,$77,$77,$77,$77,$77,$77,$70
3152 DATA $00,$77,$77,$77,$77,$77,$77,$00
3154 DATA $00,$07,$77,$77,$77,$77,$70,$00
3156 DATA $00,$00,$77,$77,$77,$77,$00,$00
3158 DATA $00,$00,$00,$77,$77,$00,$00,$00
3159 FOR I=0 TO 127: READ B: VPOKE $0,$E200+I,B: NEXT I

4000 GET A$
4100 IF A$="" THEN GOTO 4000
4200 IF A$=CHR$(29) AND X < 640 THEN GOSUB 5000
4300 IF A$=CHR$(157) AND X > 0 THEN GOSUB 6000
4400 IF A$=CHR$(17) AND Y < 480 THEN GOSUB 7000
4500 IF A$=CHR$(145) AND Y > 0 THEN GOSUB 8000
4600 GOTO 4000

4999 REM MOVE RIGHT
5000 X = X+1
5100 VPOKE $1,$FC12,X AND $FF
5200 VPOKE $1,$FC13,(X AND $0300)/$100
5250 HZ = 1
5300 GOSUB 9000
5400 VPOKE $1,$FC16,$0C : REM NO FLIP
5500 RETURN

5999 REM MOVE LEFT
6000 X = X-1
6100 VPOKE $1,$FC12,X AND $FF
6200 VPOKE $1,$FC13,(X AND $0300)/$100
6250 HZ = 1
6300 GOSUB 9000
6400 VPOKE $1,$FC16,$0D : REM H-FLIP
6500 RETURN

6999 REM MOVE DOWN
7000 Y = Y+1
7100 VPOKE $1,$FC14,Y AND $FF
7200 VPOKE $1,$FC15,(Y AND $0300)/$100
7250 HZ = 0
7300 GOSUB 9000
7350 VPOKE $1,$FC16,$0E : REM V-FLIP
7400 RETURN

7999 REM SCROLL UP
8000 Y = Y-1
8100 VPOKE $1,$FC14,Y AND $FF
8200 VPOKE $1,$FC15,(Y AND $0300)/$100
8250 HZ = 0
8300 GOSUB 9000
8350 VPOKE $1,$FC16,$0C : REM NO FLIP
8400 RETURN

8999 REM NEXT FRAME
9000 CF = CF + 1
9100 IF CF > 11 THEN CF = 0
9110 IF HZ = 1 THEN FR = FH(CF/3) : GOTO 9200
9120 FR = FV(CF/3)
9200 VPOKE $1,$FC10,FR
9300 CP = (((X+8)/8 AND $7F) + ((Y+8)*16 AND $7F80)) * 2
9400 IF CP > $3FFE THEN CP = $3FFE
9500 VPOKE 1,CP+$B000,$20
9900 RETURN
