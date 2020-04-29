import os
import pygame

class audioInit(object):
	@staticmethod
	def audio_init():
		os.system('gpio -g mode 13 alt0')

		pygame.mixer.init()
		pygame.mixer.music.load('/home/pi/Desktop/ProiectSS/audioOutTest.wav')
		pygame.mixer.music.play()

		while pygame.mixer.music.get_busy() == True:
			continue
