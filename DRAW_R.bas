10 CLS : LOCATE 7,1
20 PRINT"*************************
30 PRINT"*                       *    [Home] N-W   [7] N   [Pg Up] N-E
40 PRINT"*      DRAW ROUGH       *    ["CHR$(27)"]   W"SPC(14)"[9]     E
50 PRINT"*                       *    [End] S-W    [8] S   [Pg Dn] S-E
60 PRINT"*         J.W.L         *
70 PRINT"*                       *    [Ins] END            [Del] UP-DOWN
80 PRINT"*************************
90 LOCATE 16,23:PRINT"Press any key to continue ═══":Z$=INPUT$(1)
100 KEY OFF
110 CLS
120 DIM P$(26):X=39:Y=12:N=-1:T=0
130 P$(1)="":P$(2)="":P$(3)="":P$(4)="":P$(5)="":P$(6)="":P$(7)="":          P$(8)="":P$(9)="":P$(10)="":P$(11)=CHR$(22):P$(12)="":P$(13)=""
140 LOCATE 25,1
150 FOR I=1 TO 13 : PRINT CHR$(64+I)" "P$(I)"   "; : NEXT
160 '__________ MOVE __________
170 X0=X:Y0=Y
180 LOCATE 1,3:PRINT N
190 A$=INKEY$
200 IF A$="" THEN 190
210 IF A$=CHR$(0)+CHR$(82) THEN 440                        '0
220 IF A$=CHR$(0)+CHR$(79) THEN X=X-1:Y=Y+1:GOTO 390       '1
230 IF A$=CHR$(0)+CHR$(80) THEN Y=Y+1:GOTO 390             '2
240 IF A$=CHR$(0)+CHR$(81) THEN X=X+1:Y=Y+1:GOTO 390       '3
250 IF A$=CHR$(0)+CHR$(75) THEN X=X-1:GOTO 390             '4
260 IF A$=CHR$(0)+CHR$(83) THEN N=-N:T=1:GOTO 170          '.
270 IF A$=CHR$(0)+CHR$(77) THEN X=X+1:GOTO 390             '6
280 IF A$=CHR$(0)+CHR$(71) THEN X=X-1:Y=Y-1:GOTO 390       '7
290 IF A$=CHR$(0)+CHR$(72) THEN Y=Y-1:GOTO 390             '8
300 IF A$=CHR$(0)+CHR$(73) THEN X=X+1:Y=Y-1:GOTO 390       '9
310 '__________ CHANGE __________
320 A=ASC(A$)
330 IF A<91 AND A>64 THEN D$=P$(A-64):GOTO 360
340 IF A<122 AND A>96 THEN D$=P$(A-96):GOTO 360
350 D$=A$
360 LOCATE 1,1:PRINT D$
370 GOTO 410
380 '__________ UP or DOWN __________
390 IF X<1 OR X>80 OR Y<1 OR Y>22 THEN X=X0:Y=Y0
400 IF N=-1 AND T<>1 THEN LOCATE Y0,X0:PRINT" " ELSE T=0
410 LOCATE Y,X:PRINT D$
420 GOTO 170
430 '__________ END __________
440 KEY ON
450 END
