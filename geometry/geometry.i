MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:n=0  $ void outside sphere
2  200 -0.001225 -10 #3 #4 #5 #6 #7 #8 #9 #10 imp:n=1  $ air inside sphere
3  300 -1.0     -20       imp:n=1  $ mouse
8  300 -1.0     -21       imp:n=1
9  300 -1.0     -22       imp:n=1
10 300 -1.0     -23       imp:n=1
4  100 -1.07     -30       imp:n=1  $ blocks
5  100 -1.07     -40       imp:n=1
6  100 -1.07     -50       imp:n=1  $ wedges
7  100 -1.07     -60       imp:n=1

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200               $ universe sphere, 2m
20 rpp -2 2  20 25  -5 -2.5      $ mouse phantom
21 rpp -2 2  20 25  -2.5 0     
22 rpp -2 2  20 25  0 2.5      
23 rpp -2 2  20 25  2.5 5      
30 rpp -3 3  10 19.5  -5.5 -0.5    $ blocks
40 rpp -3 3  10 19.5  0.5 5.5
50 wed -3 10 0.5  0 9.5 0  0 0 -0.45  6 0 0  $ wedges
60 wed -3 10 -0.5 0 9.5 0  0 0 0.45   6 0 0

c                     --- DATA CARDS ---
mode n
c  - MATERIALS -
m100 006012.50c -0.6113 008016.80c -0.222 001001.80c -0.1167 005011.80c -0.05
m200 007014.80c -0.78  008016.80c -0.22              $ air - 78 N, 22 O
m300 1001.80c -0.11190 8016.80c -0.8881              $ water
c   mesh tally block start-------
tmesh
rmesh1:n dose 20 2
cora1 -3 49i 3   $ x axis mesh
corb1 20 22    $ y axis mesh
corc1 -5 49i 5    $ z axis mesh
endmd
c   mesh tally block end---------
c  - SOURCES -
SDEF POS=0 0 0 AXS=0 1 0 EXT=0 RAD=d1 PAR=1 ERG=d2 VEC=0 1 0 DIR=d3 WGT=8.547
SI1 0 0.75 $ radial sampling range: 0 to rmax
SP1 -21 1 $ radial sampling weighting: r^1 for disk 
SI2 H 0.1345 &  
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
SP2 D 0.00000000 &   
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
SI3 -1 0.766 1 $ histogram for cosine bin limits, cos(0.766)=40deg 
SP3 0 0.883 0.117 $ frac. solid angle for each bin, for 40 degree cone  
SB3 0. 0. 1. $ source bias for each bin
c  - TALLYING -
f14:n 3
DF14 IU=2 IC=20
Fm14 2.7778E-4
E14 0 99i 10
fc14 neutron flux in mouse quarter 1
f24:n 8
DF24 IU=2 IC=20
Fm24 2.7778E-4
E24 0 99i 10
fc24 neutron flux in mouse quarter 2
f34:n 9
DF34 IU=2 IC=20
Fm34 2.7778E-4
E34 0 99i 10
fc34 neutron flux in mouse quarter 3
f44:n 10
DF44 IU=2 IC=20
Fm44 2.7778E-4
E44 0 99i 10
fc44 neutron flux in mouse quarter 4
print 110
prdmp 2j 1
nps 1e7