MCNP(X) Input File
c   --- CELL CARDS ---
1   0            10   imp:p,n=0   $ outside of cylinder
2   100  -1.0   -10   imp:p,n=1   $ inside cylinder - density of 1g/cc 

c   --- SURFACE CARDS ---
10 rcc 0 0 0   0 0 50   10        $ right circular cylinder 
c 40 sq 1 1 1 0 0 0 -0.16 55 0 60                  $ circular source r2=0.16

c   --- DATA CARDS ---
m100 1001.60c -.1119 8016.60c -.8881        $ water: 2 hydrogen and 1 oxygen
mode p n                          $ transport photons and neutrons
f1:n 10.1                  $ tally: surface current neutrons over surf10 sides
sdef pos=0 0 1 par=1 $ source
print 110
prdmp 2j 1
nps 1e6