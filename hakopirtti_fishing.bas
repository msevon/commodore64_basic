1 rem hakopirtti fishing game

5 print chr$(147)

10 rem --- intro ---
20 print "hakopirtti fishing"
30 for i = 1 to 2500: next i
40 print chr$(147)

50 rem --- jari sprite ---
60 poke 53285,0
70 poke 53286,7
80 poke 53269,3
90 for x=12800 to 12800+63: read y: poke x,y: next x
100 poke 53287,10
110 poke 2040,200
120 poke 53248,148
130 poke 53249,62
140 poke 53276, peek(53276) or 3
150 poke 53277, peek(53277) and 254
160 data 0,0,0,0,0,0,0,0,21,0,0,41,0,0,41,64
170 data 0,26,16,0,170,4,0,170,1,0,42,0,64,63,0,31
180 data 255,0,15,255,0,0,63,0,0,63,0,0,21,0,0,21
190 data 0,0,21,0,0,21,0,0,0,0,0,0,0,0,0,138

200 rem --- boat sprite ---
210 for x=12864 to 12864+63: read y: poke x,y: next x
220 poke 53288,11
230 poke 2041,201
240 poke 53250,160
250 poke 53251,73
260 poke 53276, peek(53276) or 12
270 poke 53277, peek(53277) and 253
280 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0
290 data 0,16,0,0,4,42,170,169,42,170,169,42,170,169,10,170
300 data 161,2,170,129,0,0,0,0,0,0,0,0,0,0,0,0
310 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,139

320 rem --- hook sprite ---
330 poke 53269,7
340 for x=12928 to 12928+63: read y: poke x,y: next x
350 poke 53289,3
360 poke 2042,202
370 hx = 136
380 hy = 180
390 poke 53252,hx
395 poke 53253,hy
400 poke 53276, peek(53276) or 16
410 poke 53277, peek(53277) and 251
420 prevbx = 160
430 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
440 data 0,0,0,0,0,0,20,0,0,20,0,0,60,0,0,20
450 data 0,0,60,0,0,20,0,0,20,0,0,0,0,0,0,0
460 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,131

500 rem --- movement loop ---
510 jx = 148 : bx = 160
520 jy = 60  : by = 71

530 print chr$(147)

535 rem --- draw water ---
536 for j = 1 to 3: print : next j
537 for i = 1 to 40: print "-";: next i
538 print

540 rem --- main loop ---
550 a = peek(197)
560 left = a and 1
570 right = a and 8
580 up = a and 2
590 down = a and 4

600 if left = 0 and bx > 16 then bx = bx - 3 : jx = jx - 3
610 if right = 0 and bx < 240 then bx = bx + 3 : jx = jx + 3

620 if up = 0 and hy > 0 then hy = hy - 3
630 if down = 0 and hy < 200 then hy = hy + 3

640 if bx < 16 then bx = 16 : jx = jx + (16-bx)
650 if bx > 240 then bx = 240 : jx = jx - (bx-240)

660 poke 53248,jx
670 poke 53250,bx

680 rem --- move hook horizontally relative to boat only ---
690 hx = hx + (bx - prevbx)
700 poke 53252,hx
710 poke 53253,hy

720 prevbx = bx
730 goto 540



10 rem fish sprite
40 poke 53285,0: rem multicolor 1
50 poke 53286,6: rem multicolor 2
60 poke 53269,255 : rem set all 8 sprites visible
70 for x=12800 to 12800+63: read y: poke x,y: next x: rem sprite generation
90 poke 53287,10: rem color = 10
100 poke 2040,200: rem pointer
110 poke 53248, 44: rem x pos
120 poke 53249, 120: rem y pos
130 poke 53276, 1: rem multicolor
140 poke 53277, 0: rem width
150 poke 53271, 0: rem height
1010 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1020 data 0,0,2,160,2,10,168,10,38,170,42,170,170,170,170,170
1030 data 170,42,170,42,10,168,10,2,160,2,0,0,0,0,0,0
1040 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,138
