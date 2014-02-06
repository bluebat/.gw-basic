10 '**********************************
20 '*                                *
30 '*          2D  eq. DRAW          *
40 '*                                *
50 '*             J.W.L              *
60 '*                                *
70 '**********************************
80 CLS
90 KEY OFF : ON KEY(14) GOSUB 480
100 LOCATE 10,25:PRINT "INPUT THE eq. OF X(t) AND Y(t) "
110 GOSUB 380
120 LOCATE 10,25:PRINT SPC(30)
130 LOCATE 5,10:PRINT "Do you wish ...."
140 LOCATE 7,15:INPUT "what the minimum in margin of the [ t ] is -- ",MINT
150 LOCATE 9,15:INPUT "what the maximum in margin of the [ t ] is -- ",MAXT
160 LOCATE 11,15:INPUT "what the delta in margin of the [ t ] is -- ",DT
170 LOCATE 14,15:INPUT "what the minimum of margin of the [ X ] is -- ",MINX
180 LOCATE 16,15:INPUT "what the maximum of margin of the [ X ] is -- ",MAXX
190 LOCATE 19,15:INPUT "what the minimum of margin of the [ Y ] is -- ",MINY
200 LOCATE 21,15:INPUT "what the maximum of margin of the [ Y ] is -- ",MAXY
210 LOCATE 24,10:PRINT "Press any key to begin .... :z$=input$(1)
220 '
230 '======= MAIN LOOP =======
240 CLS : KEY(14) ON
250 WINDOW (MINX,MINY)-(MAXX,MAXY)
260 LINE (MINX,0)-(MAXX,0) : LINE (0,MINY)-(0,MAXY)
270 PLACE=1
280 FOR T=MINT TO MAXT STEP DT
290  X=FNX(T) : Y=FNY(T)
300  IF X>MAXX OR X<MINX OR Y>MAXY OR Y<MINY THEN PLACE=1 : GOTO 320
310  IF PLACE=0 THEN LINE -(X,Y) ELSE PSET (X,Y) : PLACE=0
320 NEXT
330 BEEP
340 Z$=INPUT$(1)
350 GOTO 80
360 '======= loop end ======
370 '
380 '======= SET EQ =======
390 LOCATE 1,2:INPUT "X(t) = ",X$
400 LOCATE 2,2:INPUT "Y(t) = ",Y$
410 OPEN "2D.$$$" FOR OUTPUT AS #1
420 PRINT #1,"5000 DEF FNX(T)="+X$+CHR$(13)
430 PRINT #1," 5001 DEF FNY(T)="+Y$+CHR$(13)
440 PRINT #1," 5002 GOTO 120"+CHR$(13)
450 CLOSE
460 CHAIN MERGE "A:2D.$$$",5000
470 '====================
480 '
490 BEEP
500 Z$=INPUT$(1)
510 RETURN
