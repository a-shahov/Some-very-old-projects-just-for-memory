# -*- coding: UTF-8 -*-













"""
A = "aÄBèC"
print(A)


import shelve

db = shelve.open("store")
for obj in range(10):
	db["object " + str(obj)] = list(range(obj))
db.close
db = shelve.open("store")

print(db["object 0"])



def func1():
	func1.atr += 10
	print(func1.atr)

func1.atr = 0	

func1()
func1()
func1()
func1()
func1()
func1()
func1()

def func(s):
	def func2(z):
		print(z, func2.local)
		func2.local += 1
	func2.local = s
	return func2

F = func(10)

for i in range(5):
	F(1)

G = func(0)
G(1)

import sys
from tkinter import Button
import tkinter

x = Button(text = "Press me\nfuck YOU", command = (lambda: sys.stdout.write("Spam!\n")))
x.pack()
tkinter.mainloop()

def gen():
	for i in range(10):
		x = yield i ** 3
		print(x)
		
G = gen()
print(next(G))
print(next(G))
print(next(G))
print(G.send(100))
"""
