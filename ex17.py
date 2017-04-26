#exercise17
#copying from one file to another

#from sys import argv
from os.path import exists

#script, from_file, to_file = argv

from_file = input("give the name of file to copy from")
to_file = input("give the name of file to copy to")

print ("Copying from %s to %s " %(from_file, to_file))
#we could do these two on one line too how?

#open file and read
in_file = open(from_file)
indata = in_file.read()

print (" the input file is %d bytes long" %len(indata))
print ("Does the output file exist? %r " %exists(to_file))
print ("Read, hit Return to continue, CTRL-C to abort")

input()

#open with write permission and write
out_file = open(to_file, 'w')
out_file.write(indata)

print ("alright, all done")

#close all files
out_file.close()
in_file.close()