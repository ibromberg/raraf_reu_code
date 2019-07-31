MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:n=0  $ void outside sphere
2  200 -0.001225 -10 #3  imp:n=1  $ air inside sphere
3  100 -1.0      -20 imp:n=1

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rcc 0 5 0   0 1 0   3

c                     --- DATA CARDS ---
mode n
c  - MATERIALS -
m100 006012.50c -0.6113 008016.70c -0.222 001001.70c -0.1167 005011.70c -0.05
m200 007014.80c -0.78  008016.80c -0.22              $ air - 78 N, 22 O
c   mesh tally block start-------
tmesh
cmesh3 total
cora3 0 98i 0.75   $ radial mesh
corb3 0 98i 1.0    $ z axis of cylinder
corc3 360          $ degrees around the z axis
c   mesh tally block end---------
endmd
c  - SOURCES -
sdef pos=0 0 0 axs=0 1 0 ext=0 rad=d1 par=1 erg=0.1 vec=0 1 0 dir=d1 
si1 0 0.75                             $ radial sample from 0 to rmax=0.75cm
sp1 -21 1                             $ radial sample weighting
si2 -1 0.766 1 $ histogram for cosine bin limits
sp2 0 0.95 0.05 $ frac soid angl for each bin
sb2 0. 0. 1. $ source bias for each bin
c  - TALLYING -
*f1:n 20.2 
E1 0.001 99i 0.1  $ tally energy
print 110
prdmp 2j 1
nps 1e6