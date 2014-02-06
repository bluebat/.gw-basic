10 '************************
20 '*                      *
30 '*    BIG  OR  SMALL    *
40 '*                      *
50 '*        J.W.L         *
60 '*                      *
70 '************************
80 CLS : B0$="" :S0$=""
90 FOR I=1 TO 10:B0$=B0$+CHR$(219)+CHR$(29)+CHR$(31):NEXT I
100 FOR J=1 TO 10:S0$=S0$+CHR$(32)+CHR$(29)+CHR$(31):NEXT J
110 RANDOMIZE VAL(RIGHT$(TIME$,2))
120 '
130 LOCATE 2,10
140 INPUT "How many digits do you want";W
150 NUM=INT(RND*10^W)
160 IF NUM<=10^(W-1) THEN 150
170 PRINT
180 PRINT"Press any key to begin "STRING$(5,249):Z$=INPUT$(1)
190 T=0:SOUND 575,3
200 TIME$="00:00:00"
210 '
220 G$=INPUT$(W):GUE=VAL(G$)
230 T=T+1
240 IF GUE>NUM THEN SOUND 900,3:E$=B0$
250 IF GUE<NUM THEN SOUND 200,3:E$=S0$
260 IF GUE=NUM THEN 290
270 LOCATE 7,40:PRINT E$;STRING$(10,29);STRING$(6,30);STRING$(20,219):GOTO 220
280 '
290 M=VAL(MID$(TIME$,4,2)):S=VAL(RIGHT$(TIME$,2))
300 TIME=60*M+S
310 LOCATE 16,27:PRINT"TIME--";TIME;"seconds   ";T;"TIMES"
320 PLAY"O2G8C16C16MLD8C8P8MSD#8G8"
330 PRINT:PRINT:PRINT
340 PRINT"Do you like to play again(Y/N)?":D$=INPUT$(1)
350 IF D$="Y" OR D$="y" THEN CLS:GOTO 130
360 END
