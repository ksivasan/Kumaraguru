#ex14
#prompting and passing

from sys import argv

script, user_name = argv
prompt =">>>>>"

print (" Hi %s, I am the %s script" %(user_name,script))
print (" I would like to ask you a few questions")
print ("Do you like me %s?" %user_name)
likes = input(prompt)

print ("where do you live %s?" %user_name)
lives = input(prompt)

print ("What kind of computer do you have")
computer = input(prompt)

print ("""
Alright so you said %s about liking me.
you live in %s. Not sure where that is.
And you have a %r computer. Nice.
""" %(likes, lives,computer))