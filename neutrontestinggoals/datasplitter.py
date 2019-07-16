"""
IBromberg

Script to take MCNP output binned the same as the IND spectrum and format it
for graphing.
"""

# open data file to process
with open('step4/1inchdata','r') as f:
    readData=f.read()
f.closed

# split the data string into a list where each value is an element
splitData = readData.split()

# print all but the first and last values twice; this creates the same bins
# as the IND spectrum.
for j in range(0,len(splitData)):
    if j == 0:
        print(splitData[j])
    elif j == len(splitData)-1:
        print(splitData[j])
    else:
        print(splitData[j])
        print(splitData[j])
    