MCNP(X) Input File
c   --- CELL CARDS ---
1  0              10 imp:p,e=0  $ void outside sphere
4  300 -0.001225 -10 imp:p,e=1  $ air inside sphere
2  100 -1.0      -20 imp:p,e=1  $ H2O inside box 
3  200 -11.5     -30 imp:p,e=1  $ W inside wedge

c   --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rpp 0 100 0 100 0 10                            $ 100x100x1cm box of H2O
30 wed 50 50 77.32 0 -10 0 0 0 -17.32 10 0 0       $ wedge of W

c   --- DATA CARDS ---
mode p e                                 $ track photons and electrons
c PHYS:P 0.001 0 0 0 0 J 0               $ cutoff of photon energy at 1keV
c PHYS:E 0.001 0 0 0 0 1 1 1 1 0 0 J J 0.917 0   
cut:p j 0.001                            $ cut photons and electrons at 1keV
cut:e j 0.001
m100 1000 2 8000 1                                      $ h20
m200 74000 1                                            $ tungsten (W)
m300 7000 -0.78  8000 -0.22                             $ air - 78 N, 22 O
sdef pos=55 0 60 axs=0 1 0 rad=d1 erg=0.05 vec=0 0 1 dir=1        $ source
si1 0 0.4 $ radial sample from 0 to rmax=4mm=0.4cm
sp1 -21 1 $ radial sample weighting (?)
f1:p 20.5    $ tally photons from top of water box
f1:p 20.6    $ tally photons from bottom of water box
print 110
prdmp 2j 1
nps 1e6