### FONT CONFIG IN MATPLOTLIB
import matplotlib.font_manager as fm
fm._rebuild()

import matplotlib.pyplot as plt
plt.rcParams["figure.dpi"] = 600
plt.rcParams["font.family"] = "fantasy"
plt.rcParams["font.fantasy"] = "Comic Sans MS"




# Encapsulation
class aaa:
	def __init__(self):
		self.__a = 1
		self.b = 'Hi'
	def disp(self):
		return self.__a, self.b # It's a tuple


cla = aaa()
print(cla.__a) # Error: a is private to the class aaa
print(cla.disp())
print(cla._aaa__a) # It works!

# Inheritance

class BMW:
	def __init__(self, model="BMW", year=2010):
		self.model = model
		self.year = year
	def someMeth(self):
		print('Starting the car')

class TSeries(BMW):
	def __init__(self, model="BMW", year=2015, ActCtrl = True):
		BMW.__init__(self, model="BMW", year=2010) # super() instead of BMW
		self.ActCtrl = ActCtrl
	def someMeth(self): # OVERRIDE or UPDATE the method 'someMeth' of BMW Class
		BMW.someMeth(self) # super().someMeth() Omit the 'self'
		print('Saying my proper Hello! Not of my parent')


car = BMW("BMW", 2012)
ThS = TSeries(2018)

car.model
car.year

Ths.model
Ths.year
Ths.ActCtrl



# About time
from datetime import *
from time import sleep

sleep(0.5) # In sec

d1 = date(2020, 4, 23) # Month is not 04

import time

at = time.perf_counter() # Check program execution

# POLYMORPHISM: DUCK TYPING
class Duck:
	def talk(self):
		print('Quack Quack')

class Man:
	def talk(self):
		print('Hello')

def callTalk(obj):
	obj.talk()

d = Duck()
h = Man()

callTalk(d)
callTalk(h)

# DEPENDENCY INJECTION
class Flight:
	def __init__(self, engine):
		self.engine = engine

	def startEngine(self):
		self.engine.start()

class AirbusEngine:
	def start(self):
		print('Staring Airbus Engine...')

class BoeingEngine:
	def start(self):
		print('Starting Boeing Engine...')

ae = AirbusEngine()
be = BoeingEngine()

f_ae = Flight(ae)
f_be = Flight(be)

f_ae.startEngine()
f_be.startEngine()

# OPERATOR OVERLOADING
a, b = 1, 2
x, y = 'x', 'y'
l1, l2 = [1, 'a'], ['z', 3, 'xYz']

print(a+b)
print(x+y)
print(l1+l2)

