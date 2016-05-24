#!/usr/bin/env python

#include
from SimpleCV import *
from time import sleep


#camera image size
myCamera = Camera(prop_set={'width':320, 'height': 240})
#windows size
myDisplay = Display(resolution=(320, 240))

#
while not myDisplay.isDone():
   frame = myCamera.getImage()#get camera image
   faces = frame.findHaarFeatures('face.xml') #find xml get face
   if faces:
     for face in faces:
        print "Face at: " + str(face.coordinates())#face center posite
        facelayer = DrawingLayer((frame.width,frame.height))#new draw in windows
        w=face.width()
        h=face.height()
        print "x:"+str(w)+" y:"+str(h)
        facebox_dim = (w,h)
        facebox = facelayer.centeredRectangle(face.coordinates(),facebox_dim)#draw square in windows
        frame.addDrawingLayer(facelayer)#add draw input 
        frame.applyLayers()#output in windows 
   else:
        print "No faces detected."
   frame.save(myDisplay)
   sleep(.1)
