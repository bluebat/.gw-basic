10 KEY OFF:CLS
20 OPEN"read_me.bat" FOR OUTPUT AS #1
30 PRINT #1,"echooff"
40 PRINT #1,"cls"
50 PRINT #1,"echo    this program allows you to adjust the typematicrate"
60 PRINT #1,"echo    and delay speed of the ibm at keyboard. to use type"
70 PRINT #1,"echo    in the following command:
80 PRINT #1,"echo";CHR$(32);CHR$(255)
90 PRINT #1,"echo       keybard (typematic rate)(delay)"
100 PRINT #1,"echo";CHR$(32);CHR$(255)
110 PRINT #1,"echo";CHR$(32);CHR$(255)
120 PRINT #1,"echo    the typematic rate is any letter between a and z"
130 PRINT #1,"echo    the typematic rate is adjustable from 30 to 2"
140 PRINT #1,"echo    characters per second.a is fastest,z is slowest,"
150 PRINT #1,"echo";CHR$(32);CHR$(255)
160 PRINT #1,"echo    the delay is any number between 1 and 4"
170 PRINT #1,"echo    delay is adjustable between.25 and 1.25 seconds"
180 PRINT #1,"echo    1 is the least delay,4 is the longest.
190 PRINT #1,"echo";CHR$(32);CHR$(255)
200 PRINT #1,"echo    example:keyboard m 3
210 PRINT #1,"echo";CHR$(32);CHR$(255)
220 PRINT #1,"echo    default for the at is .5 seconds of delay and"
230 PRINT #1,"echo    10 characters per second"
240 CLOSE #1
250 PRINT "creating keyboard.com"
260 TOTAL%=0
270 RESTORE:OPEN"keyboard.com" AS #2 LEN=1
280 FIELD #2,1 AS KEYBYTE$
290 FOR L%=1 TO 181
300 READ KEYDATA%
310 TOTAL#=TOTAL#+KEYDATA%
320 LSET KEYBYTE$=CHR$(KEYDATA%)
330 PUT #2
340 NEXT L%
350 IF TOTAL#=20323 GOTO 360 ELSE PRINT"eeror in data. check data entries and try again":END
360 CLOSE #2
370 PRINT"keyboard files created"
380 SHELL"read_me":LOCAET 20,1
390 DATA 190,   129,    0,      51,     219,    172,    60,     32
400 DATA 116,   251,    114,    38,     254,    200,    36,     223
410 DATA 44,    64,     115,    3,      78,     235,    6,      60
420 DATA 31,    119,    44,     134,    195,    172,    60,     32
430 DATA 116,   251,    114,    14,     44,     49,     114,    31
440 DATA 60,    3,      119,    27,     177,    5,      210,    224
450 DATA 10,    216,    176,    243,    232,    79,     0,      227
460 DATA 9,     134,    195,    232,    72,     0,      227,    2
470 DATA 205,   32,     186,    80,     1,      235,    3,      186
480 DATA 97,    1,      80,     9,      205,    33,     205,    32
490 DATA 104,   97,     114,    100,    119,    97,     114,    101
500 DATA 32,    101,    114,    114,    111,    114,    13,     10
510 DATA 36,    118,    97,     108,    105,    100,    32,     112
520 DATA 97,    114,    97,     109,    101,    116,    101,    114
530 DATA 115,   32,     97,     114,    101,    32,     65,     45
540 DATA 90,    44,     32,     116,    104,    101,    110,    32
550 DATA 49,    45,     52,     13,     10,     36,     250,    134
560 DATA 196,   51,     201,    228,    100,    168,    2,      224
570 DATA 250,   227,    32,     134,    196,    230,    96,     51
580 DATA 201,   228,    100,    168,    2,      224,    250,    227
590 DATA 18,    51,     201,    228,    100,    168,    1,      225
600 DATA 250,   227,    8,      228,    96,     60,     250,    116
610 DATA 2,     51,     201,    251,    195
