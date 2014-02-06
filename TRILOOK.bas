10 '***********************
20 '*                     *
30 '*       TRILOOK       *
40 '*                     *
50 '*        J.W.L        *
60 '*                     *
70 '***********************
80 PRINT"      Press the  NUMLOCK  first,then input  THREE  words"
90 PRINT
100 PRINT"           1st     2:D  4:L  6:R  8:U  5:finish  0:end"
110 PRINT"           2nd     1:0.1 -------- 9:0.9  0:1  .:2 (for a step)"
120 PRINT"           3rd     -:------    *:- - - -    :          +:/^\"
130 PRINT
140 PRINT "Are you ready?(press any key when ready)" : D$=INPUT$(1)
150 X=0 : Y=300 : X0=X : Y0=Y
160 CLS
170 '
180 LOCATE 1,74 : PRINT X/30;INT((300-Y)/30*1.52)
190 C$=INPUT$(3)
200 M=VAL(LEFT$(C$,1)):N$=MID$(C$,2,1):L$=RIGHT$(C$,1)
210 IF M=0 THEN END
220 IF M=5 THEN 700
230 N=VAL(N$)
240 IF N$="." THEN N=20
250 IF N=0 THEN N=10
260 ON M/2 GOTO 270,280,290,300
270 Y=Y+30/1.52*N/10:GOTO 310
280 X=X-30*N/10     :GOTO 310
290 X=X+30*N/10     :GOTO 310
300 Y=Y-30/1.52*N/10:GOTO 310
310 IF L$="-" THEN LINE(X0,Y0)-(X,Y)
320 IF L$=" " THEN 350
330 IF L$="*" THEN GOSUB 370
340 IF L$="+" THEN 180
350 X0=X : Y0=Y
360 GOTO 180
370 '
380 LONG=SQR((X-X0)^2+(Y-Y0)^2)\3
390 XQ=X0 : YQ=Y0 : J=0
400 FOR I1=1 TO LONG
410 J=1-J
420 XP=(I1*X+(LONG-I1)*X0)/LONG : YP=(I1*Y+(LONG-I1)*Y0)/LONG
430 LINE(XQ,YQ)-(XP,YP),J
440 XQ=XP : YQ=YP
450 NEXT I1
460 RETURN
470 '
