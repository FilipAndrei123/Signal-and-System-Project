import numpy as np
from scipy.fftpack import fft,ifft
from scipy.signal import find_peaks_cwt
#import matplotlib.pyplot as plt
from oct2py import octave as o

class fourierShapeRecognition(object):
        @staticmethod
        def getShape(dist):
		o.eval("pkg load signal")
		o.findpeaks(dist)
                fftCoef = fft(dist)

		N = len(dist)
#		x = np.linspace(0.0, N, N)

		for i in range(10,len(fftCoef)):
    			fftCoef[i] = 0

		dist = abs(np.fft.ifft(fftCoef))

		minIndex = np.argmin(dist)
		k = np.roll(dist,N-minIndex)

		print(len(find_peaks_cwt(k,np.arange(1,len(dist)/10)))

#		plt.figure(1)
#		plt.plot(x,dist)

#		plt.figure(2)
#		plt.plot(x,k)

#		plt.show()

