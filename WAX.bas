10 CLS : KEY OFF
11 WINDOW(-360,-173)-(360,173)
50 LENGTH=36
51 PI=3.1415926#
60 DIM ARROW(30)
100 LOCATE 2,1 : PRINT "You can use the ARROW key to move the "CHR$(24)
120 LOCATE 4,1 : PRINT "At the [ correct cell ], you can press one LETTER to change it."
125 LOCATE 6,1 : PRINT "  E - egg     L - larva    P - pupa    A - adult"
127 LOCATE 8,1 : PRINT "  N - new cell     B - break     X - empty"
130 GET(243,14)-(252,27),ARROW
150 LOCATE 12,1 : INPUT "Please to key in the [ NEST no.]";NESTNO
160 'open nest$ for output
500 'px,py
501 PX=0 : PY=0
510 CX=56*PX
520 CY=40*PY+(PX MOD 2)*20
530 BEGIN.X=CX-9
540 BEGIN.Y=CY-10
550 FOR I=0 TO 5
560   DEGREE=PI/3*I
570   END.X=LENGTH*COS(DEGREE)+BEGIN.X
580   END.Y=LENGTH*SIN(DEGREE)/1.68+BEGIN.Y
590   LINE(BEGIN.X,BEGIN.Y)-(END.X,END.Y)
600   BEGIN.X=END.X
610   BEGIN.Y=END.Y
620 NEXT
625 PRINT CX,CY
630 LOCATE 1,1 :INPUT PX,PY:GOTO 510
