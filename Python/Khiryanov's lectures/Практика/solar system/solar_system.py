import graphics as gr
from settings import Settings
from planet import Planet
import time


ss_set = Settings()
window = gr.GraphWin("Solar system", ss_set.x_size, ss_set.y_size)

background = gr.Rectangle(gr.Point(0, 0), gr.Point(ss_set.x_size, ss_set.y_size))
background.setFill("grey")
background.draw(window)

sun = Planet(window, 60, "yellow",
	gr.Point(ss_set.x_size/2, ss_set.y_size/2), gr.Point(0,0), ss_set)

coord_mars = gr.Point(ss_set.x_size/2+200, ss_set.y_size/2-200)
mars = Planet(window, 20, "red",
	coord_mars, gr.Point(0,-45), ss_set)

coord_earth = gr.Point(ss_set.x_size/2, ss_set.y_size/2-170)
earth = Planet(window, 25, "green",
	coord_earth, gr.Point(70,0), ss_set)

coord_venus = gr.Point(ss_set.x_size/2+100, ss_set.y_size/2)
venus = Planet(window, 27, "orange",
	coord_venus, gr.Point(-80,-80), ss_set)

planets = [mars, earth, venus]

while True:
	for obj in planets:
		obj.motion(sun.mass)
	time.sleep(0.1)
		
window.getMouse()
