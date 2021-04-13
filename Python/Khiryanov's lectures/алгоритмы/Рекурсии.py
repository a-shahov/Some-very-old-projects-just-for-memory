import graphics as gr

window = gr.GraphWin('Fuck you', 600, 600)

def fractal_rectangle(A, B, C, D, deep=10):
	if deep < 1:
		return
	alpha = 0.2
	for	M,N in (A, B), (B, C), (C, D), (D, A):
		gr.Line(gr.Point(*M), gr.Point(*N)).draw(window)
	A1 = (A[0]*(1-alpha) + B[0]*alpha, A[1]*(1-alpha) + B[1]*alpha)
	B1 = (B[0]*(1-alpha) + C[0]*alpha, B[1]*(1-alpha) + C[1]*alpha)
	C1 = (C[0]*(1-alpha) + D[0]*alpha, C[1]*(1-alpha) + D[1]*alpha)
	D1 = (D[0]*(1-alpha) + A[0]*alpha, D[1]*(1-alpha) + A[1]*alpha)
	fractal_rectangle(A1, B1, C1, D1, deep-1)

fractal_rectangle((100,100), (500,100), (500,500), (100,500))

window.getMouse()

def f(n:int):
	""" Факториал числа """
	assert n >= 0 , "Факториал отрицательных чисел не определён"
	if n <= 1:
		return n	
	return n * f(n-1)

def gcd(a,b):
	""" Наибольший общий делить """
	return a if b == 0 else gcd(b, a%b) 

def pow(a:float, n:int):
	""" Быстрое  возведение в степень """
	if n == 0:
		return 1
	return a**2 * pow(a**2, n//2 - 1) if n%2 == 0 else a*pow(a,n-1)
	

print(pow(2,9))
