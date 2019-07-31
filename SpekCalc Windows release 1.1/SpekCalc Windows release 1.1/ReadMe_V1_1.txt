A Quick Guide To SpekCalc by Gavin Poludniowski
-----------------------

SpekCalc
--------

SpekCalc is an executable for calculating the x-ray emission spectra from 
tungsten anodes, such as those used in diagnostic radiology and kV 
radiotherapy x-ray tubes.

The theoretical approach was developed by Gavin Poludniowski and Phil Evans at
The Institute of Cancer Research, London, UK. It is described in two papers 
published in the journal Medical Physics [1,2].

The Graphical User Interface for SpekCalc was developed by Francois Deblois,
 Guillaume Landry and Frank Verhaegen at McGill University, Montreal, Canada.
It is described in a note published in the journal Physics in Medicine and Biology [3].

Software support is, unfortunately, not provided. Inquiries, regarding the 
theoretical model, may be directed to Gavin at G.Poludniowski@icr.ac.uk with
hope of reply. For inquiries regarding the GUI software you can try
Francois Deblois at fdeblois@jgh.mcgill.ca.


Disclaimer
----------

The executable designated "SpekCalc" is made available free of charge to the
"User" as a purely research tool. As such, there is no warranty of any kind, 
express or implied. As a research tool, SpekCalc should not be used in 
calculations for or affecting patients, or be used in any capacity such that
it affects the calibration of equipment to be used on patients. The 
responsibility for any risk incurred in the use of SpekCalc lies with the User.
Neither the authors nor any associated persons, organisations, or institutions,
accept any responsibility for the predictions of SpekCalc or for their 
accuracy. Further, SpekCalc is made freely available under the understanding 
that it will not be used for commercial purposes or in any commercial product.


The Parameters
--------------

T0 - This is the energy, in keV, of the electron beam impinging on the 
tungsten anode. The original range in which spectral predictions were tested 
was between 50 and 150 keV [1, 2]. Agreement has since been found at 
significantly higher energies. A suggested working range for T0 is therefore: 
40 < T0 < 300 keV.

hvMIN - This is the centre, in keV, of the minimum energy bin for which a 
spectral contribution is calculated. This is constrained by this 
implementation to satisfy: hvMIN > 0.1 T0 in keV. This limitation is not 
normally a problem since filtration typically makes the contributions
from the lowest energies negligable. 

Dhv - This is the bin width, in keV. This should be at least 0.5 keV.

th - This is the takeoff angle from the anode. A spectrum will be generated for 
arbitrary angle. However, below th ~ 6 deg. the prediction of characteristic 
radiation probably becomes increasingly unreliable. Further, above th ~ 30 deg.
the reliability of the whole model is untested.

t_AIR, t_BE, t_AL, t_CU, t_SN, t_W, t_Ta, t_Wa - These are thicknesses of filtration 
(Air, Beryllium, Aluminium, Copper, Zinc, Tungsten, Tantalum, Water) in mm.

Nf - This is an output normalisation factor. This can be adjusted to match the
predicted output (uGy/mAs @ 1m) to a measured output on particular tube. Nf 
is expected to be ~ 1. For example, the value Nf = 0.68 was found to describe 
one particular tube over a range of tube potentials [2].

P - This is a normalisation factor for the characteristic radiation, relative 
to the bremsstrahlung component. A value of 0.33 was found to work well for 
the examples examined [2]. Unless there is a very good reason for changing 
this factor, it should be kept at this value.


References
----------

[1] Med Phys. 2007 34(6):2164-74
[2] Med Phys. 2007 34(6):2175-86
[3] Phys Med Biol. 2009 54(19):433-38