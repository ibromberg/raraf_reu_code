MCNP(X) Input File
c                     --- CELL CARDS ---
1  0              10             imp:p,e=0  $ void outside sphere
4  300 -0.001225 -10 #2 #3 #5 #6 imp:p,e=1  $ air inside sphere
2  100 -1.0      -20             imp:p,e=1  $ H2O inside box 
3  200 -19.3     -30             imp:p,e=1  $ W inside wedge
5  400 -2.7      -40             imp:p,e=1  $ Al inside box
6  500 -8.96     -50             imp:p,e=1  $ Cu inside box

c                     --- SURFACE CARDS ---
10 sph 0 0 0 200                    $ sphere of radius 2m centered on 0,0,0
20 rpp 0 100 0 100 0 10                            $ 100x100x1cm box of H2O
30 wed 50 50 77.32 0 -10 0 0 0 -17.32 10 0 0       $ wedge of W
40 rpp 40 70 30 60 55 55.1                     $ 1mm box of Al 
50 rpp 40 70 30 60 54.95 55                    $ 0.5mm box of Cu below Al

c                     --- DATA CARDS ---
mode p e                                 $ track photons and electrons  
cut:p j 0.001                            $ cut photons and electrons at 1keV
cut:e j 0.001
c  - MATERIALS -
m100 1000 2 8000 1                       $ water - H2O
m200 74000 1                             $ tungsten (W)
m300 7000 -0.78  8000 -0.22              $ air - 78 N, 22 O
m400 13000 1                             $ aluminum (Al)
m500 29000 1                             $ copper (Cu)
c  - SOURCES -
sdef pos=55 0 70 axs=0 1 0 ext=0 rad=d1 par=3 erg=0.1 vec=0 1 0 dir=1  
si1 0 0.4                             $ radial sample from 0 to rmax=4mm=0.4cm
sp1 -21 1                             $ radial sample weighting
c  - TALLYING -
*f1:p 20.5  $ photon tally top of box
E1 0.001 99i 0.1  $ tally energy
print 110
prdmp 2j 1
nps 1e7   
