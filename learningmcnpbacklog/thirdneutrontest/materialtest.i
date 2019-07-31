MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10       imp:n=0  $ void outside sphere
2  200 -0.001225 -10 #3  imp:n=1  $ air inside sphere
3  100 -1.07      -20 imp:n=1

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rpp -5 5   3 5.54   -5 5      $ 2.54cm=1in in z direction

c                     --- DATA CARDS ---
mode n
c  - MATERIALS -
m100 006012.50c -0.6113 008016.70c -0.222 001001.70c -0.1167 005011.70c -0.05
m200 007014.70c -0.78  008016.70c -0.22              $ air - 78 N, 22 O
c   mesh tally block start-------
tmesh
rmesh3 total
cora3 0 98i 100   $ x axis mesh
corb3 0 98i 100    $ y axis mesh
corc3 0 10          $ z axis mesh
endmd
c   mesh tally block end---------
c  - SOURCES -
sdef pos=0 0 0 axs=0 1 0 rad=d1 par=1 erg=0	.1 vec=0 1 0 dir=-0.67 
si1 0 0.75                             $ radial sample from 0 to rmax=0.75cm
sp1 -21 1                             $ radial sample weighting
c  - TALLYING -
*f1:n 20.3
E1 0.001 99i 0.1  $ tally energy
*f11:n 20.4
E11 0.001 99i 0.1  $ tally energy
print 110
prdmp 2j 1
nps 1e6