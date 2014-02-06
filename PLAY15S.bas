10 GOTO 160
20 '********************************
30 '*                              *                 1
40 '*           PLAY  15           *              9    4
50 '*                              *           12   13   10
60 '*             J.W.L            *         6   15    14   7
70 '*                              *       3    8   11   5    2
80 '********************************
90 '  MS$ : My Steps     SL : Steps'Lengh     FNSN : Steps'Number   W$ : Word
100 '  CS$ : Computer's Steps    CN : Color Number    FNFACE : FACE's situation
110 '  NN : New Number    NS$ : New Steps     CO : COlor     SUM : killed place
120 '  NUM : NUMber    PX : Place at X    PY : Place at Y   A$ : Add steps
130 '  K : Kind (1 for compuetr ,2 for man)      J- : suppose (JXA,JYA,JN,JK)
140 '  CD : Change Degrees   SA : Steps' first Ascii    WC$ : Word'S Change
150 '  OS$ : Origenal Steps  NSUM : New SUM   LACK : LACK one
160 '__________ PREPARE __________
170 OPEN "FIFTEEN" AS #1 LEN=3
180 FIELD #1,3 AS STEPS$
190 DEF SEG=0 : POKE 1047,(PEEK(1047) OR 64)
200 DEFINT I,J,K,M,P,S,X,Y
210 DEFSNG C,F,N
220 DEF FNSN(S$,N)=ASC(MID$(S$,N,1))-64
230 DEF FNFACE=CN(1)+CN(2)+CN(3)+CN(4)+CN(5)+CN(6)+CN(7)+CN(8)+CN(9)+CN(10)                   +CN(11)+CN(12)+CN(13)+CN(14)+CN(15)
240 PI#=3.1415926#
250 OPTION BASE 1
260 RANDOMIZE VAL(RIGHT$(TIME$,2))
270 KEY OFF
280 CLS                              'again  from
290 LOCATE 11,22:PRINT"Do you want to paint them first ?(Y/N) ":FI$=INPUT$(1)
300 CLS
310 LOCATE 22,5:PRINT "Enter steps like  [ A ]   or  [ GE ]  or  [ ILF ]"
320 '__________ 15 BALLS __________
330 DIM PX(15),PY(15),WC$(15)
340 RESTORE 1610
350 FOR I=1 TO 15
360  W$=CHR$(I+64)
370  READ X,Y
380  LOCATE Y,X:PRINT W$ : CIRCLE(X*9-4,Y*14-7),20,,,,.66
390  PX(I)=X:PY(I)=Y : WC$(I)=W$
400 NEXT
410 DIM CO(15),CN(15),NN(36,2),NS$(36,2)
420 M(1)=1:M(2)=1 : CS$="":MS$="" : SUM=0
430 '__________ GAME __________
440 IF FI$<>"Y" THEN 610
450 '            Man
460 LOCATE 4,50 :PRINT SPC(20) :LOCATE 4,52
470 IF LEFT$(CS$,1)>="A" AND LEFT$(CS$,1)<="O" THEN MS$=CS$:PRINT"YOUR STEPS ?";        CS$ :'GOTO 480        '*****************
480 INPUT " YOUR STEPS ? ",MSO$:IF MSO$<>"" THEN MS$=MSO$
490 SL=LEN(MS$)
500 S$=MS$
510 K=2
520 IF MS$=CS$ OR FNFACE=0 THEN 600
530 IF SL>5 OR SL<1 THEN SOUND 1000,3:GOTO 460   '**************
540 FOR N=1 TO SL
550  JA=ASC(MID$(S$,N,1))
560  IF JA<65 OR JA>79 THEN SOUND 1000,3:GOTO 460
570  IF CO(FNSN(S$,N))=1 THEN SOUND 1000,3:GOTO 460
580 NEXT
590 GOSUB 1260                         'memory
600 GOSUB 960                         'draw and get
610 '           Computer
620 SL=LEN(CS$)
630 IF SL=0 THEN 650
640 SA=ASC(LEFT$(CS$,1)) : IF SA>64 AND SA<80 THEN JH$="Y":GOTO 850
650 JH$="N":CS$=""
660 CI=INT(RND*15)+1
670 IF CO(CI)=1 THEN 660
680 CS$=CHR$(CI+64)
690 FOR CD=RND*2*PI TO 2*PI# STEP PI#/3
700  JXA=FIX(2.1*COS(CD))*5 : JYA=-FIX(2.1*SIN(CD))*3
710  JX=PX(CI)+JXA : JY=PY(CI)+JYA
720  JN=SCREEN(JY,JX)
730  IF JN>79 OR JN<65 THEN 840
740  CS$=CS$+CHR$(JN)
750  JN=SCREEN(JY+JYA,JX+JXA)
760  IF JN<80 AND JN>64 THEN A$=CHR$(JN) : GOTO 800
770  JN=SCREEN(PY(CI)-JYA,PX(CI)-JXA)
780  IF JN<80 AND JN>64 THEN A$=CHR$(JN) : GOTO 800
790  A$=""
800  CS$=CS$+A$ : CD=7
810 LACK=1-LACK : NSUM=SUM+LEN(CS$)
820  IF SUM+LEN(CS$)>14 THEN CS$=LEFT$(CS$,14-SUM)
830  IF SUM>11 AND NSUM<>14 AND LACK=1 THEN LACK=0 :GOTO ELSE LACK=0
840 NEXT CD
850 LOCATE 8,50 : PRINT SPC(25)
860 LOCATE 8,50 : PRINT"Computer's steps - ";CS$
870 INPUT "C'S-- ";CSO$:IF CSO$<>"" THEN CS$=CSO$:JH$="N"
880 SL=LEN(CS$)
890 IF SL>3 OR SL<1 THEN SOUND 1000,3 : GOTO 650
900 S$=CS$
910 K=1
920 IF JH$="N" THEN GOSUB 1260                  'memory
930 GOSUB 960                                   'draw and get
940 GOTO 460
950 '__________ DRAW AND GET __________
960 FOR N=1 TO SL
970  NUM=FNSN(S$,N)
980  CO(NUM)=1:CN(NUM)=2^(NUM-1):SUM=SUM+1
990  PAINT(PX(NUM)*9,PY(NUM)*14)
1000 NEXT
1010 SOUND 575,3
1020 FOR I=1 TO 300:NEXT I
1030 IF SUM=14 THEN RETURN 1110                'end
1040 '
1050 GET #1,FNFACE
1060 IN=INSTR(STEPS$,CHR$(0))-1
1070 IF IN=-1 THEN IN=INSTR(STEPS$,CHR$(32))-1
1080 IF IN=-1 THEN IN=3
1090 CS$=LEFT$(STEPS$,IN)
1100 RETURN
1110 '__________ END __________
1120 LOCATE 20,60:SOUND 575,0
1130 IF K=2 THEN 1150
1140 PRINT"Computer wins !! " : GOTO 1160
1150 PRINT"   Man wins !!"
1160 FOR JK=1 TO 2
1170  FOR M=1 TO M(JK)
1180   IF NN(M,JK)=0 THEN 1210
1190   LSET STEPS$=NS$(M,JK)
1200   PUT #1,NN(M,JK)
1210  NEXT M
1220 NEXT JK
1230 LOCATE 1,1:PRINT "Do you want to play again(Y/N)":D$=INPUT$(1)
1240 IF D$="Y" THEN ERASE CO,CN,NN,NS$,PX,PY,WC$ : GOTO 280
1250 CLOSE : KEY ON : END
1260 '__________ MEMORY __________
1270 FOR I=1 TO 2
1280 OS$=S$
1290  FOR I1=1 TO 3
1300   NN(M(K),K)=FNFACE : NS$(M(K),K)=S$ : M(K)=M(K)+1
1310   FOR J1=1 TO 13 STEP 3
1320    SWAP CO(J1),CO(J1+1) : SWAP CO(J1),CO(J1+2)
1330    SWAP WC$(J1),WC$(J1+2) : SWAP WC$(J1),WC$(J1+1)
1340   NEXT
1350   GOSUB 1520
1360  NEXT I1
1370  RESTORE
1380  FOR J4=1 TO 6
1390   READ PR,PO
1400   SWAP CO(PR),CO(PO)
1410   SWAP WC$(PR),WC$(PO)
1420  NEXT
1430  GOSUB 1520
1440  RESTORE
1450  FOR J5=1 TO 6
1460   READ PR,PO
1470   SWAP WC$(PR),WC$(PO)
1480  NEXT
1490 NEXT I
1500 RETURN
1510 '
1520   FOR J2=1 TO 15
1530    CN(J2)=CO(J2)*2^(J2-1)
1540   NEXT
1550   FOR J3=1 TO SL
1560    MID$(S$,J3,1)=WC$(ASC(MID$(OS$,J3,1))-64)
1570   NEXT
1580   RETURN
1590 '
1600 DATA 9,4,12,10,6,7,15,14,3,2,8,5
1610 DATA 30,4,50,16,10,16,35,7,40,16,15,13,45,13,20,16,25,7,40,10,30,16,20,10           ,30,10,35,13,25,13
