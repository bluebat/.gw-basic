10 '******************************
20 '*                            *
30 '*       SINGING A SONG       *   begin - LISTEN - WRITE - SING - CHANGE
40 '*                            *         - SAVE - LIST AND ALTER - TUNE
50 '*           J.W.L            *         - EXPLAIN - STOP
60 '*                            *
70 '******************************
80 CLS:KEY OFF
90 ON KEY(14) GOSUB 1240
100 ON ERROR GOTO  1250
110 PRINT"  Do you want to write a new song (1), or listen for an old song (2)"
120 PRINT:PRINT"    press (1) or (2) to choise"STRING$(5,249):Z$=INPUT$(1)
130 Z=VAL(Z$):IF Z=1 THEN 270       'write
140 '__________ LISTEN __________
150 PRINT:FILES "S_*"
160 PRINT:INPUT "Press in the old song-filename ";SNAME$
170 OPEN SNAME$ FOR INPUT AS #1
180 INPUT #1,SONG$,BEAT,SPEED,FULL$
190 CLS:LOCATE 25,28:PRINT"Press "CHR$(25)" to stop playing !"
200 LOCATE 1,1:PRINT SPC(26)"****** "SONG$" ******"
210 X=SPEED:FULL=VAL(FULL$)^2/10+.01:TUNE=1
220 DIM S(BEAT),T(BEAT),Z(BEAT)
230 I=I+1
240  IF EOF(1) THEN CLOSE #1:GOTO 490       'change
250  INPUT #1,S(I),T(I)
260 GOTO 230
270 '___________ WRITE __________
280 CLS
290 PRINT:INPUT "SPEED(SLOW:27.3---12---5.25:FAST)";X
300 PRINT:PRINT "How many ";CHR$(14);" are about in it":INPUT Y:Y=Y+Y
310 PRINT:I=0:J=0
320 STAR$="*":TUNE=1:FULL=1
330 DIM A$(Y),SO$(Y),S$(Y),S(Y),T(Y),Z(Y)
340 PRINT"PLEASE USE THIS WAY [ name*beat ] LIKE  [ +2*.5 ] or [ #--6*2 ]"
350 '
360 I=I+1
370  PRINT"("I")";:INPUT "  ",A$(I)
380  GOSUB 1000        'explain
390 GOTO 360
400 '__________ SING __________
410 KEY(14) ON
420 B1=B1+1
430 S(B1)=S(B1)*TUNE
440 Z(B1)=T(B1)*X
450 IF Z(B1)=0 OR B1>B2 THEN IF D=1 THEN 590 ELSE KEY(14) OFF:GOTO 490
460 SOUND 32767,FULL
470 SOUND S(B1),Z(B1)
480 GOTO 420
490 '__________ CHANGE __________
500 PRINT:IF Z=1 THEN 520
510 PRINT" [0] end   [1] listen to   [2] speed   [3] full   [4] tune":GOTO 530
520 PRINT" [0] end   [1] listen to   [2] add   [3] alter   [4] save   [5] speed   [6] full [7] tune"
530 PRINT SPC(45)"Do you want to ..... it ?":D$=INPUT$(1):D=VAL(D$):PRINT
540 IF Z=1 THEN 560
550 ON D GOTO 580,630,640,650
560 ON D GOTO 580,600,610,620,630,640,650
570  GOTO 660
580  INPUT" [1] whole song     [2] beat1 - beat2  ";L:                               IF L=2 THEN PRINT:INPUT"? BEAT1  ,? BEAT2(0:end)  ",B1,B2:B1O=B1:GOTO 400              ELSE B1=0:B2=32767:GOTO 400
590   PRINT:INPUT "Do you want to listen to it again (y/n) ";A$:IF A$="y" OR A$=      "Y" THEN B1=B1O:PRINT CHR$(30);CHR$(30):GOTO 400 ELSE 490
600  INPUT" INPUT NEW i ";I:GOTO 370
610  GOTO 830
620  GOSUB 710
630  INPUT "What is the new speed ";X:GOTO 490
640  INPUT" [0]-full   [1]-normol   [2]-break  ";FULL:FULL=FULL*FULL/10+.01:         GOTO 490
650  U$="#1  2  #2  3  4  #4  5  #5  6  #6  7  1":PRINT"WHAT IS THE TUNE ?":         PRINT SPC(20);U$:INPUT TUNE$:GOSUB 920      'tune
660 INPUT "Do you want to make or take another one (Y/N)";D$
670 IF D$="Y" OR D$="y" THEN IF Z=1 THEN ERASE A$,SO$,S$,S,T,Z:GOTO 80                                              ELSE ERASE S,T,Z:GOTO 80
680 ON ERROR GOTO 0
690 KEY ON:END
700 '__________ SAVE __________
710 INPUT "What is the filename ";FILENAME$
720 CLOSE
730 OPEN FILENAME$ FOR OUTPUT AS #1
740 PRINT:INPUT"SONG's NAME  ,SPEED(5~27)  ,FULL(0.1.2) ";SONG$,SPEED,FULL$
750 BEAT=J
760 WRITE #1,SONG$,BEAT,SPEED,FULL$
770 FOR I=1 TO J
780  WRITE #1,S(I),T(I)
790 NEXT
800 CLOSE #1
810 RETURN 490
820 '__________ LIST  AND  ALTER __________
830 CLS
840 FOR K=1 TO J
850  PRINT USING "[###]";K;:PRINT"  ";SO$(K);"  ";:PRINT USING ",#.###";T(K),
860 NEXT K
870 '
880 PRINT"":INPUT"NUMBER,name*beat -----";I,A$(I)
890 IF I=0 THEN 490
900 GOSUB 1000
910 GOTO 880
920 '__________ TUNE __________
930 IF INSTR(U$,TUNE$)=0 THEN BEEP:RETURN 650     '(retry)
940 I0=I:I=0:O=1
950 S$=TUNE$
960 GOSUB 1090              'middle explain
970 TUNE=523.25/S(0)
980 I=I0 : RETURN 490             'change
990 '__________ EXPLAIN __________
1000 P=INSTR(A$(I),STAR$):IF P=0 THEN I=I-1:RETURN 340
1010 SO$=LEFT$(A$(I),P-1):T(I)=VAL(MID$(A$(I),P+1))
1020 IF T(I)=0 THEN J=I : RETURN 490
1030 S$=RIGHT$(SO$,1)
1040 IF LEN(S$)=LEN(SO$) THEN O=1 : GOTO 1080
1050 O$=MID$(SO$,LEN(S$),1)
1060 IF O$="+" THEN OC=1                                                                ELSE IF O$="-" THEN OC=-1                                                            ELSE IF O$="#" THEN S$="#"+S$:GOTO 1040
1070 O=2^((LEN(SO$)-LEN(S$))*OC)
1080 IF S$="0" THEN S(I)=32767
1090 IF S$="1" THEN S(I)=523.25
1100 IF S$="#1" OR S$="b2" THEN S(I)=554.36
1110 IF S$="2" THEN S(I)=587.33
1120 IF S$="#2" OR S$="b3" THEN S(I)=622.25
1130 IF S$="3" THEN S(I)=659.26
1140 IF S$="4" THEN S(I)=698.46
1150 IF S$="#4" OR S$="b5" THEN S(I)=739.99
1160 IF S$="5" THEN S(I)=783.99
1170 IF S$="#5" OR S$="b6" THEN S(I)=830.61
1180 IF S$="6" THEN S(I)=880
1190 IF S$="#6" OR S$="b7" THEN S(I)=932.33
1200 IF S$="7" THEN S(I)=987.77
1210 S(I)=S(I)*O : SO$(I)=SO$ : S$(I)=S$
1220 RETURN
1230 '__________ STOP __________
1240 RETURN 490
1250 RESUME 490
