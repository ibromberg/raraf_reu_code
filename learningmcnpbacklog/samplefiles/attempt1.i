c trying out some basic MCNP stuff 
c ------ cell cards i.e. defining where air and void are basically
c 8 0 -4 5 -6 IMP:N=0 IMP:P=1 $ inner void: negative wrt surf 4, pos wrt plane 5, neg wrt plane 6, to define cell 8, arbitrary number; IMP N and P for neutrons and protons, weight
c 7 5 -7.86 -1 2 -3 #8 IMP:N=0 IMP:P=1 $ iron cask shell; cell 7, material 5, density 7.86g/cm3, neg wrt surf 1, pos wrt surf 2, neg wrt surf 3, cannot be inside the void or cell 8 (# = not operator) - can replace with (4:6:-5) for efficiency
c 9 0 1:3:-2 IMP:N=0 IMP:P=0 $ graveyard - union of regions pos wrt to 1 and 3 and neg wrt 2. this is where path tracking ends
0 -18 IMP:P,N=1 $ inside cast
7 5 -7.86

c ------ surface cards - defining surfaces/volumes as in table 1 of primer
1 C/Z 5 5 10 $ outer cyl surf
4 C/Z 5 5 9 $ inner cyl surf
2 PZ 40 $ outer base
3 PZ 60 $ outer top
5 PZ 41 $ inner base
6 PZ 59 $ inner top

c ------ data cards - cuts, particles, material definitions, etc



