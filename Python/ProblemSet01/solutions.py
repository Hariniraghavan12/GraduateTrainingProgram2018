#1.Write a program that examines three variables—x, y, and z— and prints the largest 
#odd number among them. If none of them are odd, it should print a message to that effect.

list1=[]
oddlist=[]
for i in range(3):
    num=int(input("enter a number:"))
    list1.append(num)
for i in list1:
    if(i%2!=0):
        oddlist.append(i)
#print(oddlist)
if(oddlist!=[]):
    maxnum=max(oddlist)
    print(maxnum)
else:
    print("there are no odd numbers in the list")
    
    
    
#2.Python provides a built-in function called len that returns the length of a string,
#so the value of len('Cigna') is 5. Write a function named right_justify that takes a string named s as a parameter and prints
#the string with enough leading spaces so that the last letter of the string is in column 70 of the display.

def right_justify(s):
    print(s.rjust(70))
right_justify("Cigna")



#3.Write a program that asks the user to input 10 integers, and then prints the 
#largest odd number that was entered. If no odd number was entered, it should print a message to that effect.

list1=[]
oddlist=[]
for i in range(10):
    num=int(input("enter a number:"))
    list1.append(num)
for i in list1:
    if(i%2!=0):
        oddlist.append(i)
#print(oddlist)
if(oddlist!=[]):
    maxnum=max(oddlist)
    print(maxnum)
else:
    print("there are no odd numbers in the list")
    
    
#4.Practice using the Python interpreter as a calculator:

#a) The volume of a sphere with radius r is 4/3pr3. What is the volume of a sphere with radius 5?
#Hint: 392.7 is wrong!

import math
radius=int(input("enter the radius:"))
volume=(4.0/3.0)*(math.pi)*(radius**3)
print(volume)


#b) Suppose the cover price of a book is Rs.24.95, but bookstores get a 40% discount. Shipping costs
#Rs.3 for the first copy and 0.75p for each additional copy. What is the total wholesale cost for
#60 copies?

cp=24.95
copy1_shipping=3
additional_shipping=0.75
discount=24.95*.40
copy1=discount+copy1_shipping
add_copy=discount+0.75
copies=add_copy*59
total_copies=copies+copy1
print(total_copies)


#5.Write a program that asks the user to enter an integer and prints two integers, root and pwr, such that 0 < pwr < 6 and
#root**pwr is equal to the integer entered by the user.
#If no such pair of integers exists, it should print a message to that effect.

num=int(input("enter a number:"))
for i in range(1,6):
    root=num**(1/float(i))
    if(int(root)**i==num):
        pwr=i
        print("root is:",root)
        print("pwr is:",pwr)
        
#6.Let s be a string that contains a sequence of decimal numbers separated by commas, e.g., s = '1.23,2.4,3.123'. 
#Write a program that prints the sum of the numbers in s.

list1=[]
numlist=[]
sum=0
string1 = '1.23,2.4,3.123'
list1=string1.split(",")
for i in list1:
    numlist.append(float(i))
for i in numlist:
    sum=sum+i
print(sum)


#7.Write a function isIn() that accepts two strings as arguments and returns True if either string occurs anywhere in the other, 
#and False otherwise. Hint: you might want to use the built-in str operation in.

def isIn(str1,str2):
   # if(str1.find(str2)!=-1):
    if(str1 in str2 or str2 in str1):
        print("found!!")
    else:
        print("not found!!")

isIn("hari","harini")

#8.Implement a function that satisfies the specification. Use a try-except block.

def getRatios(vect1, vect2):
	"""Assumes: vect1 and vect2 are lists of equal length of numbers
	Returns: a list containing the meaningful values of
	vect1[i]/vect2[i]"""
  
 vect3=[]

def getRatios(vect1,vect2):
    for i in range(0,len(vect1)):
       vect3.append( vect1[i]/vect2[i])
    return vect3
try:
    print(getRatios([1,2,3],[1,2,3]))
except:
    print("caught the exception")
else:
    print("working")
finally:
    print("finallyy")
    

#9.Assume that we execute the following assignment statements: width = 17 height = 12.0 delimiter = '.' For each of the following expressions, 
#write the value of the expression and the type (of the value of the expression).

width=17
height=12.0
delimiter='.'
print(width/2)
print(width/2.0)
print(height/3)
print(1+2*5)
print(delimiter*5)

Observe the Code Snippet
x = 25
epsilon = 0.01
numGuesses = 0
low = 0.0
high = max(1.0, x)
ans = (high + low)/2.0
while abs(ans**2 - x) >= epsilon:
print 'low =', low, 'high =', high, 'ans =', ans
numGuesses += 1
if ans**2 < x:
low = ans
else:
high = ans
ans = (high + low)/2.0
print 'numGuesses =', numGuesses
print ans, 'is close to square root of', x


#a. What would the code above return if the statement x = 25 were replaced by x = -25?

#x = 25
x=-25#infinite loop
epsilon = 0.01
numGuesses = 0
low = 0.0
high = max(1.0, x)
ans = (high + low)/2.0
while abs(ans**2 - x) >= epsilon:
    print 'low =', low, 'high =', high, 'ans =', ans
    numGuesses += 1
    if ans**2 < x:
        low = ans
    else:
        high = ans
    ans = (high + low)/2.0
print 'numGuesses =', numGuesses
print ans, 'is close to square root of', x


#b. What would have to be changed to make the code above for finding an approximation to the cube root of both negative and positive numbers? 
#(Hint: think about changing low to ensure that the answer lies within the region being searched.)

x=8
epsilon = 0.01
numGuesses = 0
low = 0.0
high = max(1.0, x)
ans = (high + low)/2.0
while abs(ans**3 - x) >= epsilon:
    print 'low =', low, 'high =', high, 'ans =', ans
    numGuesses += 1
    if ans**3 < x:
        low = ans
    else:
        high = ans
    ans = (high + low)/2.0
print 'numGuesses =', numGuesses
print ans, 'is close to cube root of', x
