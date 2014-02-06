10 '************************
20 '*                      *
30 '*        PATTERN       *
40 '*                      *
50 '************************
60 SCREEN 2
70 DIM VERT%(120)
80 KEY OFF
90 CLS
100 INPUT "enter radius (range 10-170)";R
110 INPUT "enter number of vertices (range 3-50)";V
120 CLS
130 X0=360+R*1.5:Y0=170
140 PSET(X0,Y0)
150 THETA=6.28319/V:N=V-1
160 FOR I=1 TO N
170 VERT%(2*I-1)=R*1.5*COS(THETA*I)+360
180 VERT%(2*I)=R*SIN(THETA*I)+170
190 PSET(VERT%(2*I-1),VERT%(2*I)),1
200 NEXT I
210 N0=N
220 FOR J=1 TO N
230 FOR I= 1 TO N0
240 XN=VERT%(2*I-1):YN=VERT%(2*I)
250 LINE(X0,Y0)-(XN,YN)
260 NEXT I
270 X0=XN:Y0=YN:N0=N0-1
280 NEXT J
290 LOCATE 1,1
300 INPUT "Try another (Y/N)"; A$
310 IF A$="Y" OR A$="y" GOTO 90
320 CLS
330 END
