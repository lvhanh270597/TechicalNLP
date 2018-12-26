'''
This program allowes the users can extract first order model with input is the rules
Example:
Input:
sống(nam, hà_nội)
học_sinh(nam)
học(nam, lớp_mười_hai)
Bố(đạt, nam)

Output:
D = {d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15}
F : {
	F(nam) = d1
	F(hà_nội) = d2
	F(lớp_mười_hai) = d3
	F(đạt) = d4
}
'''

import re
import operator

FPATH = 'rule'

file = open(FPATH)
lines = [re.sub(r'[\.\(,\)]', ' ', line).lower() for line in file if len(line) > 1]

rules = []
vocab = dict()
for line in lines:	
	words = line.split()
	outside = words[0]
	inside = words[1:]
	vocab[outside] = len(inside)
	rules.append((outside, inside))
	for word in inside:
		vocab[word] = 0

vocab = [item for item in vocab.items()]
vocab.sort(key=operator.itemgetter(1), reverse=True)

lst = []
for item in vocab:
	lst.append('({0}, {1})'.format(item[0], item[1]))

fact = [w for w in vocab if w[1] == 0]

D = {}
for i in range(1, len(fact) + 1):
	D[fact[i - 1][0]] = 'd' + str(i)
#print(D)

def print_list_tuple(lst):	
	string = []
	for item in lst:	
		if len(item) == 1:
			string.append(item[0])
		else:
			string.append('(' + ', '.join(item) + ')')
	string = str(', '.join(string)).replace('\'', '')
	return string

vocab.sort(key=operator.itemgetter(1), reverse=False)
vocab = [w[0] for w in vocab]
def show_model(lst, D):
	F = {}
	for item in rules:
		outside, inside = item
		if outside not in F.keys():
			F[outside] = F[outside] = [tuple(inside)]
		else:
			F[outside].append(tuple(inside))
	print("F : {")
	for key in vocab:
		print('\t', end='')
		lst = []	
		if key in D:
			F[key] = [tuple([D[key]])]
			print('F({0})'.format(key) + ' = ' + print_list_tuple(F[key]))
		else:
			for items in F[key]:			
				sub_lst = []
				for item in items:
					sub_lst.append(D[item])
				lst.append(tuple(sub_lst))
			F[key] = set(lst)
			print('F({0})'.format(key) + ' = {' + print_list_tuple(F[key]) + '}')
	print('}')
	return F

def show_tu_vung(lst):
	for w in lst:
		print('tu_vung{0}.'.format(w))	

def show_model_pl(fact, rules):
	for item in fact:
		print('giá_trị({0}).'.format(item[0]))
	for item in rules:
		outside, inside = item
		print('{0}{1}.'.format(outside, str(tuple(inside)).replace('\'', '').replace(',)', ')')))
#show_model(lst, D)
#show_tu_vung(lst)
show_model_pl(fact, rules)