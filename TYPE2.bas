10 '********************************
20 '*                              *
30 '*        TYPING  TEST  2       *
40 '*                              *
50 '*             J.W.L            *
60 '*                              *
70 '********************************
80 DEF SEG=0 : POKE 1047,(PEEK(1047) OR 64)
90 CLS : KEY OFF
100 RANDOMIZE VAL(RIGHT$(TIME$,2))*VAL(MID$(TIME$,4,2))
110 L=36 : W=42
120 NX=6 : NY=6
130 MOUNT=NX*NY
140 DIM SIGN(53)
150 DIM COX(MOUNT),COY(MOUNT),ROW(MOUNT),COL(MOUNT),CHAR$(70)
160 DIM EMPTY(MOUNT),HAVE(MOUNT)
170 '
180 STYLE=1
190 ON STYLE GOTO 200,210
200 CIRCLE(18,21),18,,,,1.2:CIRCLE(18,21),16,,,,1.2 : GOTO 220
210 LINE(1,1)-(34,40),1,BF:LINE(3,3)-(32,38),0,BF:LINE(5,5)-(30,36),1,B
220 GET(0,0)-(35,41),SIGN
230 LOCATE 12,27 : PRINT"TYPING  TEST  II          J.W.L"
240 LOCATE 23,33 : PRINT"wating........"
250 '
260 J=0
270 LEFTX=360-NX*L/2 : UPY=173-NY*W/2
280 FOR X=0 TO NX-1
290   FOR Y=0 TO NY-1
300     COX(J)=LEFTX+X*L : COY(J)=UPY+Y*W
310     ROW(J)=COY(J)\14+2 : COL(J)=COX(J)\9+2
320     J=J+1
330   NEXT
340 NEXT
350 '
360 O$(1)="1234567890"
370 O$(2)="QWERTYUIOP"
380 O$(3)="ASDFGHJKL"
390 O$(4)="ZXCVBNM"
400 O$(5)=O$(2)+O$(3)+O$(4)
410 O$(6)="$*()-=\+;:',<.>/?"+CHR$(34)
420 O$(7)="`~!@#%^&_|[{]}"
430 O$(9)=O$(1)+O$(2)+O$(3)+O$(4)+O$(6)+O$(7)
440 '
450 '-----------------------------------------------------
460 RECORD=0 : REST=MOUNT : EXIT=0
470 FOR J=0 TO MOUNT-1 : EMPTY(J)=J : NEXT
480 '
490 '-------- stage --------
500 CLS : KEY OFF
510 LOCATE 1,15 : PRINT"REST = ";REST;
520 LOCATE 1,50 : PRINT"RECORD = ";RECORD;
530 LOCATE 2,2 : PRINT STRING$(78,216);
540 LOCATE 25,2 : PRINT STRING$(78,216);
550 LINE(9,14)-(710,347),,B
560 '
570 '-------- deside --------
580 LOCATE 10,15 : PRINT"[1] 1-0  [2] Q..P  [3] A..L  [4] Z..M  [5] letters"
590 LOCATE 12,18 : PRINT"[6] $.+.;..  [7] |.~.]..  [8] none  [9] all"
600 LOCATE 14,20 : INPUT "What parts do you want to practice ?  ",O
610 IF O<1 OR O>9 THEN BEEP : GOTO 600
620 LOCATE 15,22 : INPUT "How many delay do you like (0-9) ?  ",DELAY
630 IF DELAY<0 OR DELAY>9 THEN BEEP : GOTO 620
640 LOCATE 17,18 : INPUT "If you like to go with SOUND, press [ON]  ",BELL$
650 '
660 OBJ$=O$(O) : OBJ=LEN(OBJ$)
670 FOR J=1 TO OBJ : CHAR$(J)=MID$(OBJ$,J,1) : NEXT
680 LINE(125,125)-(575,240),0,BF
690 '
700 '########### char spot ############
710 WHILE REST>0
720  GOSUB 820               'burn out
730  GOSUB 1090               'produce
740  DEF SEG=0 : POKE 1050,PEEK(1052)
750  FOR J=0 TO DELAY*100 : NEXT
760  LOCATE ROW(SEAT),COL(SEAT) : PRINT " ";
770  KEYIN$=INKEY$
780  IF KEYIN$=C$ THEN GOSUB 960 'kill
790 WEND
800 GOTO 1170
810 '###################################
820 '------- burn out ------
830 NUM=INT(RND*REST)
840 SEAT=EMPTY(NUM)
850 IF BELL$="ON" THEN PLAY"MBMLL64CDEGA"
860 PUT(COX(SEAT),COY(SEAT)),SIGN
870 REST=REST-1
880 LOCATE 1,22 : PRINT REST;
890 FOR J=NUM TO REST-1
900   EMPTY(J)=EMPTY(J+1)
910 NEXT
920 EXIT=EXIT+1
930 HAVE(EXIT)=SEAT
940 RETURN
950 '
960 '------- kill -------
970 RECORD=RECORD+1
980 LOCATE 1,59 : PRINT RECORD;
990 IF BELL$="ON" THEN SOUND 575,2
1000 X=COX(SEAT) : Y=COY(SEAT)
1010 LINE(X,Y)-(X+L-1,Y+W-1),0,BF
1020 REST=REST+1
1030 EMPTY(REST)=SEAT
1040 EXIT=EXIT-1
1050 FOR J=NUM TO EXIT
1060   HAVE(J)=HAVE(J+1)
1070 NEXT
1080 RETURN
1090 '
1100 '------- produce -------
1110 C$=CHAR$(INT(RND*OBJ)+1)
1120 NUM=INT(RND*EXIT)+1
1130 SEAT=HAVE(NUM)
1140 LOCATE ROW(SEAT),COL(SEAT) : PRINT C$;
1150 RETURN
1160 '
1170 '------- end -------
1180 LOCATE 21,24 : PRINT"Do you want to play again ?(Y/N)"
1190 DEF SEG=0 : POKE 1050,PEEK(1052)
1200 D$=INPUT$(1) : IF D$="Y" THEN 450
1210 '----------------------------------------------------
1220 KEY ON
1230 END
