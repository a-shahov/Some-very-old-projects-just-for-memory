import pygame
from pygame.sprite import Sprite

class Ship(Sprite):
	
	def __init__(self, ai_settings, screen):
		
		super().__init__()
		
		self.ai_settings = ai_settings
		self.screen = screen
		
		# Загрузка изображения корабля и получение прямоугольника.
		self.image = pygame.image.load('images/ship.bmp')
		self.rect = self.image.get_rect()
		self.screen_rect = screen.get_rect()
		
		# Каждый новый корабль появляется у нижнего края экрана.
		# В centerx только целочисленные значения
		self.rect.centerx = self.screen_rect.centerx 
		self.rect.bottom = self.screen_rect.bottom
		
		self.center = float(self.rect.centerx)
		
		self.moving_right = False
		self.moving_left = False
	
	def update(self):
		
		if self.moving_right:
			if self.rect.right + self.ai_settings.ship_speed_factor < self.screen_rect.right:
				self.center += self.ai_settings.ship_speed_factor
				self.rect.centerx = self.center
			else:
				self.rect.right = self.screen_rect.right
				self.center = float(self.rect.centerx)
		if self.moving_left:
			if self.rect.left - self.ai_settings.ship_speed_factor > self.screen_rect.left:
				self.center += -self.ai_settings.ship_speed_factor
				self.rect.centerx = self.center
			else:
				self.rect.left = self.screen_rect.left
				self.center = float(self.rect.centerx)
		
		
	def blitme(self):
		
		self.screen.blit(self.image, self.rect)
		
	def center_ship(self):
		
		self.rect.centerx = self.screen_rect.centerx
		self.center = self.screen_rect.centerx
