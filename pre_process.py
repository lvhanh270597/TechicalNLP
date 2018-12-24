import re

FPATH = 'rule'

file = open(FPATH)
lines = [re.sub(r'[\.\(,\)]', ' ', line) for line in file if len(line) > 1]

vocab = []
for line in lines:	
	words = line.split()
	outside = words[0]
	inside = words[1:]
	print(outside, inside)