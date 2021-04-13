import pygame
from settings import Settings
from ship import Ship
import game_functions as gf
from pygame.sprite import Group
from game_stats import GameStats
from button import Button
from scoreboard import Scoreboard

def run_game():
	
	ai_settings = Settings()
	pygame.init()
	screen = pygame.display.set_mode(
		(ai_settings.screen_width,ai_settings.screen_height)) #задаёт размер экрана
	pygame.display.set_caption('Alien Invasion') #отображает его название
	play_button = Button(ai_settings, screen, 'Play')
	ship = Ship(ai_settings,screen)
	bullets = Group()
	aliens = Group()
	gf.create_fleet(ai_settings, screen, ship, aliens)
	stats = GameStats(ai_settings)
	sb = Scoreboard(ai_settings, screen, stats)
	
	while True:
		gf.check_events(ai_settings, screen, ship, bullets, aliens, play_button, stats, sb)
		if stats.game_active:
			ship.update()
			gf.update_aliens(ai_settings, stats, screen, ship, aliens, bullets, sb)
			gf.update_bullets(ai_settings, screen, ship, aliens, bullets, sb, stats)
		gf.update_screen(ai_settings, screen, ship, aliens, bullets,
			play_button, stats, sb)	
			
run_game()
