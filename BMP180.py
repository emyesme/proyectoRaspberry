#!/usr/bin/python

import Adafruit_BMP.BMP085 as BMP085

sensor = BMP085.BMP085()


print(sensor.read_temperature())
print(sensor.read_pressure())
print(sensor.read_altitude())
print(sensor.read_sealevel_pressure())
