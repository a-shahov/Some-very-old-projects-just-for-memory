import turtle
import math

def spiral():
	
	turtle.width(3)
	turtle.speed('fastest')
	turtle.shape('turtle')
	pi = math.pi
	alpha = 0
	alpha_inc = 0.07
	for i in range(1000):
		turtle.left(alpha_inc*180)
		length = 10*alpha_inc*((1 + (alpha ** 2)) ** (1/2))
		turtle.forward(length)
		alpha += alpha_inc
		
spiral()
a = input()
