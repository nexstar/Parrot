#! /bin/sh

#installing env
sudo apt-get install ipython python-opencv python-scipy python-numpy python-pygame python-setuptools git

#download simplcv in current file
git clone https://github.com/sightmachine/SimpleCV.git
cd SimpleCV/


#install && paired PIL
easy_install --find-links http://www.pythonware.com/products/pil/ Imaging
sudo pip install -r requirements.txt
sudo python setup.py install


