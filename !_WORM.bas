10 INPUT "How long is the  WORM  ?( about 18 )  ",LENGTH
20 PRINT:INPUT "How wide is the  WORM  ?( about 4 )  ",WIDE
30 CLS
40 RANDOMIZE VAL(RIGHT$(TIME$,2))
50 DIM XC(LENGTH),YC(LENGTH)
60 XC(1)=360 : YC(1)=173
70 DIR=RND*6.28
80 TAIL=1
90 ON KEY(1) GOSUB 290
100 KEY(1) ON
110 KEY OFF
120 LOCATE 25,27:PRINT"Press  F1  to stop it !"
130 '
140 WTAIL=TAIL
150 TAIL=(TAIL MOD LENGTH)+1
160 CIRCLE(XC(TAIL),YC(TAIL)),WIDE,0,,,.66
170 CIRCLE(XC(TAIL),YC(TAIL)),1,1
180 CHANGE=RND
190 IF CHANGE<.5 THEN DIR=DIR+.1745 ELSE DIR=DIR-.1745
200 NEWX=(XC(WTAIL)+4*COS(DIR)) MOD 720
210 NEWY=(YC(WTAIL)+4*SIN(DIR)) MOD 332
220 IF NEWX<0 THEN NEWX=NEWX+720
230 IF NEWY<0 THEN NEWY=NEWY+332
240 XC(TAIL)=NEWX
250 YC(TAIL)=NEWY
260 CIRCLE(NEWX,NEWY),WIDE,1,,,.66
270 GOTO 140
280 '
290 KEY ON
300 LOCATE 1,1
310 END
