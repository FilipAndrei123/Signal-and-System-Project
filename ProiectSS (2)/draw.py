from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

class DrawText(object):
	@staticmethod
	def drawText(disp, text, position, fill=(255,255,255),size=20):
    		image = disp.buffer
		font = ImageFont.truetype('TerminusTTF-Bold-4.47.0.ttf', size)
		angle = 270

		draw = ImageDraw.Draw(image)
    		width, height = draw.textsize(text, font=font)
    		textimage = Image.new('RGBA', (width, height), (0,0,0,0))
    		textdraw = ImageDraw.Draw(textimage)
    		textdraw.text((0,0), text, font=font, fill=fill)
    		rotated = textimage.rotate(angle, expand=1)
    		image.paste(rotated, position, rotated)

		disp.display()
