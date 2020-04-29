import time
import RPi.GPIO as GPIO

from draw import DrawText
from audioInit import audioInit

class initProj(object):
	@staticmethod
	def init(disp):
		DrawText().drawText(disp, 'Display initialization', (220,0),(255,255,255))
		DrawText().drawText(disp, 'OK', (220,300),(0,255,0))

		DrawText().drawText(disp, 'Initializing audio output...', (200,0),(255,255,255))
		audioInit().audio_init()
		DrawText().drawText(disp, 'Audio output initialization', (180,0),(255,255,255))
		DrawText().drawText(disp, 'OK', (180,300),(0,255,0))

		DrawText().drawText(disp, 'Initializing GPIO...', (160,0),(255,255,255))
		initProj().initGPIO()
		DrawText().drawText(disp, 'GPIO state', (140,0),(255,255,255))
		DrawText().drawText(disp, 'OK', (140,300),(0,255,0))

		DrawText().drawText(disp, 'Loading and verifying resources...',(120,0),(255,255,255))

		for i in range(0,1):
			for i in range(0,320/20):
				DrawText.drawText(disp,'|',(100,i*20),(255,255,255))
			for i in range(0,320/20):
				DrawText.drawText(disp,'|',(100,320-i*20),(0,0,0))
		DrawText().drawText(disp, 'Resources',(100,0),(255,255,255))
		DrawText().drawText(disp, 'OK',(100,300),(0,255,0))

		DrawText().drawText(disp, 'Loading UI!',(80,0),(0,255,0))

		time.sleep(2)
		disp.clear((0,0,0))
		disp.display()

	@staticmethod
	def initGPIO():
		GPIO.setwarnings(False)
                GPIO.setmode(GPIO.BCM)
                GPIO.setup(26, GPIO.IN, pull_up_down=GPIO.PUD_DOWN) #UP
		GPIO.setup(19, GPIO.IN, pull_up_down=GPIO.PUD_DOWN) #DOWN
		GPIO.setup(21, GPIO.IN, pull_up_down=GPIO.PUD_DOWN) #RESET
