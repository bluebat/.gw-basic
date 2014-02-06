10 '**********************
20 '*                    *
30 '*        PIANO       *
40 '*                    *
50 '*        J.W.L       *
60 '*                    *
70 '**********************
80 T0=25
90 '8,25,
100 CLS:KEY OFF
110 DEF SEG=0
120 KEY 1,"G":KEY 2,"A"
130 PRINT SPC(30);"Press SPACE to end.
140 PRINT CHR$(14);" ";CHR$(14);" ";CHR$(14):LOCATE 2,1
150 D$=CHR$(25) : U$=CHR$(24)
160 '__________ PLAY __________
170 V$=INKEY$
180 IF T=T0 THEN T=0 : SOUND 575,0
190 IF V$="" THEN T=T+1 : GOTO 170
200 POKE 1050,PEEK(1052)
210 IF V$=OV$ THEN B=3 ELSE B=9:SOUND 575,0
220 OV$=V$
230 T=0
240 IF V$="G" THEN V$=D$+"G":V=392    :GOTO 440
250 IF V$="A" THEN V$=D$+"A":V=440    :GOTO 440
260 IF V$="`" THEN V$=D$+"B":V=493.88 :GOTO 440
270 IF V$="1" THEN V$="C":V=523.25  :GOTO 440
280 IF V$="2" THEN V$="D":V=587.33 :GOTO 440
290 IF V$="3" THEN V$="E":V=659.26 :GOTO 440
300 IF V$="4" THEN V$="F":V=698.46 :GOTO 440
310 IF V$="5" THEN V$="G":V=783.99 :GOTO 440
320 IF V$="6" THEN V$="A":V=880    :GOTO 440
330 IF V$="7" THEN V$="B":V=987.77 :GOTO 440
340 IF V$="8" THEN V$=U$+"C":V=1046.5:GOTO 440
350 IF V$="9" THEN V$=U$+"D":V=1174.7:GOTO 440
360 IF V$="0" THEN V$=U$+"E":V=1318.5:GOTO 440
370 IF V$="-" THEN V$=U$+"F":V=1396.9:GOTO 440
380 IF V$="=" THEN V$=U$+"G":V=1568  :GOTO 440
390 IF V$="\" THEN V$=U$+"A":V=1760  :GOTO 440
400 IF V$="" THEN V$=U$+"B":V=1975.5:GOTO 440
410 IF V$=CHR$(27) THEN V$=U$+U$+"B":V=2093:GOTO 440
420 IF V$=" " THEN 480
430 GOTO 170
440 SOUND V,B
450 PRINT V$;" ";
460 GOTO 170
470 '__________ END __________
480 KEY 1,CHR$(27)+"LIST ":KEY 2,"FILES "+CHR$(34)+"*.BAS"+CHR$(34)+CHR$(13)
490 KEY ON:END
