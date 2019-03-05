#1.A string slice can take a third index that specifies the "step size;" that is, the number of spaces between successive 
#characters. A step size of 2 means every other character; 3 means every third, etc.

#>>> fruit = 'banana'
#>>> fruit[0:5:2]
#'bnn'

#A step size of -1 goes through the word backwards, so the slice [::-1] generates a reversed string. 
#Use this idiom to write a one-line version of is_palindrome



#Sol:
def is_palindrome(string):
    rev_string=string[::-1]
    if(rev_string==string):
        print("palindrome")
    else:
        print("not a palindrome")
string=raw_input("enter a string:")
is_palindrome(string)

#2.Write a function called rotate_word() that takes a string and an integer as parameters, and that returns a new 
#string that contains the letters from the original string "rotated" by the given amount. 
#For example, "cheer" rotated by 7 is "jolly" and "melon" rotated by -10 is "cubed". 
#You might want to use the built-in functions ord, which converts a character to a numeric code, and chr, 
#which converts numeric codes to characters.

#Sol:
from __future__ import print_function
def rotate_word(string,num):
    for ch in string:
        nc=ord(ch)
        nc1=nc+num
        ch1=chr(nc1)
        print(ch1,end="")
string=raw_input("enter a string:")
num=int(input("enter a number:"))
rotate_word(string,num)


#3.In 1939 Ernest Vincent Wright published a 50,000 word novel called Gadsby that does not contain the letter "e." 
#Since "e" is the most common letter in English, that’s not easy to do. In fact, it is difficult to construct a solitary
#thought without using that most common symbol. It is slow going at first, but with caution and hours of training you can 
#gradually gain facility. All right, I’ll stop now. Write a function called has_no_e that returns True if 
#the given word doesn’t have the letter "e" in it.

#Sol:
def no_e(string):
    if(('e' in string)==True):
        print("contains 'e'")
    else:
        print("does not contain 'e'")

string=raw_input("enter a string:")
no_e(string)

    
#4.Modify the above program to print only the words that have no “e” and compute the percentage of the words in the 
#list have no “e.”

#Sol:
list1=[]
list2=[]
def no_e(list1):
    for i in list1:
        if(('e' not in i)==True):
            list2.append(i)
            length1=len(list1)
            length2=len(list2)
    print("words not containing e:{}".format(list2))
    percentage=(float(length2)/float(length1))*100
    print("{}%".format(int(percentage)))

n=int(input("enter no of words:"))
for i in range(0,n):
    inp=raw_input("enter string:")
    list1.append(inp)
no_e(list1)


#5.Write a function named avoids that takes a word and a string of forbidden letters, and that returns True if the word doesn’t use any of the 
#forbidden letters.

#Sol:
def avoids(word,forbidden):
    for i in range(len(forbidden)):
        if forbidden[i] in word:
            return True
        else:
            return False
word=raw_input("enter a word:")
forbidden=raw_input("enter forbidden letters as a string:")
if(avoids(word,forbidden)==False):
    print("does not contain")
else:
    print("contains")
            
       
#6.Modify your program to prompt the user to enter a string of forbidden letters and then print the number of words that
#don’t contain any of them. Can you find a combination of 5 forbidden letters that excludes the smallest number of words?

#Sol:
forb_list=[]
str2=''
list2=[]
count=0
def avoids(word,forb_list):
    for l in forb_list:
        if l not in word:
            list2.append(l)
            str2=''.join(list2)
            nl=str2.split()
    print(str2)
    print list2
    print len(nl)
word=raw_input("enter a word:")
forbidden=raw_input("enter a forbidden string:")
forb_list=forbidden.split(" ")
avoids(word,forbidden)


#7.Write a function named using_only() that takes a word and a string of letters, and that returns True if the word contains
#only letters in the list. Can you make a sentence using only the letters acefhlo? Other than "Hoe alfalfa?"

#Sol:
flag=0
def using_only(word,list_str):
    for i in word:
        if i in list_str:
            flag=1
        else:
            flag=0
            break
    if flag==1:
        return True
    else:
        return False
word_str=raw_input("enter a word:")
word_str.lower()
word_list=word_str.split(' ')
word=''.join(word_list)
#print word
string=raw_input("enter a string:")
string.lower()
list_str=list(string)
print(using_only(word,list_str))
    
    
 #8.Write a function called is_abecedarian that returns True if the letters in a word appear in alphabetical order 
 #(double letters are ok). How many abecedarian words are there? (i.e) "Abhor" or "Aux" or "Aadil" should return "True" 
 #Banana should return "False"
 
#Sol:
def abecedarian(word):
    flag=0
    for i in range(len(word)-1):
        if(word[i]>word[i+1]):
            flag=1
            break
    if(flag==1):
        return False
    else:
        return True

word=raw_input("enter a word:")
print(abecedarian(word))


#9.Write a function called is_sorted that takes a list as a parameter and returns True if the list is sorted in ascending 
#order and False otherwise. You can assume (as a precondition) that the elements of the list can be compared with the
#relational operators <, >, etc. For example, is_sorted([1,2,2]) should return True and is_sorted(['b','a']) should 
#return False.

#Sol:
def is_sorted(str_list):
    flag=0
    for i in range(len(str_list)-1):
        if(str_list[i]>str_list[i+1]):
            flag=1
            break
    if(flag==1):
        return False
    else:
        return True

string=raw_input("enter a string:")
str_list=list(string)
print(is_sorted(str_list))


#10.Two words are anagrams if you can rearrange the letters from one to spell the other. 
#Write a function called is_anagram that takes two strings and returns True if they are anagrams.

#Sol:
def is_anagram(string1,string2):
    str1_list=list(string1)
    str2_list=list(string2)
    str1_list.sort()
    str2_list.sort()
    if(str1_list==str2_list):
        return True
    else:
        return False
string1=raw_input("enter the first string:")
string2=raw_input("enter the second string:")
print(is_anagram(string1,string2))








