10 '************************************
20 '*                                  *
30 '*              CLOTH               *
40 '*                                  *
50 '*              J.W.L               *
60 '*                                  *
70 '************************************
80 CLS : KEY OFF
90 LINE(80,30)-(640,320),1,B
100 LINE(120,50)-(600,300),1,B
110 PAINT(360,33),CHR$(16)+CHR$(16)+CHR$(255)+CHR$(1)+CHR$(1)+CHR$(255)
120 LOCATE 10,18 : PRINT" [1] show the cloth     [2] produce the cloth"
130 LOCATE 13,38:INPUT D
140 ON D GOTO 170,750
150 END
160 '-----------------------------------------
170 READ N0
180 DIM SIGN(N0),SIGN$(N0)
190 FOR I=0 TO N0
200   READ MOUNT
210   FOR J=1 TO MOUNT
220     READ NUM : SIGN$(I)=SIGN$(I)+CHR$(NUM)
230   NEXT
240 NEXT
250 '------------------------------------------
260 LOCATE 16,34 : INPUT "L,W,B =",L,W,B
270 CLS
280 Y1=0
290 Y2=W
300 WHILE Y2<347
310   X1=0
320   X2=L
330   WHILE X2<720
340     LINE(X1,Y1)-(X2,Y2),1,B
350     Z$=INPUT$(1):IF Z$="0" THEN 120
360     PAINT((X1+X2)/2,(Y1+Y2)/2),SIGN$(N) : N=(N+1) MOD N0
370    X1=X2+B
380    X2=X1+L
390   WEND
400   Y1=Y2+B
410   Y2=Y1+W
420 WEND
430 END
440 '----------------------------------------
450 DATA 28
460 DATA 1, 85  :'.....
470 DATA 1, 57  :'lll
480 DATA 1, 17  :'ll
490 DATA 2, 85,170  :'....
500 DATA 2, 17,68  :'...
510 DATA 2, 1,16  :'..
520 DATA 9, 0,0,1,0,0,64,0,0,8  :'.
530 DATA 6, 16,16,255,1,1,255  :'steck
540 DATA 8, 129,66,36,24,24,36,66,129  :'XX
550 DATA 7, 0,60,66,66,66,60,0  :'OO
560 DATA 9, 0,0,24,24,60,255,60,24,24  :'wave
570 DATA 9, 24,24,0,0,131,131,0,0,24  :'light
580 DATA 8, 0,8,20,34,65,34,20,8  : 'diamond
590 DATA 10, 12,2,1,1,2,12,16,32,32,16  :'SS
600 DATA 5, 255,1,1,1,1  :'cell
610 DATA 5, 16,40,68,130,1  :'VV
620 DATA 3, 0,0,255  :'----
630 DATA 4, 0,0,255,255  :'==
640 DATA 6, 129,129,102,24,24,102  :'net
650 DATA 5, 0,0,7,7,7  :'block
660 DATA 6, 8,28,127,28,20,34  :'star
670 DATA 9, 193,34,50,20,8,8,20,50,34  :'scale
680 DATA 14, 0,0,5,5,2,0,80,80,32,0,0,20,20,8  :'swass
690 DATA 9, 136,73,46,28,255,28,42,73,136  :'mice
700 DATA 4, 21,37,85,141  :'bamboo
710 DATA 4, 57,69,131,1  :'WA3
720 DATA 4, 136,68,34,17  :'//
730 DATA 4, 17,34,68,136  :'\\
740 '----------------------------------------
750 '----------------------------------------
760 CLS
770 DIM NUM(15)
780 DEF FNX(I)=360-40*I
790 DEF FNY(I)=20+20*I
800 RESTORE 840
810 FOR J=1 TO 9
820   READ DX(J),DY(J)
830 NEXT
840 DATA 1,1,0,1,-1,1,1,0,0,0,-1,0,1,-1,0,-1,-1,-1
850 '---------
860 LONG=0 : ROW=0 : W0=1
870 GOSUB 1050
880 GOTO 960
890 '---------------- loop ------------------
900 C$=INPUT$(1) : C=VAL(C$)
910 ON INSTR("+-5*0",C$) GOTO 980,980,1110,1210,1350
920 IF C=0 THEN BEEP:GOTO 900
930 LINE(FNX(COL)-2,FNY(ROW)-2)-(FNX(COL)+38,FNY(ROW)+18),0,B
940 COL=(COL+DX(C)+8) MOD 8
950 ROW=(ROW+DY(C)+LONG+1) MOD (LONG+1)
960 LINE(FNX(COL)-2,FNY(ROW)-2)-(FNX(COL)+38,FNY(ROW)+18),1,B
970 GOTO 900
980 '----------------- +/- ------------------
990 ROW0=ROW
1000 W=VAL(C$+"1") : W0=SGN(W+1)
1010 ROW=LONG+W0 : NUM(ROW)=0 : LONG=LONG+W
1020 GOSUB 1050
1030 ROW=ROW0
1040 GOTO 900
1050 '------------------  -------------------
1060 FOR I=0 TO 7
1070   LINE(FNX(I),FNY(ROW))-(FNX(I)+36,FNY(ROW)+16),W0,B,&H8888
1080   LOCATE FNY(ROW)\14+2,75 : PRINT NUM(ROW)
1090 NEXT
1100 RETURN
1110 '------------------ 5 -------------------
1120 IF ROW>LONG THEN C=8:GOTO 930
1130 SOUND 122,2
1140 X=FNX(COL) : Y=FNY(ROW)
1150 P=POINT(X+20,Y+10)
1160 LINE(X,Y)-(X+36,Y+16),1-P,BF
1170 IF P=1 THEN LINE(X,Y)-(X+36,Y+16),1,B,&H8888
1180 NUM(ROW)=NUM(ROW)+(-1)^P*2^COL
1190 LOCATE Y\14+2,75 : PRINT NUM(ROW);
1200 GOTO 900
1210 '------------------ * -------------------
1220 LINE(500,50)-(600,100),0,BF
1230 LINE(500,50)-(600,100),1,B
1240 LENGTH=LONG
1250 STYLE$=""
1260 IF LENGTH<0 THEN 900
1270 IF NUM(LENGTH)=0 THEN LENGTH=LENGTH-1:GOTO 1260
1280 LENGTH=LENGTH+((LONG-LENGTH) MOD 3)
1290 FOR J=0 TO LENGTH
1300   STYLE$=STYLE$+CHR$(NUM(J))
1310 NEXT
1320 PAINT(550,75),STYLE$
1330 GOTO 900
1340 '------------------ 0 -------------------
1350 LOCATE 23,20 : PRINT"Do you want to make another (Y/N) ? "
1360 Z$=INPUT$(1)
1370 IF Z$="Y" OR Z$="y" THEN ERASE NUM,SIGN,SIGN$:GOTO 760
1380 KEY ON : LOCATE 1,1 : END
