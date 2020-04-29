from initProj import initProj
from UI import UI
from menu import menu

import Adafruit_ILI9341 as TFT
import Adafruit_GPIO as GPIO
import Adafruit_GPIO.SPI as SPI

DC = 24
RST = 23
SPI_PORT = 0
SPI_DEVICE = 1


disp = TFT.ILI9341(DC, rst=RST, spi=SPI.SpiDev(SPI_PORT, SPI_DEVICE, max_speed_hz=64000000))
disp.begin()

initProj().init(disp)

#from imgProcessing import imgProcessing
#from PIL import Image
#img = Image.open("/home/pi/Desktop/triunghi1.jpg")
#imgProcessing().analysisImage(img)

UI().init(disp)

menu().initUI(disp)
menu().begin(disp)
