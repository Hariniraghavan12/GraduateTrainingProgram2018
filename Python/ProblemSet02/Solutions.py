#1.The greatest common divisor (GCD) of a and b is the largest number that divides both of them with no remainder. 
#One way to find the GCD of two numbers is based on the observation that if r is the remainder when a is divided by b, 
#then gcd(a, b) = gcd(b, r). As a base case, we can use gcd(a, 0) = a. Write a function called gcd that takes 
#parameters a and b and returns their greatest common divisor.

#Sol:
def gcd(a,b):
    if(b==0):
        return a
    else:
        return gcd(b,a%b)

a=int(input("enter first number:"))
b=int(input("enter second number:"))
ans=gcd(a,b)
print(ans)


#2.A number, a, is a power of b if it is divisible by b and a/b is a power of b. Write a function called is_power that 
#takes parameters a and b and returns True if a is a power of b. Note: you will have to think about the base case.

#Sol:
def is_power(a,b):
    c=a/b
    if((a%b==0) and (c%b==0)):
        return True
    else:
        return False
    
a=int(input("enter first num:"))
b=int(input("enter second num:"))
res=is_power(a,b)
if(res==True):
    print("{} is a power of {}".format(a,b))
else:
    print("{} is not a power of {}".format(a,b))
    

#3.Observe the following function definitions. They Calculate the Factorial as per the Mathematical 
#definition 1! = 1 (n + 1)! = (n + 1) * n! Implement factI(n) as an Iterative Implementation & factR(n) as a Recursive 
#Implementation

def factI(n):
	"""Assumes that n is an int > 0
	Returns n!
	Uses Iterative Implementation"""
	
def factR(n):
	"""Assumes that n is an int > 0
	Returns n!
	Uses Recursive Implementation"""
  
 #Sol:
 def factR(n):
    if(n==1):
        return n
    else:
        return n*factR(n-1)
def factI(n):
    fact=1
    while(n>0):
        fact= fact*n
        n=n-1
    return fact
n=int(input("enter a number:"))
c=raw_input("factorial using Recursion or Iteration:")
c.lower()
if(c=="rec"):
    print(factR(n))
elif(c=="iter"):
    print(factI(n))
else:
    print("enter a valid choice")


#4.Write a program that computes the decimal equivalent of the binary number 10011?

#Sol:
#method1
bin_no=raw_input("enter a number:")
sum=0
p=0
for i in range(len(bin_no)-1,-1,-1):
    sum=sum+(int(bin_no[i])*(2**p))
    p=p+1
print(sum)
#method2
num=raw_input("enter a number:")
num1=int(num)
sum=0
for i in range(len(num)):
    r=num1%10
    sum=sum+(2**i)*r
    num1=num1/10
print(sum)


#5.Implement a function that meets the specification below. Use a try-except block.

#def sumDigits(s):
	"""Assumes s is a string
	Returns the sum of the decimal digits in s
	For example, if s is 'a2b3c' it returns 5"""
  
#Sol:
sum=0
def sumDigits(s):
    for i in range(len(s)):
        if(s[i].isdigit()):
            sum=sum+int(s[i])
    return sum
s=raw_input("enter an alpha-numeric string:")
try:
    ans=sumDigits(s)
    print(ans)
except Exception:
    print("enter a valid alpha-numeric string")


#6.Implement a function that satisfies the specification. Use a try-except block.

#def findAnEven(l):
#	"""Assumes l is a list of integers
#	Returns the first even number in l
#	Raises ValueError if l does not contain an even number"""
  
#Sol:
def findAnEven(l):
    for i in l:
        if(int(i)%2==0):
            return i
        else:
            raise ValueError("there are no even numbers in the list")
num=raw_input("enter the input:")
l=list(num)
print(findAnEven(l))


#7.A palindrome is a word that is spelled the same backward and forward, like "Malayalam" and "Noon" . 
#Recursively, a word is a palindrome if the first and last letters are the same and the middle is a palindrome. 
#Write a function called is_palindrome that takes a string argument and returns True if it is a palindrome and False otherwise. 
#Remember that you can use the built-in function len to check the length of a string.

#def isPalindrome(s):
#	"""Assumes s is a str
#	Returns True if s is a palindrome; False otherwise.
#	Punctuation marks, blanks, and capitalization are
#	ignored."""
  
# Ensure you build a test function testIsPalindrome() that tests your palindrome function.

#Sol:
import string
def isPalindrome(s):
    str2=''
    for i in range(len(s)-1,-1,-1):
        str2=str2+s[i]
    if(s==str2):
        print("palindrome")
    else:
        print("not a palindrome")
def rem_punct(s):
    s1=''
    for c in s:
        if c in string.punctuation:
            s1=s.replace(c,'')
        return s1
s=raw_input("enter a string:")
s1=rem_punct(s)
isPalindrome(s1)


#8.The built-in function eval takes a string and evaluates it using the Python interpreter. For example:

#>>> eval('1 + 2 * 3')
#7
#>>> import math
#>>> eval('math.sqrt(5)')
#2.2360679774997898
#>>> eval('type(math.pi)')
#<type 'float'>

#Write a function called eval_loop that iteratively prompts the user, takes the resulting input and evaluates it using eval, 
#and prints the result. It should continue until the user enters 'done', and then return the value of the last expression 
#it evaluated.

#Sol:
s1=''
list1=[]
def eval_loop(s):
    try:
        s1=eval(s)
        list1.append(s1)
    except NameError:
        print("invalid expression")
while True:
    s=raw_input("enter a string:")
    if(s=='done'):
        print list1.pop()
        break
    else:
        eval_loop(s)
        
        
#9.One way of computing square roots is Newton’s method. Suppose that you want to know the square root of a. 
#If you start with almost any estimate, x, you can compute a better estimate with the following 
#formula: y = (x + a/x)/2 For example, if a is 4 and x is 3:

#>>> a = 4.0
#>>> x = 3.0
#>>> y = (x + a/x) / 2
#>>> print y
#2.16666666667

#a) Write a function NewtonSqrt() to abstract the Newton's Method of calculation Square roots.

#Sol:
def NewtonSqrt(num,iters):
    n=float(num)
    for i in range(iters):
        num=0.5*(num+n/num)
    return num

print(NewtonSqrt(2,100))






