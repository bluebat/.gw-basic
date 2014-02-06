10 CLS
20 V=VAL(MID$(TIME$,4,2))*VAL(RIGHT$(TIME$,2))
30 RANDOMIZE V
40 K=0 : T=0
50 INPUT"How many digits do you want to be guessed (>0)";N
60 IF N<=0 THEN 50
70 L=9*10^(N-1)
80 DIM D(L),D0(L),M(N),N(N)
90 FOR H=1 TO L
100 M=H-1+L/9 : D(H)=M
110 M$=MID$(STR$(M),2)
120 FOR I=1 TO N
130   M(I)=VAL(MID$(M$,I,1))
140   FOR J=SGN(I-1) TO I-1
150     IF M(J)=M(I) THEN 190
160   NEXT J
170 NEXT I
180 GOSUB 500      :'order
190 NEXT H
200 P=K
210 FOR I=1 TO P : D0(I)=D(I) : NEXT I
220 FOR I=1 TO P : D(I)=D0(I) : NEXT I
230 '__________ BEGIN __________
240 M=D(INT(RND*K))
250 GOSUB 540      :'seperate
260 FOR I=1 TO N : N(I)=M(I) : NEXT I
270 PRINT
280 PRINT"How about ";M;" ?";
290 INPUT "   Strike two numbers (?A,?B)  ",A0,B0
300 IF K=0 THEN 430
310 K0=K : K=0 : T=T+1
320 FOR H=1 TO K0
330 M=D(K) : GOSUB 540
340 A=0:B=0
350 FOR I=1 TO N
360   FOR J=1 TO N
370     IF N(I)=M(J) THEN IF I=J THEN A=A+1 ELSE B=B+1
380   NEXT J
390 NEXT I
400 IF A=A0 AND B=B0 THEN GOSUB 500
410 NEXT H
420 GOTO 230
430 '__________ END __________
440 PRINT T;"TIMES"
450 IF T=1 THEN PRINT"IT'S GOOD LUCK!"
460 PRINT
470 PRINT "Do you want to play again or harder(A/H/N)?" : D$=INPUT$(1)
480 IF D$="H" OR D$="h" THEN ERASE D,D0,M,N:GOTO 10 ELSE IF D$="A" OR D$="a"        THEN 220 ELSE END
490 '__________ ORDER __________
500 K=K+1
510 D(K)=D(H)
520 RETURN
530 '__________ SEPERATE __________
540 M$=MID$(STR$(M),2)
550 FOR G=1 TO N
560   M(G)=VAL(MID$(M$,G,1))
570 NEXT G
580 RETURN
