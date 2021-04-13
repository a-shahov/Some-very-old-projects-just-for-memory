import pygame
import sys
import time


pygame.init()
screen = pygame.display.set_mode((1280,720))
ab = pygame.Color(0, 255, 0, 0)
screen.fill(ab)
pygame.display.flip()
pygame.display.set_caption('Fuck you!')
print(pygame.display.Info())

#pygame.display.toggle_fullscreen()
#pygame.display.iconify()
screen.fill(ab)
pygame.display.flip()

rec = pygame.Rect(100, 100, 100, 100)
line = rec.clipline(50, 50, 300, 300)
print(line)
print(rec.bottomright)

rect1 = pygame.Rect(1, 1, 50, 10)
pygame.draw.rect(screen, (0,0,0), rect1)
rect2 = pygame.Rect(100, 100, 30,30)
pygame.draw.rect(screen, (0,0,0), rect2)
pygame.display.flip()
time.sleep(1)
rect3 = rect1.fit(rect2)
pygame.draw.rect(screen, (0,0,255), rect3)
pygame.display.flip()
rect2.width = - rect2.width
rect2.normalize()


print(rect2.width)
print(rect2.left)
print(rect2.right)

font = pygame.font.SysFont(None, 40)
font.italic = True
b = font.render("Хуй соси быдло", True, (0,0,0), (30,30,30)) 
img_rect = b.get_rect()
img_rect.center = screen.get_rect().center
screen.blit(b, img_rect)
pygame.display.flip()

print(sys.argv)
while True:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			sys.exit()

