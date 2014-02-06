10 '************************************
20 '*                                  *     (XM,YM) -> center
30 '*      GRAPHICS OF FUNCTION        *     (X0,Y0) -> new point
40 '*                                  *     (XC,YC) -> old point
50 '*              J.W.L               *
60 '*                                  *     BEgin , ENd , Length
70 '************************************
80 DEF SEG=0 : IF (PEEK(1047) AND 64)<>64 THEN POKE 1047,(PEEK(1047) OR 64)
90 CLS
100 PRINT"Is the CENTER of [X,Y] changing(Y/N)":A1$=INPUT$(1)
110 PRINT
120 PRINT"Will the COORDINATE of each point be shown(Y/N)":A2$=INPUT$(1)
130 CLS
140 KEY OFF
150 ON ERROR GOTO 1140
160 DEF FNES(X)=SIN(EXP(COS(X))) : DEF FNEC(X)=COS(EXP(COS(X))) :'***********
170 DEF FNAS(X)=SIN(X)*ABS(SIN(X/10)) : DEF FNAC(X)=COS(X)*ABS(COS(X/10))'***
180 DEF FNWO(X)=ABS(X-FIX(X))+(ABS(FIX(X)) MOD 3)+2 :'************
190 DEF FNW(X)=FNWO(X)^(1/FNWO(X))-1.414213 :'***********************
200 PI=3.1415926#:N0=0
210 XM=360:YM=173
220 PRINT"(defined by yourself)--------------------------(0)"
230 PRINT
240 PRINT"Y=A*X^4+B*X^3+C*X^2+D*X+E----------------------(1)"
250 PRINT"Y=X^A*SIN(B*X^C)^D-----------------------------(2)"
260 PRINT
270 PRINT"R=A+B*SIN(C*)+D*SIN(E+F*)--------------------(3)"
280 PRINT"R=(A+B*SIN(C*))*(A+D*COS(E*))----------------(4)"
290 PRINT"R=(A+B*+C*D^)^E------------------------------(5)"
300 PRINT
310 PRINT"{X=A**COS()^C+D*SIN()                                                        {Y=B**SIN()^C+E*COS()-----------------------(6)"
320 PRINT"{X=sin((A+C)*)*cos(D*)                                                        {Y=sin((B+C)*)*sin(E*)-----------------------(7)"
330 PRINT
340 PRINT"{X=(A-B)*COS()+C*COS((A-B)/B*)                                                {Y=(A-B)*SIN()-C*SIN((A-B)/B*)---------------(8)"
350 PRINT"(7) on CIRCLE:[R=D,T(E*)]---------------------(9)"
360 PRINT
370 PRINT"{X=(A+B)*COS()-C*COS((A+B)/B*)                                                {Y=(A+B)*SIN()-C*SIN((A+B)/B*)---------------(10)"
380 PRINT"(9) on CIRCLE:[R=D,T(E*)]---------------------(11)"
390 PRINT
400 '__________ DEFINE __________
410 INPUT"Which one do you want to draw";N
420 IF N=0 THEN 1030
430 INPUT "A?,B?,C?,D?,E?,F";A,B,C,D,E,F
440 ON N GOTO 460,470,480,490,500,510,520,530,530,540,540
450                                           GOTO 580
460 DEF FNY(X)=A*X^4+B*X^3+C*X^2+D*X+E:       GOTO 580
470 DEF FNY(X)=X^A*SIN(B*X^C)^D:              GOTO 560
480 DEF FNR(X)=A+B*SIN(C*X)+D*SIN(E+F*X):     GOTO 560
490 DEF FNR(X)=(A+B*SIN(C*X))*(A+D*COS(E*X)): GOTO 560
500 DEF FNR(X)=(A+B*X+C*D^X)^E:               GOTO 560
510 DEF FNRX(X)=A*X*COS(X)^C+D*SIN(X):                                              DEF FNRY(X)=B*X*SIN(X)^C+E*COS(X):        GOTO 560
520 DEF FNRX(X)=SIN((A+C)*X)*COS(D*X):                                              DEF FNRY(X)=SIN((B+C)*X)*SIN(E*X):        GOTO 560
530 DEF FNRX(X)=(A-B)*COS(X)+C*COS((A-B)/B*X):                                      DEF FNRY(X)=(A-B)*SIN(X)-C*SIN((A-B)/B*X):GOTO 560
540 DEF FNRX(X)=(A+B)*COS(X)-C*COS((A+B)/B*X):                                      DEF FNRY(X)=(A+B)*SIN(X)-C*SIN((A+B)/B*X):GOTO 560
550 '__________ BACKGROUND __________
560 INPUT"Begin and End for [X]()";BE,EN
570 BE=BE*PI:EN=EN*PI+.1:GOTO 590
580 INPUT"Begin and End for [X] ";BE,EN
590 INPUT"Proportion of [Y]/[X] and [Y+]/[Y-]or[Height] ";YAX,H
600 INPUT"(FINE) big-TO-small (ROUGH) ";Q
610 IF Q=0 THEN IN=.1 ELSE IN=PI/Q
620 C$="begin"
630 IF P$<>"COVER" THEN CLS
640 IF N=0 THEN N=N0
650 IF N>2 THEN 710
660 L=ABS(EN-BE)
670 XM=-720*BE/L
680 LINE (XM,0)-(XM,346)
690 YM=INT(347*H/(1+H))
700 LINE (0,YM)-(720,YM)
710 '__________ DRAW __________
720 ON KEY(14) GOSUB 1150
730 KEY(14) ON : PRINT"Press "CHR$(25)" to STOP" : LOCATE 1,1
740 FOR X=BE TO EN STEP IN
750 'PRINT X;FNY(X),: GOTO 630:'********************
760 ON N GOTO 770,770,780,780,780,790,790,790,800,790,800
770 X0=XM+X*720/L:Y0=YM-FNY(X)*YAX*720/L/1.52:                       GOTO 810
780 X0=XM+FNR(X)*COS(X)*H*1.52:Y0=YM-FNR(X)*SIN(X)*H*YAX:            GOTO 810
790 X0=XM+FNRX(X)*H*1.52:Y0=YM-FNRY(X)*H*YAX:                        GOTO 810
800 X0=XM+(FNRX(X)-D+D*COS(E*X))*H*1.52:Y0=YM-(FNRY(X)+D*SIN(E*X))*H:GOTO 810
810 IF (X0<0 OR X0>720) AND (XC<0 OR XC>720) THEN 840
820 IF (Y0<0 OR Y0>346) AND (YC<0 OR YC>346) THEN 840
830 IF C$="begin" THEN PSET(X0,Y0):C$="" ELSE LINE (XC,YC)-(X0,Y0)
840 XC=X0:YC=Y0
850 IF A1$="Y" THEN XM=XC:YM=YC
860 IF A2$="Y" THEN LOCATE 1,70:PRINT INT(XC-XM);INT(YM-YC);SPC(5)
870 NEXT X
880 KEY(14) OFF
890 '__________ CONTINUE __________
900 INPUT "`COVER' OR `CLS' ";P$
910 PRINT "[ 0-point,  1-alter,  2-change,  3-redraw,  4-end (0/1/2/3/4) ]";
920 Z$=INPUT$(1):Z=VAL(Z$)
930 LOCATE 1,1
940 IF N0<>0 THEN N=0
950 ON Z GOTO 440,430,130,990
960 INPUT XW
970 LOCATE CSRLIN-1,3 : PRINT "  "FNY(XW)
980 GOTO 910
990 KEY ON:ON ERROR GOTO 0
1000 KEY 1,CHR$(27)+"LIST "
1010 END
1020 '__________ SELF FUNC. __________
1030 INPUT "M-ake it OR T-ake it ";YN$
1040 IF YN$="T" THEN 1100
1050 KEY 1,CHR$(13)+"RUN 1080"+CHR$(13)
1060 PRINT:PRINT"Please defined your FUNCTION.  Press F1 when ready.":PRINT
1070 LIST 1110
1080 KEY 1,CHR$(27)+"LIST "
1090 PI=3.1415926#
1100 INPUT"1-2 FNY(X) ; 3-5 FNR(X) ; 6-8,10 FNRX(X)_FNRY(X) ; 9,11 circle";N0
1110 DEF FNR(X)=2/COS(X)
1120 GOTO 430
1130 '__________ ERROR __________
1140 RESUME 870
1150 RETURN 910
