x = ("there are %d types of people." %10)
binary = ("binary")
do_not = ("don't")
y = ("those who know %s and those who %s" %(binary,do_not))

print (x)
print (y)
print ("I said %r" %x)
print ("I said '%s'." %y)

hilarious = False
joke_evaluation = ("isnt that joke so funny? %r")
print (joke_evaluation %hilarious)

w = ("This is the left side of ...")
e = ("a sting with the right side")

print (w+e)
kums = ("hi i am kumar %r")
print (kums %hilarious)