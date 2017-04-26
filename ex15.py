#excercise 15
#open
#read

#getting arguments from command line 
from sys import argv

#assigning received arguments to variables created
script, filename = argv

print ("Type the filename again:")

#receive input - file name
file_again = input(">")

#open the file in our script
txt_again = open(file_again)

#read the file and print it
print (txt_again.read())

#open the file in our script
txt = open(filename)

print ("Here's your file %r:" %filename)
print (txt.read())
