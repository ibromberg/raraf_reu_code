MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:n=0  $ void outside sphere
2  200 -0.001225 -10 #4 imp:n=1  $ air inside sphere
c 3  100 -1.07     -20       imp:n=1  $ inside entrance cell
4  100 -1.07     -30       imp:n=1  $ inside block water

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
c 20 rpp -15 15  11 12.27   -15 15      $ borated polyethylene
30 rpp -15 15   13.55 30 -15 15     $ water to collect dose

c                     --- DATA CARDS ---
mode n
c  - MATERIALS -
m100 006012.50c -0.6113 008016.80c -0.222 001001.80c -0.1167 005011.80c -0.05
m200 007014.80c -0.78  008016.80c -0.22              $ air - 78 N, 22 O
m300 1001.80c -0.1119  8016.80c -0.88810      $ water
c  - SOURCES -
SDEF POS=0 0 0 AXS=0 1 0 EXT=0 RAD=d1 PAR=1 ERG=0.01 VEC=0 1 0 DIR=d3 WGT=8.547
SI1 0 0.75 $ radial sampling range: 0 to rmax
SP1 -21 1 $ radial sampling weighting: r^1 for disk
SI3 -1 0.766 1 $ histogram for cosine bin limits, cos(0.766)=40deg
SP3 0 0.883 0.117 $ frac. solid angle for each bin, for 40 degree cone
SB3 0. 0. 1. $ source bias for each bin
c  - TALLYING -
f14:n 4
c DF14 IU=2 IC=20
c Fm14 2.7778E-4
E14 0 2.5e-8 0.01
print 110
prdmp 2j 1
nps 1e6