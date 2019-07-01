MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:n=0  $ void outside sphere
2  200 -0.001225 -10 #3  imp:n=1  $ air inside sphere
3  100 -1.07      -20 imp:n=1

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rpp -5 5   10 12.54   -5 5      $ 2.54cm=1in in z direction

c                     --- DATA CARDS ---
mode n
c  - MATERIALS -
m100 006012.50c -0.6113 008016.80c -0.222 001001.80c -0.1167 005011.80c -0.05
m200 007014.80c -0.78  008016.80c -0.22              $ air - 78 N, 22 O
c   mesh tally block start-------
tmesh
rmesh3 total
cora3 -7 98i 7   $ x axis mesh
corb3 10 12.45    $ y axis mesh
corc3 -7 98i 7    $ z axis mesh
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
SI3 -1 0.766 1 $ histogram for cosine bin limits
SP3 0 0.883 0.117 $ frac. solid angle for each bin, for 40 degree cone
SB3 0. 0. 1. $ source bias for each bin
c  - TALLYING -
*f1:n 20.3 
E1 0.001 99i 0.1  $ tally energy
*f11:n 20.4
E11 0.001 99i 0.1  $ tally energy
print 110
prdmp 2j 1
nps 1e6
