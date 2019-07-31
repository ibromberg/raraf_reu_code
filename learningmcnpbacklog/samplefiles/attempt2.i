MCNP(X) Input File
c   --- CELL CARDS ---
c   cell# material# density surfaceList(1,2...) cellData(imp:..)
c   positive density means atom/barn-cm, negative means g/cm3
c   void means material#=0 and omit density
1 100 -6.06 -10 imp:p,e=1.   $ fill rect prism w czt dens 6.06 g/cm3
2 0 10 -20 imp:p,e=1.        $ void inside sphere outside rpp
5 0 20 imp:p,e=0.            $ void outside sphere

c   --- SURFACE CARDS ---
10  rpp -1. 1. 5. 6. -1. 1.  $ rect prism, x1 x2 y1 y2 z1 z2
20  so 50.                   $ sphere radius 50

c   --- DATA CARDS ---
c   neutrons: m100 92238 1 8016 2 6000 .03 $ 238U,16O, and natural C
m100 48000 0.9 30000 0.1 52000 1.   $ define czt
mode p e                            $ particles to follow/transport
sdef par p erg 0.662                $ source specification: Cs-137
print 110                           $ how much info to print
prdmp 2j 1                          $ print and dump control
nps 10000                           $ how long to run
