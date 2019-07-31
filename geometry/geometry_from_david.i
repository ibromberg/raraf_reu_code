MCNP(X) Input File
c   ======================================
c   Testing of Neutron collimator
c
c
c   Change to IND spectrum instead of previous neutron spectrum
c
c   used this model instead of models with notches because didn't see effect from those
c
c   modified 180222_neutron to get this
c   * 180622 change source to be at 10 cm instead of 19
c   * 180625 changed source cone angle back to what I had it for previous tests
c      because souce is closer
c   * made source at 11 cm instead of 10 to match previous tests
c   * 0831 moved source laterally to see how being misaligned changed dose distribution
c   * also reduced particle count to 3*10^7 for quicker calc
c   * 0907 moved source back to center
c   * 0907 made source 1.5 cm in diameter
c   ======================================
c   CELL CARDS ---------------------------
1   0 300               imp:n,p,e=0  $universe, void outside
2   1 -0.001205 -300 #4 #5 #6   imp:n,p,e=1  $air, inside universe, outside pieces
c
c  test block of borated-PE
c 3   20 -1.07 -26 imp:n,p,e=1  $air, inside universe, outside pieces
c
c mouse water phantom
4   21 -1.0 -27 imp:n,p,e=1
c
c 
c wedges of shielding
5   20 -1.07 -30 32 imp:n,p,e=1
6   20 -1.07 -31 33 imp:n,p,e=1
c
c
c 5   14 -1.044 -26 25 imp:p,e=1 $ TE material, inside tissue, outside helium
c 6   18 -0.0001786 -25 imp:p,e=1 $helium "balloon"

c   SURFACE CARDS-------------------------------
c   film-------
c 1   rpp  -10   10  -10   10  -.01   .01
c   universe sphere-----
300 so 100
c   tissue and helium
c 25  rcc -5 0 0 10 0 0 .5
c 26  rpp -5 5 -2 2 0 18 
c
c mouse water phantom
27  rpp -4.5 4.5 -1.25 1.25 -2.5 0
c
c wedge pieces of shielding
c 28 wed .5 -1.25 0  5 0 0   0 0 10  0 2.5 0
c 29 wed -.5 -1.25 0  -5 0 0  0 0 10  0 2.5 0
c
c =====base pieces of shielding
30 rpp -5 -.3 -1.25 1.25 0 10
31 rpp .3 5 -1.25 1.25 0 10
c
c  ----- inner wedge for fan out
32 wed -.3 -1.25 0  -.2 0 0 0 0 10  0 2.5 0
33 wed .3 -1.25 0  .2 0 0  0 0 10  0 2.5 0
c
c
c
c

c   DATA CARDS---------------------------------
mode n
PHYS:N 100 0 0 J J J 0 -1 J J J 0 0
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
m20  1001.80c -.1167 5010.80c -.0098 5011.80c -.0402 6000.80c -.6113 &
   8016.80c -.222
c
c   water for mouse phantom
m21 1001.80c -.111 8016.80c -.889
c
c   mesh tally block start-------
tmesh
rmesh3  total
c   x-axis mesh setup
cora3 -15 299i 15
c   y-axis mesh setup
corb3 -5 99i 5
c   z-axis mesh setup
corc3 -1 -.5
c
c   mesh tally block end---------
endmd
c      prdmp  NDP  NDM  MCT  NDMP  DMMP
c          NDP  = increment for tallies
c          NDM  = increment for dumping to RUNTPE file
c          MCT  = flag to write MCTAL file and for OUTP comparisons
c          NDMP = maximum number of dumps to RUNTPE file
c          DMMP = TFC entry interval
c SOURCE SPECIFICATION
SDEF   POS=0 0 11 AXS=0 0 1 EXT=0 RAD=d1 PAR=1 ERG=d2 VEC=0 0 -1 &
 DIR=d3 WGT=8.547
SI1 0 .75 $ radial sampling range: 0 to Rmax (=0.3cm)
SP1 -21 1 $ radial sampling weighting: r^1 for disk
SI2 H &
0.1345 &
0.2025 &
0.308 &
0.4595 &
0.5945 &
0.691 &
0.782 &
0.8915 &
1.036 &
1.265 &
1.625 &
2.07 &
2.35 &
2.7 &
3.54 &
4.395 &
4.845 &
5.675 &
6.895 &
7.8 &
8.62 &
9.525 &
10
SP2 D 0 &
0.01137381 &
0.27904470 &
0.13271497 &
0.09775336 &
0.05310720 &
0.03579534 &
0.02649461 &
0.02477526 &
0.08189420 &
0.06004594 &
0.05124866 &
0.00896193 &
0.03204284 &
0.02040707 &
0.01962439 &
0.01855563 &
0.03111172 &
0.01081059 &
0.00192424 &
0.00195195 &
0.00036150 &
0.00000009 
SI3 -1 0.874 1 $ histogram for cosine bin limits
SP3 0 0.883 0.117 $ frac. solid angle for each bin, for 40 degree cone
SB3 0. 0. 1. $ source bias for each bin
PRINT 110
c TALLY SPECIFICATION
c F6:n 3
prdmp  1e6 1e6 1 2 1e6
nps    3e7
