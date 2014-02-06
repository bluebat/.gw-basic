10 '************************************
20 '**                                **
30 '**         MAGNETIC  LINES        **
40 '**                                **
50 '**              J.W.L             **
60 '**                                **
70 '************************************
80 CLS : KEY OFF
90 WINDOW(0,0)-(720,347)
100 PI=3.1415926#
110 DEF FNRL=1/((XO-RX)^2+(YO-RY)^2):DEF FNLL=1/((XO-LX)^2+(YO-LY)^2)
120 DEF FNRA=ATN((YO-RY)/(XO-RX)) : DEF FNLA=ATN((YO-LY)/(XO-LX))
130 RX=500:RY=173:LX=220:LY=173
140 INPUT "How many lines do you want ";DEO : DE=DEO/2+1
150 PRINT:INPUT "How fine do you want ?(smaller than 20) ",LEO
160 PRINT:INPUT "How wide are the poles ?(about 20) ",R
170 PRINT:INPUT " (+)(+) ...(0)  OR  (-)(+) ...(1) ";Q
180 IF Q<>0 AND Q<>1 THEN BEEP :GOTO 170
190 Q=Q*PI
200 CLS
210 CIRCLE(RX,RY),R,,,,.66 : CIRCLE(LX,LY),R,,,,.66
220 LOCATE 13,56:PRINT"+"
230 LOCATE 13,25:IF Q=0 THEN PRINT"+" ELSE PRINT"-"
240 LOCATE 1,1
250 '__________ LINES __________
260 FOR SIDE=1 TO 2
270  FOR A0=0 TO 2*PI STEP PI/DE
280   A=A0 : X=RX : Y=RY : L=R
290   GOSUB 550
300   XF=XX:YF=YY
310   '
320   XO=XF : YO=YF : LE=LEO
330    X=0 : Y=0 : L=FNRL
340    IF (XO-RX)>=0 THEN A=FNRA ELSE A=FNRA+PI
350    GOSUB 550:X1=XX:Y1=YY
360    X=0 : Y=0 : L=FNLL
370    IF (XO-LX)>=0 THEN A=FNLA+Q ELSE A=FNLA+PI+Q
380    GOSUB 550 : X2=XX : Y2=YY
390   XF=XO+SGN(X1+X2)*LE : YF=YO+ABS((Y1+Y2)*LE/(X1+X2))*SGN(Y1+Y2)
400   IF (XF<360 AND SIDE=1) OR (XF>360 AND SIDE=2) THEN LE=LE-2 ELSE 420
410    IF LE<1 THEN IF Q=0 THEN LINE(XO,YO)-(XO,173*(SGN(YO-173)+1)) : GOTO 470                ELSE 470    ELSE 390
420   IF ABS(YF-173)>200 THEN IF XO=360 OR XF=360 THEN CIRCLE(XO,YO),2,,,,.66 :                          PSET(XO,YO),0:GOTO 470   ELSE YF=YO+LE*SGN(Y1+Y2)
430   LINE(XO,YO)-(XF,YF)
440   IF XF>720 OR XF<0 OR YF>347 OR YF<0 THEN 470
450   GOTO 320
460   '
470  LOCATE 1,1
480  NEXT A0
490  SWAP RX,LX
500 NEXT SIDE
510 '__________ END __________
520 ON ERROR GOTO 0
530 KEY ON : END
540 '__________ VECTOR __________
550 XX=X+L*COS(A)
560 YY=Y+L*SIN(A)*.66
570 RETURN
