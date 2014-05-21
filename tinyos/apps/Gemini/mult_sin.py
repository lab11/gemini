#!/usr/bin/env python3

import math
import random

SAMPLE_INTERVAL = 40.375 # microseconds

PERIOD = 16000 # microseconds


SCALE = 32767

LINE_WIDTH = 78


NUM_SAMPLES = int(PERIOD / SAMPLE_INTERVAL)

x = -12

vals = []

for i in range(NUM_SAMPLES):
	sin_val = math.sin((2*math.pi*i)/NUM_SAMPLES)

	uint_val = int(sin_val*SCALE)

	vals.append(uint_val)

summed = 0
for k in vals:
	summed += k*(x+random.randint(-10,10))

print(summed)
print(summed/len(vals))
print((summed/len(vals))/SCALE)

