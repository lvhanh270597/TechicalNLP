
def lambda_struct(word, level):
	if level == 0:
		print('lambda(P, P@ %s).' %word)
	elif level == 1:
		print('lambda(P, P@ %s(P)).' %word)
	elif level == 2:
		print('lambda(P, lambda(X, P@ lambda(Y, %s(X, Y)))).' %word)

def main():
	f = open('tu_vung.pl')
	for line in f:
		index = line.index('(')
		line = line[index + 1 : -3]
		word, level = line.split(',')
		level = int(level)
		lambda_struct(word, level)

main()