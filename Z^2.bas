10 '**********************
20 '*                    *
30 '*     Z^2=X^2+Y^2    *
40 '*                    *
50 '*        J.W.L       *
60 '*                    *
70 '**********************
80 CLS : K=0
90 DEFINT H-N
100 INPUT L1,L2 : L0=L1+L1*L2
110 DIM B(L0,3),A$(L0)
120 FOR I=1 TO L1
130   K=K+1
140   B(K,1)=I+I+1 : B(K,2)=2*I*I+I+I : B(K,3)=B(K,2)+1
150   FOR J=1 TO L2
160     K=K+1
170     B(K,1)=2*I*J : B(K,2)=ABS(I*I-J*J)
180     IF B(K,1)>B(K,2) THEN SWAP B(K,1),B(K,2)
190    B(K,3)=I*I+J*J
200  NEXT
210 NEXT
220 FOR M=1 TO L0-1
230   FOR N=1 TO L0-M
240     IF B(N,1)>B(N+1,1)                                                              THEN SWAP B(N,1),B(N+1,1):SWAP B(N,2),B(N+1,2):SWAP B(N,3),B(N+1,3)
250   NEXT
260 NEXT
270 FOR H=1 TO L0
280   IF (B(H,1)+B(H,2))\2=(B(H,1)+B(H,2))/2 THEN 320
290   IF (B(H,1)+B(H,2))\3=(B(H,1)+B(H,2))/3 THEN 320
300   IF B(H,2)=B(H-1,2) OR B(H,2)=B(H-2,2) OR B(H,1)=0 THEN 320
310   PRINT MID$(STR$(B(H,1)),2)+"+"+MID$(STR$(B(H,2)),2)+"="+                      MID$(STR$(B(H,3)),2)+"",
320 NEXT
