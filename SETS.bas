10 INPUT "ao,bo,gap";AO,BO,GAP
20 CLS
25 WINDOW(1,1)-(-1,-1)
30 A=AO
40 FOR I=1 TO 100
50   A=A+GAP
60   B=BO
70   FOR J=1 TO 100
80     B=B+GAP
90     X=0 : Y=0
100     N=0
110     WHILE N<50 OR X*X+Y*Y <4
120       XX=X*X-Y*Y+A
130       Y=2*X*Y+B
140       X=XX
160       IF N=0 THEN PSET(X,Y) ELSE LINE (XO,YO)-(X,Y)
161 '      PSET(X,Y)
163       XO=X : YO=Y
165       N=N+1
170     WEND
180   NEXT
190 NEXT
200 KEY ON : END
