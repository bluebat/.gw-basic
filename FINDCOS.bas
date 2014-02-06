10 '******************************
20 '*                            *
30 '*      FIND  COEFFICIENTS    *
40 '*                            *
50 '*            J.W.L           *
60 '*                            *
70 '******************************
80 ' ======================
90 ' =  n2*n0  n0*  n3  =
100 '= ------------------ =
110 '=        n1*n0       =
120 '======================
130 CLS : KEY OFF
140 INPUT ;"n1,n2,n3,n0 = ";N1,N2,N3,N0
150 IF N1*N1+N2*N2+N3*N3+N0*N0=0 THEN 230
160 IF N1=0 OR N0=0 THEN 140
170 A=N1/2*N0
180 B=-N2*N0
190 C=(B*B-N0*N0*N3)/4/A
200 PRINT SPC(20);"F(X) =";A;"X"CHR$(253);
210 IF B>0 THEN PRINT " +";B;"X"; ELSE IF B<0 THEN PRINT " ";B;"X";
220 IF C>0 THEN PRINT " +";C ELSE IF C<0 THEN PRINT " ";C ELSE PRINT
230 PRINT : Z$=INPUT$(1) : IF Z$<>" " THEN 140
240 KEY ON : END
