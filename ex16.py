#exercise16
#reading and writing files
#close
#read
#readline
#truncate
#write(stuff)

from sys import argv
script, filename = argv

print ("We're going to erase %r" %filename)
print ("If you dont want that, hit CTRL-C (^C)")
print ("If you do want that, hit Return")

input ("?")

print ("Opening the file...")
target = open(filename, 'r')

print (target.read())

target = open(filename, 'w')

print ("truncating the file. Goodbye!")
target.truncate()

print ("Now I'm going to ask you for three lines")

line1 = input("line 1:\n")
line2 = input("line 2:\n")
line3 = input("line 3:\n")

print ("I'm going to write these to the file")

string = line1 +"\n"+ line2 + "\n" +line3
target.write(string)
#target.write(line1)
#target.write("\n")
#target.write(line2)
#target.write("\n")
#target.write(line3)
#target.write("\n")

print ("And finally, we close it")
target.close()
