10 '**********************
20 '*                    *
30 '*        PIANO       *
40 '*                    *
50 '*        J.W.L       *
60 '*                    *
70 '**********************
80 G=5
90 T0=10
100 '8,25,
110 CLS:KEY OFF
120 DIM V$(20),F(20)
130 DEF SEG=0
140 KEY 1,"G":KEY 2,"A"
150 PRINT SPC(30);"Press SPACE to end.
160 PRINT CHR$(14);" ";CHR$(14);" ";CHR$(14):LOCATE 3,1
170 D$=CHR$(25) : U$=CHR$(24)
180 KEYBOARD$="GA`1234567890-=\\"
190 '======================================
200 FOR J=1 TO 17
210   READ V$(J),F(J)
220   IF J<4 THEN V$(J)=D$+V$(J)
230   IF J>10 THEN V$(J)=U$+V$(J)
240 NEXT
250 DATA G,392,A,440,B,493.88,C,523.25,D,587.33,E,659.26,F,698.46,G,783.99,A,880         ,B,987.77,C,1046.5,D,1174.7,E,1318.5,F,1396.9,G,1568,A,1760,B,1975
260 '
265 POKE 1050,PEEK(1052)
270 K$=INKEY$
280 IF T=T0 THEN T=0 : SOUND 575,0
290 IF K$="" THEN T=T+1 : GOTO 270
300 POKE 1050,PEEK(1052)
310 T=0
320 IF K$=OK$ THEN G=50: GOTO 370
330 SOUND 575,0
340 OK$=K$
350 IF K$=" " THEN 400
360 KN=INSTR(KEYBOARD$,K$)
370 SOUND F(KN),G
380 PRINT V$(KN);" ";
390 GOTO 270
400 '__________ END __________
410 KEY 1,CHR$(27)+"LIST ":KEY 2,"FILES "+CHR$(34)+"*.BAS"+CHR$(34)+CHR$(13)
420 KEY ON:END
