import matplotlib.pyplot as plt
import numpy as np


x = np.arange(1,10,0.01)
y = x ** 2

y1 = x

y2 = 2 ** x - 1

plt.plot(x,y,x,y1,x,y2)
plt.show()

