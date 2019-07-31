MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:n=0  $ void outside sphere
2  200 -0.001225 -10 #3  imp:n=1  $ air inside sphere
3  300 -1.0      -20 imp:n=1

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rcc 0 5 0   0 1 0   3

c                     --- DATA CARDS ---
mode n
c  - MATERIALS -
c m100 006012.50c -0.6113 008016.70c -0.222 001001.70c -0.1167 005011.70c -0.05
m200 007014.80c -0.78  008016.80c -0.22              $ air - 78 N, 22 O
m300 001001.80c -0.66  008016.80c -0.34   $water
c   mesh tally block start-------
tmesh
cmesh3 total
cora3 0 98i 0.75   $ radial mesh
corb3 0 98i 1.0    $ z axis of cylinder
corc3 360          $ degrees around the z axis
c   mesh tally block end---------
endmd
c  - SOURCES -
sdef pos=0 0 0 axs=0 1 0 rad=d1 par=1 erg=d2 vec=0 1 0 dir=1
si1 0 0.75                             $ radial sample from 0 to rmax=0.75cm
sp1 -21 1                             $ radial sample weighting
si2 h 0.1345 &
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
sp2 d 0.00000000 &
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

c  - TALLYING -
*f1:n 20.2 
E1 0.001 99i 0.1  $ tally energy
print 110
prdmp 2j 1
nps 1e6