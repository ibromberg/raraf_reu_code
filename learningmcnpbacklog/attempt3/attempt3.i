MCNP(X) Input File
c   --- CELL CARDS ---
c   cell# material# density surfaceList(1,2...) cellData(imp:..)
c   positive density means atom/barn-cm, negative means g/cm3
c   void means material#=0 and omit density
1 100 -6.06 -10 imp:n=1.   $ fill rect prism w czt dens 6.06 g/cm3
3 100 10.0 -30 imp:n=1.    $ fill sphere with czt and a new density
2 0 10 -20 imp:n=1.        $ void inside sphere outside rpp
5 0 20 imp:n=0.            $ void outside sphere

c   --- SURFACE CARDS ---
10  rpp -1. 1. 5. 6. -1. 1.  $ rect prism, x1 x2 y1 y2 z1 z2
20  so 50.                   $ sphere radius 50
30  so 20.

c   --- DATA CARDS ---
c   neutrons: m100 92238 1 8016 2 6000 .03 $ 238U,16O, and natural C
m100 48000 0.9 30000 0.1 52000 1.   $ define czt
c   SWX-201HD high density borated polyethylene
c m20  1001.80c -.1167 5010.80c -.0098 5011.80c -.0402 6000.80c -.6113 &
c 8016.80c -.222
mode n                 $ particles to follow/transport
sdef par=1 erg=1.00    $ source specification: Cs-137
si5 L -10 0 0 10 0 0   $ xyz coords of two point surfaces
sp5 0.75 0.25          $ relative strengths of each source
print                  $ how much info to print
prdmp 2j 1             $ print and dump control
nps 1e6                $ how long to run
