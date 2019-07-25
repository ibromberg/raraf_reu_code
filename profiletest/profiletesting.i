MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:p=0  $ void outside sphere
2  200 -0.001225 -10 #3    imp:p=1  $ air inside sphere
3  100 -1.07     -20       imp:p=1  $ inside 

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rpp -15 15  10 111.6  -15 15      $ borated polyethylene

c                     --- DATA CARDS ---
mode p
c  - MATERIALS -
m100 6000 -0.6113 8000 -0.222 1000 -0.1167 5000 -0.05
m200 7000 -0.78  8000 -0.22              $ air - 78 N, 22 O
c  - SOURCES -
SDEF POS=0 0 0 AXS=0 1 0 EXT=0 RAD=d1 PAR=2 ERG=7.8 VEC=0 1 0 DIR=1 WGT=8.547
SI1 0 0.75 $ radial sampling range: 0 to rmax
SP1 -21 1 $ radial sampling weighting: r^1 for disk 
c  - TALLYING -
f1:p 20.3 20.4
E1 0 9i 10
print 110
prdmp 2j 1
nps 1e7