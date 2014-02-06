10 CLEAR
20 INPUT "X^2+B*Y^2+C*Z^2=D";B,C,D
40 INPUT "BZ,EZ,SZ";BZ,EZ,SZ
50 INPUT "HIGH";H
60 CLS
70 LINE (360,173)-(720,173):LINE (360,173)-(360,0):LINE (97,347)-(360,173)
80 DEF FNXP(ZP,A)=D-COS(A)*COS(A)-B*SIN(A)*SIN(A)-C*ZP*ZP
90 FOR ZP=BZ TO EZ STEP SZ
101 FOR A=0 TO 360 STEP 36
110   IF FNXP(ZP,A)<0 THEN 200
120   R=SQR(FNXP(ZP,A))
125 X0=R*COS(A)/1.5:YP=R*SIN(A)
140    Y0=YP-X0:Z0=ZP-X0
150    Y=360+Y0*H*1.52:Z=173-Z0*H
160    IF Y<0 OR Y>720 OR Z<0 OR Z>347 THEN 180
170    LINE -(Y,Z)
200 NEXT A
210 NEXT ZP
220 INPUT "1-ALTER   2-CHANGE   3-END (1/2/3)";Q
230 ON Q GOTO 30,10,240
240 END
