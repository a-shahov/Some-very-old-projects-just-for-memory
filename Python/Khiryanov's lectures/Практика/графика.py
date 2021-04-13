import graphics as gr
import time

window = gr.GraphWin("LGBT", 800, 500)

point = gr.Point(50, 50)
print(point.y)

my_circle = gr.Circle(gr.Point(50, 50), 20)
my_rectangle = gr.Rectangle(gr.Point(200, 400), gr.Point(40, 80))#прямоугольник

#отрисовка
my_circle.draw(window)
my_circle.setFill("blue")



my_rectangle.draw(window)
my_rectangle.setOutline("red")
"""
for i in range(40):
	my_rectangle.setWidth(i)
	time.sleep(0.1)
"""

fin = gr.Point(100, 100)
my_line = gr.Line(gr.Point(50, 50), gr.Point(100, 100))
my_line.setWidth(5)
my_line.setOutline("black")
my_line.draw(window)
for i in range(50):
	my_line.move(5, 5)
	
	time.sleep(0.05)
	
my_line.undraw()

window.getMouse()
window.close()
