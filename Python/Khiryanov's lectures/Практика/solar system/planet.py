import graphics as gr
import math


class Planet:
	
	def __init__(self, window, radius, color,
			coord, velocity, ss_set):
		
		k_m = 50
		
		self.ss_set = ss_set
		self.coord = coord
		self.planet = gr.Circle(coord, radius)
		self.velocity = velocity
		self.mass = k_m * radius ** 3
		
		self.planet.draw(window)
		self.planet.setOutline(color)
		self.planet.setFill(color)
		
	def motion(self, M):
		
		self.planet.move(self.velocity.x * self.ss_set.dt,
			self.velocity.y * self.ss_set.dt)
		self.coord.x += self.velocity.x * self.ss_set.dt
		self.coord.y += self.velocity.y * self.ss_set.dt
		
		length = (self.coord.x - self.ss_set.x_size/2) ** 2 \
			+ (self.coord.y - self.ss_set.x_size/2) ** 2
		
		a = self.ss_set.gravity * M / length
				
		a_x = a * ((self.ss_set.x_size / 2 - self.coord.x) / length)
		a_y = a * ((self.ss_set.y_size / 2 - self.coord.y) / length)
		
		self.velocity.x += a_x
		self.velocity.y += a_y
			
		
