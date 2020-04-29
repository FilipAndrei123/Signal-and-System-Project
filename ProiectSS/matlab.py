import RPi.GPIO as GPIO
import pygame
import time
from PIL import Image

class matlab(object):
	pozaGrup = '/home/pi/Desktop/Proiect_Octave/PozaGrup.jpg'
	pozaGrupAN = '/home/pi/Desktop/Proiect_Octave/A1)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg'
	students = []

	def __init__(self):
		self.students.append(student('/home/pi/Desktop/Proiect_Octave/B_AlesutanCodrutaMaria.wav','/home/pi/Desktop/Proiect_Octave/A2)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg','/home/pi/Desktop/Proiect_Octave/AlesutanCodrutaMaria.jpg','/home/pi/Desktop/Proiect_Octave/Corelatia_Normalizata_AlesutanCodrutaMaria.jpg'))
                self.students.append(student('/home/pi/Desktop/Proiect_Octave/B_CuciorvaCosminDumitru.wav','/home/pi/Desktop/Proiect_Octave/A4)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg','/home/pi/Desktop/Proiect_Octave/CuciorvaCosminDumitru.jpg','/home/pi/Desktop/Proiect_Octave/Corelatia_Normalizata_CuciorvaCosminDumitru.jpg'))
                self.students.append(student('/home/pi/Desktop/Proiect_Octave/B_DarieDragosMihai.wav','/home/pi/Desktop/Proiect_Octave/A5)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg','/home/pi/Desktop/Proiect_Octave/DarieDragosMihai.jpg','/home/pi/Desktop/Proiect_Octave/Corelatia_Normalizata_DarieDragosMihai.jpg'))
                self.students.append(student('/home/pi/Desktop/Proiect_Octave/B_FilipAndrei.wav','/home/pi/Desktop/Proiect_Octave/A3)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg','/home/pi/Desktop/Proiect_Octave/FilipAndrei.jpg','/home/pi/Desktop/Proiect_Octave/Corelatia_Normalizata_FilipAndrei.jpg'))
                self.students.append(student('/home/pi/Desktop/Proiect_Octave/B_UjicaAlexandru.wav','/home/pi/Desktop/Proiect_Octave/A6)Serie_suprapunere_Imagini_Sablon_Suprapuse.jpg','/home/pi/Desktop/Proiect_Octave/UjicaAlexandru.jpg','/home/pi/Desktop/Proiect_Octave/Corelatia_Normalizata_UjicaAlexandru.jpg'))

	@staticmethod
	def begin(index,disp):
		matlab.dispImage(matlab.pozaGrup,disp)
		matlab.waitForUserInput()

		matlab.playAudio(matlab.students[index].sunet)
		matlab.waitForUserInput()

		matlab.dispImage(matlab.students[index].poza,disp)
		matlab.waitForUserInput()

		matlab.dispImage(matlab.students[index].grafic,disp)
		matlab.waitForUserInput()

		matlab.dispImage(matlab.pozaGrupAN,disp)
		matlab.waitForUserInput()

		matlab.dispImage(matlab.students[index].sablon,disp)
		matlab.waitForUserInput()

		matlab.reset(disp)

	@staticmethod
	def reset(disp):
		from menu import menu

		menu().initUI(disp)
		menu().begin(disp)

	@staticmethod
	def waitForUserInput():
		while True:
			if GPIO.input(21) == GPIO.HIGH or GPIO.input(26) == GPIO.HIGH:
				break

			time.sleep(0.1)

	@staticmethod
	def dispImage(img,disp):
		image = Image.open(img)
		image = image.resize((240,320))
		disp.display(image)

	@staticmethod
	def playAudio(audio):
		pygame.mixer.init()
		pygame.mixer.music.load(audio)
		pygame.mixer.music.play()
		while pygame.mixer.music.get_busy() == True:
    			continue

class student(object):
	sunet = ''
	sablon = ''
	poza = ''
	grafic = ''

	def __init__(self,sunet,sablon,poza,grafic):
		self.sunet = sunet
		self.sablon = sablon
		self.poza = poza
		self.grafic = grafic
