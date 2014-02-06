10 '************************
20 '*                      *
30 '*     BRIDGE  CARD     *
40 '*                      *
50 '*         J.W.L        *
60 '*                      *
70 '************************
80 DIM NAM$(13)
90 CLS
100 KEY OFF
110 '
120 NAM$(1)=" A"
130 FOR I=2 TO 9 : NAM$(I)=STR$(I) : NEXT
140 NAM$(10)="10" : NAM$(11)=" J" : NAM$(12)=" Q" : NAM$(13)=" K"
150 '
160 LOCATE 1,1
170 INPUT "COLOR(1-H,2-D,3-C,4-S) , NAME(1--13)  ";C,N
180 INPUT "X(1--50),Y(1--14) ";X,Y
190 BACK$=STRING$(15,29)+CHR$(31)
200 SPA$=CHR$(186)+SPACE$(13)+CHR$(186)+BACK$ :'SPA$=SPA$+SPA$
210 DEF FNCC$(C,W)=CHR$(186)+SPACE$(W)+CHR$(C+2)+SPACE$(12-W)+CHR$(186)+BACK$
220 DEF FNCN$(N)=CHR$(186)+SPACE$(5)+NAM$(N)+SPACE$(6)+CHR$(186)+BACK$
230 DEF FNCS$(W)=CHR$(200+W)+STRING$(13,205)+CHR$(188-W)+BACK$
240 '**FNCARD$(C,N)=FNCS$(1)+FNCC$(C,1)+SPA$+FNCN$(N)+SPA$+FNCC$(C,10)+FNCS$(0)
250 '
260 LOCATE Y,X
270 PRINT FNCS$(1);FNCC$(C,1);SPA$;SPA$;FNCN$(N);SPA$;SPA$;FNCC$(C,11);FNCS$(0)
280 D$=INPUT$(1) : IF D$=" " THEN 160
290 KEY ON
