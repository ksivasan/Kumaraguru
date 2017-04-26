#excercise 19
def cheese_and_crackers(cheese_count, boxes_of_cracs):
	print ("u have %d cheeses!" %cheese_count)
	print ("you have %d boxes of crackers" %boxes_of_cracs)

print ("we can just give the function numbers directly")
#cheese_and_crackers(20,30)

#print ("Or, we can use variables from our script:")
#amount_of_cheese = 10
#amount_of_crackers = 50

#cheese_and_crackers(amount_of_cheese,amount_of_crackers)

#print("we can even do math inside too")
#cheese_and_crackers(10+20, 5+6)

#print("And we can combine the two, variables and math")
#cheese_and_crackers(amount_of_cheese+100, amount_of_crackers+1000)

a=int(input("give your number of cheese_and_crackers:  "))
b=int(input("give your number of boxes:  "))
cheese_and_crackers(a,b)
