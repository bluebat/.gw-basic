10 '**********************************
20 '*                                *
30 '*        DRAWING A PICTURE       *
40 '*                                *
50 '*              J.W.L             *
60 '*                                *
70 '**********************************
80 KEY OFF:CLS
90 WINDOW (-360,-173)-(360,174)
100 DEF SEG=0 : POKE 1047,(PEEK(1047) OR 32)
110 DIM MOVE(9,2) : X=0 : Y=0 : UD=1 : B=0
120 FOR J=1 TO 9 : IF J=5 THEN 140
130 READ MOVE(J,1),MOVE(J,2)
140 NEXT J
150 B$="[+]-20 steps  [0]-CIRCLE  [*]-paint  [Enter]-GET  [ ]-CLEAR  [.]-END"
160 LOCATE 25,10 : PRINT B$
170 X0=X:Y0=Y
180 LOCATE 1,55:PRINT "("X;Y")";: LOCATE 1,73:PRINT USING "+#";UD;:PRINT"   "B
190 A$=INKEY$:IF A$="" THEN 190
200 N=VAL(A$): MX=MOVE(N,1): MY=MOVE(N,2) : X=X+MX+B*MX*19 : Y=Y+MY+B*MY*19
210 PSET (X,Y) : IF UD=-1 AND LEAVE=0 THEN PRESET (X0,Y0) ELSE LEAVE=0
220 IF A$="0" THEN 320          'circle
230 IF A$="*" THEN 380          'paint
240 IF A$=CHR$(13) THEN 450     'get a picture
250 IF A$=" " THEN ERASE MOVE : GOTO 110         'kill all
260 IF A$="5" THEN UD=-UD : LEAVE=1 : X0=0 : Y0=0 : GOTO 180   'pen up or down
270 IF A$="." THEN KEY ON : END
280 IF A$="+" THEN B=1-B : GOTO 180      '20 steps at one time
290 'N=VAL(A$): mx=move(n,1): my=move(n,2) : X=X+Mx+b*mx*19 : Y=Y+My+b*my*19
300 'pset (x,y) : IF UD=-1 AND LEAVE=0 THEN PRESET (X0,Y0) ELSE LEAVE=0
310 GOTO 170
320 '___________ circle __________
330 LOCATE 2,1 : PRINT SPC(80)
340 LOCATE 2,10: INPUT ;"R = ",R : INPUT ;"   aspect = ",A
350 IF A=0 THEN A=.66
360 CIRCLE (X,Y),R,,,,A
370 GOTO 170
380 '__________ paint __________
390 PRESET(X,Y)
400 LOCATE 2,1 : PRINT SPC(80) : LOCATE 2,1
410 INPUT "Press in 8-digits numbers (useing 0 or 1 ) to show the way --- ",P$:     IF LEN(P$)<>8 THEN BEEP:BEEP:GOTO 400
420 P=0 : FOR I=1 TO 8 : P=P+VAL(MID$(P$,I,1))*2^(I-1) : NEXT
430 PAINT(X,Y),CHR$(P)
440 GOTO 170
450 '__________ get __________
460 INPUT "FILENAME = ",NAME$ : OPEN NAME$ FOR OUTPUT AS #1
470 LOCATE 1,1:PRINT SPC(80):LOCATE 2,1 : INPUT "Press in X1,Y1,X2,Y2 ";X1,Y1,X2,Y2;
480 LONG%=(4+INT((X2-X1+7)/8)*(Y1-Y2))\2-1
490 DIM A%(LONG%)
500 GET (X1,Y1)-(X2,Y2),A%
510 FOR I=0 TO LONG% : WRITE #1,A%(I) : NEXT
520 SOUND 575,5
530 GOTO 170
540 '
550 DATA -1,-1,0,-1,1,-1,-1,0,1,0,-1,1,0,1,1,1
