MCNP(X) Input File
c   ======================================
c   Testing of Neutron collimator
c   ======================================
c   CELL CARDS ---------------------------
1   0 300               imp:n,p,e=0  $universe, void outside
2   1 -0.001205 -300 26  imp:n,p,e=1  $air, inside universe, outside pieces
c
c  test block of b-PE
3   20 -1.07 -26 imp:n,p,e=1  $air, inside universe, outside pieces
c 5   14 -1.044 -26 25 imp:p,e=1 $ TE material, inside tissue, outside helium
c 6   18 -0.0001786 -25 imp:p,e=1 $helium "balloon"

c   SURFACE CARDS-------------------------------
c   film-------
c 1   rpp  -10   10  -10   10  -.01   .01
c   universe sphere-----
300 so 100
c   tissue and helium
25  rcc -5 0 0 10 0 0 .5
26  rpp -5 5 -2 2 -2 2 

c   DATA CARDS---------------------------------
mode n
PHYS:N 100 0 0 J J J 0 -1 J J J 0 0
c cut:e 1e20 0.001
c cut:p 1e20 0.001
c phys:e 25.0
c phys:p 25.0
c   DBCN card is used for changing the rnum seed
c   DBCN
c   idum(1): source specification within source.f subroutine
idum 4
c   idum(2): set equal to 1 for sampling checks
c   idum(3)-idum(19): currently unused
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
c   idum(20): 6 for IMRT source flag
     6
c   idum(21)-idum(23): currently unused
     0 0 0
c   idum(24)=1 for interpolation of dynamic sequencing
     0
c   idum(25)-idum(30): currently unused'
     0 0 0 0 0 0
c   rdum(1): used as interpval for Novalis subroutine
rdum 0.05
c   rdum(2)-rdum(4): currently unused
     0 0 0
c
c   material definitions
c   air
m1     7014.80c -0.755 8016.80c -0.232 18036.80c -0.013
c   Gafchromic film
c   EBT3 composition
c   NOTE: These are by atom % not weight percentage
c m5     1000 .383221 3000 .0006 6000 .440041 7000 .000378 &
c      8000 .174035 16000 .000142 11000 .000061 &
c      17000 .000101 13000 .001421
c   DW gammex tissue
c m14    1000 -0.081 6000 -0.672 7000 -0.024 8000 -0.199 &
c      17000 -0.001 20000 -0.023
c m16  74000  1       $ W tungsten
c m17  29000  1       $ Cu copper
c m18  4000  1       $ He helium
c   SWX-201HD high density borated polyethylene
m20  1001.80c -.117 5010.80c -.0098 5011.80c -.0402 6000.80c -.833
c   mesh tally block start-------
tmesh
rmesh3  total
c   x-axis mesh setup
cora3 -10 98i 10
c   y-axis mesh setup
corb3 -10 98i 10
c   z-axis mesh setup
corc3 -6 -5
c   mesh tally block end---------
endmd
c      prdmp  NDP  NDM  MCT  NDMP  DMMP
c          NDP  = increment for tallies
c          NDM  = increment for dumping to RUNTPE file
c          MCT  = flag to write MCTAL file and for OUTP comparisons
c          NDMP = maximum number of dumps to RUNTPE file
c          DMMP = TFC entry interval
c SOURCE SPECIFICATION
SDEF   POS=0 0 20 AXS=0 0 1 EXT=0 RAD=d1 PAR=1 ERG=d2 VEC=0 0 -1 DIR=1
SI1 0 5 $ radial sampling range: 0 to Rmax (=5cm)
SP1 -21 1 $ radial sampling weighting: r^1 for disk
SI2 H 0.08 &
0.1 &
0.12 &
0.14 &
0.16 &
0.18 &
0.2 &
0.22 &
0.24 &
0.26 &
0.28 &
0.3 &
0.32 &
0.34 &
0.36 &
0.38 &
0.4 &
0.42 &
0.44 &
0.46 &
0.48 &
0.5 &
0.52 &
0.54 &
0.56 &
0.58 &
0.6 &
0.62 &
0.64 &
0.66 &
0.68 &
0.7 &
0.75 &
0.8 &
0.85 &
0.9 &
0.95 &
1 &
1.05 &
1.1 &
1.15 &
1.2 &
1.25 &
1.3 &
1.35 &
1.4 &
1.45 &
1.5 &
1.55 &
1.6 &
1.65 &
1.7 &
1.75 &
1.8 &
1.85 &
1.9 &
1.95 &
2 &
2.05 &
2.1
SP2 D 0 &
0.006439775 &
0.008066875 &
0.011557673 &
0.010600824 &
0.010781868 &
0.012254395 &
0.012530535 &
0.012464196 &
0.014721679 &
0.012795563 &
0.012567462 &
0.018881095 &
0.019219652 &
0.02248529 &
0.017840261 &
0.019728795 &
0.020909823 &
0.025935893 &
0.021569944 &
0.023824486 &
0.021887587 &
0.025574134 &
0.026043081 &
0.031985804 &
0.027455152 &
0.029062645 &
0.028131612 &
0.027608744 &
0.020298394 &
0.021586937 &
0.018427507 &
0.020779106 &
0.018627504 &
0.017324909 &
0.01706805 &
0.018254634 &
0.017298438 &
0.017202035 &
0.014130511 &
0.014315803 &
0.017088964 &
0.014018748 &
0.012144919 &
0.013609931 &
0.01242302 &
0.01373738 &
0.012261911 &
0.013260916 &
0.013559278 &
0.01438737 &
0.013770386 &
0.013977899 &
0.015617744 &
0.015154026 &
0.012999155 &
0.014145544 &
0.014683444 &
0.011069118 &
0.003851577
PRINT 110
c TALLY SPECIFICATION
c F6:n 3
prdmp  1e6 1e6 1 2 1e6
nps    1e6
