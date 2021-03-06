10 CLS : KEY OFF
20 PI=3.1415926#
30 LOCATE 1,1
40 INPUT "R(50);NL(10);S=(30);NR(INT(R/5))";R,NL,S,NRN : NR=INT(R/NRN)
50 INPUT "XC,YC=";XC,YC
60 'R=radius : NL=num of N-S : S=degree of axis(0-90) : NR=fine
70 DL=PI/NL : DR=PI/NR : S=PI*S/180
80 CS=COS(S) : SS=SIN(S)
90 CIRCLE(XC,YC),R
100 FOR I=1 TO NL-1
110   A=DL*I : N=INT(NR-ABS(.5-I/NL)*NR) : DD=PI/N
120   FOR J=0 TO N
130     B=DD*J : GOSUB 230
140 NEXT J,I
150 FOR I=NL TO 0 STEP -1
160   B=DL*I
170   FOR J=0 TO NR
180     A=DR*J : GOSUB 230
190 NEXT J,I
200 GOTO 30
210 END
220 '---------------------------------------------------
230 SA=R*SIN(A) : X=SA*COS(B) : Y=SA*SIN(B) : Z=R*COS(A)
240 IF Z*CS+X*SS<0 THEN J=NR : RETURN
250 H=XC+Y : V=YC-(Z*SS-X*CS)/1.5 : H1=XC*2-H : V1=V
260 IF J>0 THEN LINE -(H,V) ELSE PSET(H,V) : GOTO 280
270 LINE(H2,V2)-(H1,V1) : PSET(H,V)
280 H2=H1 : V2=V1 : RETURN
