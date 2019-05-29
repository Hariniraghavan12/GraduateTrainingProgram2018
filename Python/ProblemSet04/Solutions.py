#1.Define a class named Shape and its subclass Square. The Square class has an init function which takes a length as argument.
# Both classes have a area function which can print the area of the shape where Shape's area is 0 by default.

class Shape:
    def __init__(self,length):
        self.length = length

    def area(self):
        self.area = 0


class Square(Shape):
    def __init__(self,length):
        Shape.__init__(self,length)


    def area(self):
        area = self.length*self.length
        print(area)


chobj = Square(10)
chobj.area()

#2.Define a class Person and its two child classes: Male and Female. All classes have a method "getGender" which can print "Male"
# for Male class and "Female" for Female class.

class Person:
    def __init__(self,gender):
        self.gender = gender
    def getgender(self):
        print(self.gender)

class Male(Person):
    def __init__(self,gender):
        Person.__init__(self,gender)

    def getgender(self):
        print(self.gender)

class Female(Person):
    def __init__(self, gender):
        Person.__init__(self, gender)

    def getgender(self):
        print(self.gender)

maleobj = Male("Male")
maleobj.getgender()

femaleobj = Female("Female")
femaleobj.getgender()

#3.Design and implement a Money class that stores monetary values in dollars and cents.
# Special method init should have the following function header, def init(self, dollars, cents) Include special method
# repr (str) for displaying values in dollars and cents: $ 0.45, $ 1.00, $ 1.25. Also include special method add,
# and three getter methods that each provide the monetary value in another currency.
# Choose any three currencies to convert to.

class Money:
    def __init__(self, dollars, cents):
        self.dollars = dollars
        self.cents = cents

    def repr(self):
        dollar_string = '$' + str(self.dollars) + '.' + str(self.cents)
        print(dollar_string)

    def add_india(self):
        rupee = self.dollars*69.61
        paisa = self.cents*6.96
        indian_rupee = rupee+paisa
        return str(indian_rupee)

    def add_kuwait(self):
        dinar = self.dollars * 0.30
        k_paise = self.cents * 0.030
        k_dinar = dinar + k_paise
        return str(k_dinar)

    def add_canadian(self):
        c_dollar = self.dollars * 1.31
        c_cent = self.cents * 0.13
        canadian_dollar = c_dollar + c_cent
        return str(canadian_dollar)


obj = Money(100,45)
obj.repr()
print(obj.add_india())
print(obj.add_canadian())
print(obj.add_kuwait())

#4.Write both a nonrecursive and recursive function that displays the rows of asterisks given below,
      #       **
	  #      ****
      #     ******
      #   **********
      #  ************
      # **************

def pattern1():
    i = 2
    j = 5
    while(i<=12):
        print(j*' '+i*'*')
        i = i+2
        j = j-1

pattern1()

#5.consider the following code
#Your need to define the following two methods for the Coordinate class:
#a) Add an eq method that returns True if coordinates refer to same point in the plane
# (i.e., have the same x and y coordinate).

class Coordinate(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def getX(self):
        # Getter method for a Coordinate object's x coordinate.
        # Getter methods are better practice than just accessing an attribute directly
        return self.x

    def getY(self):
        # Getter method for a Coordinate object's y coordinate
        return self.y

    def __str__(self):
        return '<' + str(self.getX()) + ',' + str(self.getY()) + '>'

    def eq(self):
        if(self.getX() == self.getY()):
            return True
        else:
            return False

obj = Coordinate(10,10)
print(obj.__str__())
print(obj.eq())

