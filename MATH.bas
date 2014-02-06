10 '*****************************
20 '*                           *
30 '*        MATHEMATICS        *
40 '*                           *
50 '*           J.W.L           *
60 '*                           *
70 '*****************************
80 KEY OFF
90 RANDOMIZE VAL(RIGHT$(TIME$,2))
100 CLS:R=0
110 PRINT SPC(20);"Press the NUMBER LOCK first !!";CHR$(31)
120 PRINT"1.[N+U+M]  2.[10^-NUM]  3.[NUM*2]  4.[NUM*5]  5.[NUM+ADD]  6.[NUM*3]"
130 PRINT
140 INPUT "Which one do you like";W
150 PRINT
160 INPUT "How many digits does the number have";M
170 PRINT
180 PRINT"Press any key to begin "STRING$(4,249):I$=INPUT$(1)
190 LOCATE 14,37:PRINT STRING$(M+5,196)
200 H=10^M : R0=INT(SQR(W*M)*40)
210 '__________ GAME __________
220 FOR K=1 TO 20
230 NUM=INT(RND*H)
240 ON W GOTO 250,260,270,280,290,310
250   NUM$=MID$(STR$(NUM),2) : A=0 :                                                  FOR I=1 TO M:A=A+VAL(MID$(NUM$,I,1)):NEXT I : GOTO 320
260   A=H-NUM:LOCATE 11,39:PRINT H:LOCATE 12,38:PRINT"-":GOTO 320
270   A=NUM*2:GOTO 320
280   A=NUM*5:GOTO 320
290   ADD=INT(RND*H):A=NUM+ADD
300 IF NUM<H/10 OR ADD<H/10 THEN 230 ELSE LOCATE 13,38:PRINT "+ "ADD:GOTO 320
310   A=NUM*3:GOTO 320
320 LOCATE 12,40:PRINT NUM;"  "
330 DEF SEG=0:POKE 1050,PEEK(1052)
340 TIME$="00:00:00"
350 ANS$=INPUT$(LEN(STR$(A))-1)
360 TIME=256*PEEK(1133)+PEEK(1132)
370 ANS=VAL(ANS$)
380 IF ANS=A THEN R=R+R0-TIME : SOUND 530,5
390 NEXT K
400 '__________ END __________
410 LOCATE 15,37 :PRINT "RECORD =";R
420 PLAY "T108 O3 C8 E4. C16 E16 G4. C16 G16 O4 C4."
430 LOCATE 19,28:PRINT"Do you like to play again(Y/N)?"
440 D$=INPUT$(1):IF D$="Y" OR D$="y" THEN 100
450 KEY ON:END
