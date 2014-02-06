10 '************************
20 '*                      *
30 '*     SOUND PROGRAM    *
40 '*                      *
50 '*        (j.w.l)       *
60 '*                      *
70 '************************
80 CLS
90 ON KEY(14) GOSUB 520
100 KEY(14) ON
110 PRINT"   Press "CHR$(25)" to stop it !!":PRINT
120 PRINT "  Choose one of the SUB-SOUNDs !!  (0 : STOP)  ":Z$=INPUT$(1)
130 Z=VAL(Z$):PRINT SPC(50);
140 ON Z GOTO 170,200,270,330,400,450
150 END
160 '
170 PRINT"-- Random noise --
180 SOUND RND(1)*300+440,RND(1)*RND(1):GOTO 180
190 '
200 PRINT"-- Bouncing --
210 FOR K=60 TO 1 STEP -2
220 SOUND 246.94-K/2,K/20
230 SOUND 32767,K/15
240 NEXT K
250 GOTO 120
260 '
270 PRINT"-- Falling --
280 FOR K=2000 TO 500 STEP -10
290 SOUND K,K/4000
300 NEXT K
310 GOTO 120
320 '
330 PRINT"-- Siren --
340 FOR L=650 TO -650 STEP -4
350 SOUND 780-ABS(L),.3
360 L=L-2/650
370 NEXT L
380 GOTO 340
390 '
400 PRINT"-- Hi-Lo alarm --
410 SOUND 987.7,5
420 SOUND 329.63,5
430 GOTO 410
440 '
450 PRINT"-- Motor --
460 FOR L=50 TO 60 STEP 10
470 SOUND L,.002
480 NEXT L
490 GOTO 460
500 '
510 '---------- RRETURN ----------
520 SOUND 575,0
530 RETURN 120
