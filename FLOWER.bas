10 PI=3.14159
20 PRINT"R=L*(A+B*SIN(C*))*(D+E*COS(F*))"
30 INPUT"L?,A?,B?,C?,D?,E?,F";L,A,B,C,D,E,F
40 INPUT"(+PI/Between) Between=(2)";Q
50 INPUT "0 ~ N*PI";N
60 INPUT "FINE(5)";W
70 CLS
80 FOR T=0 TO N*PI STEP PI/360*W
90 R=L*(A+B*SIN(C*T))*(D+E*COS(F*T))
100 X1=360+R*COS(T)
110 X2=360+R*COS(T+PI/Q)
120 Y1=263-R*SIN(T)
130 Y2=263-R*SIN(T+PI/Q)
140 Y1=Y1/1.52:Y2=Y2/1.52:LINE(X1,Y1)-(X2,Y2)
150 NEXT T
160 GOTO 10
170 END
