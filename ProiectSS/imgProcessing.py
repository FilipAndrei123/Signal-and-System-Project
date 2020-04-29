import numpy as np
import math
import time

import RPi.GPIO as GPIO

from PIL import Image
from PIL import ImageDraw

#from fourierShapeRecognition import fourierShapeRecognition

class imgProcessing(object):
	@staticmethod
	def analysisImage(img):
		image = imgProcessing().binaryImage(img)

		shapes = imgProcessing().getRawShapes(image)
		shapes = imgProcessing().intersectShapes(shapes)

		draw = ImageDraw.Draw(img)

		plot = False
		imgList = []
		if GPIO.input(21) == GPIO.HIGH:
			plot = True

		width , height = image.size
		for i in range(len(shapes)):
			rectX = width
			rectY = height

			rectWidth = 0
			rectHeight = 0
			for j in range(len(shapes[i])):
				if rectX > shapes[i][j][0]:
					rectX = shapes[i][j][0]
				if rectWidth < shapes[i][j][0]:
					rectWidth = shapes[i][j][0]
				if rectY > shapes[i][j][1]:
					rectY = shapes[i][j][1]
				if rectHeight < shapes[i][j][1]:
					rectHeight = shapes[i][j][1]

			rectHeight = rectHeight - rectY
			rectWidth = rectWidth - rectX

			draw.rectangle([(rectX,rectY),(rectWidth+rectX,rectHeight+rectY)],outline="orange")

			if plot == True:
#				fourierShapeRecognition().getShape(imgProcessing().distArray(rectX,rectY,shapes[i]))

#				font = ImageFont.truetype('TerminusTTF-Bold-4.47.0.ttf', 5)

#		                draw = ImageDraw.Draw(image)
#                		textdraw.text((0,0), text, font=font, fill=(255,0,0))

				imgList.append((shapes[i],rectX,rectY,rectWidth+rectX,rectHeight+rectY))

		if plot == True:
			return imgProcessing().beginPlot(len(shapes),imgList)

		return img.resize((240,320))

	@staticmethod
	def beginPlot(count,imgList):
		img = Image.new('RGB',(240,320),(0,0,0))
		draw = ImageDraw.Draw(img)

		subplots = 240 / count

		for i in range(1,count):
			img = imgProcessing().drawLine(img,i*subplots)

		for i in range(len(imgList)):
			img.paste(imgProcessing().generateBitmap(imgList[i]).resize((subplots-20,subplots-20)),(i*subplots+10,0))

		imgProcessing().drawLine(img,0,X=subplots,Y1=240,X1=subplots)

		for i in range(len(imgList)):
			img.paste(imgProcessing().generatePlot(imgList[i]).resize((subplots-20,320 - subplots - 20)),(i*subplots+10,subplots + 20))

		return img

	@staticmethod
	def generatePlot(points):
		x = points[1]
		y = points[2]
		w = points[3]
		h = points[4]

		centerX = 0
		centerY = 0

		for i in points[0]:
			centerX = centerX + i[0] - x
			centerY = centerY + i[1] - y

		centerX = centerX/len(points[0])
		centerY = centerY/len(points[0])

		plotPoints = []
		imgHeight = 0
		minValue = 320

		for i in range(len(points)):
			p = (points[0][i][0]-x,points[0][i][1]-y)
			dist = imgProcessing().dist((centerX,centerY),p)

			if dist > imgHeight:
				imgHeight = dist

			if dist < minValue:
				minValue = dist

			plotPoints.append((i,dist))

		img = Image.new('RGBA',(len(plotPoints),int(imgHeight)+1-int(minValue)),(0,0,0,1))

		normalizedPlotPoints = []
		for i in plotPoints:
			normalizedPlotPoints.append((i[0],i[1]-int(minValue)+1))
		plotPoints = normalizedPlotPoints

		draw = ImageDraw.Draw(img)

		for i in range(1,len(plotPoints)):
			draw.line((plotPoints[i-1][1],plotPoints[i-1][0],plotPoints[i][1],plotPoints[i][0]),fill='white',width=1)

		return img

	@staticmethod
	def distArray(x,y,points):
		centerX = 0
                centerY = 0

                for i in points:
                        centerX = centerX + i[0] - x
                        centerY = centerY + i[1] - y

                centerX = centerX/len(points)
                centerY = centerY/len(points)

                plotPoints = []

                for i in range(len(points)):
                        p = (points[i][0]-x,points[i][1]-y)
                        dist = imgProcessing().dist((centerX,centerY),p)

                        plotPoints.append(dist)
		return plotPoints

	@staticmethod
	def generateBitmap(points):
		x = points[1]
		y = points[2]
		w = points[3]
		h = points[4]

		img = Image.new('RGBA',(w-x+1,h-y+1),(0,0,0,1))
		draw = ImageDraw.Draw(img)

		for p in points[0]:
			img.putpixel((p[0]-x,p[1]-y),(255,255,255,1))

		return img

	@staticmethod
	def drawLine(img,Y,X=0,Y1=0,X1=320):
		if Y1 == 0:
			Y1 = Y

		draw = ImageDraw.Draw(img)
		draw.line((Y,X,Y1,X1),fill='white',width=5)
		return img


	@staticmethod
	def binaryImage(image):
		thresh = 90
        	fn = lambda x : 255 if x > thresh else 0
        	return image.convert('L').point(fn, mode='1').convert('RGB')

	@staticmethod
	def intersectShapes(l):
		i=0
		j=0

		try:
			while i < len(l):
				j=0
				while j < len(l):
					if i != j and imgProcessing().intersection(l[i],l[j]):
						l[i]=l[i]+l[j]
						l.pop(j)
					j = j + 1
				i = i + 1
		except:
			print('an exception occured')
		return l

	@staticmethod
	def getRawShapes(image):
		shapesList = [[]]

		width,height  = image.size
		for i in range (1,width-1):
			for j in range (1,height-1):
				if (
					 image.getpixel((i,j)) == (0,0,0) and 
					(image.getpixel((i+1,j)) == (255,255,255) or
					image.getpixel((i,j+1)) == (255,255,255) or
					image.getpixel((i-1,j)) == (255,255,255) or
					image.getpixel((i,j-1)) == (255,255,255))
				):
					p = (i,j)
					added = False

					if len(shapesList[0]) == 0:
						shapesList[0].append(p)
						added = True
					else:
						for k in range(len(shapesList)):
							if imgProcessing().checkIfIsNear(shapesList[k],p):
								shapesList[k].append(p)
								added = True

					if added == False:
						shapesList.append([])
						shapesList[len(shapesList)-1].append(p)

		return shapesList

	@staticmethod
	def intersection(a,b):
		for i in a:
			for j in b:
				if i==j:
					return True
		return False

	@staticmethod
	def checkIfIsNear(l,p):
		count = len(l)-1
		nearValue = 5

		if imgProcessing().dist(l[count],p) < nearValue:
			return True

		if count>0:
			if imgProcessing().dist(l[count-1],p) < nearValue:
				return True

		if count>1:
			if imgProcessing().dist(l[count-2],p) < nearValue:
				return True

		return False

	@staticmethod
	def dist(p1,p2):
		return math.sqrt(math.pow(p1[0]-p2[0],2)+math.pow(p1[1]-p2[1],2))

#	@staticmethod
#	def binaryBitmap(img):
#		width,height = img.size
#
#		for i in range(width):
    #            	for j in range(height):
   #                 		if (img.getpixel((i, j))[0] < 130 and img.getpixel((i, j))[1] < 130 and img.getpixel((i, j))[2] < 130):
  #                      		img.putpixel(0,0,0)
 #                   		else:
#					print ('PIL',PIL.__version__)
#					img[i,j]=(255,255,255)
#		return img
