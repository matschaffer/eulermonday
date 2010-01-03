#!/usr/bin/env python

num_to_string = {
	1: 'one',
	2: 'two',
	3: 'three',
	4: 'four',
	5: 'five',
	6: 'six',
	7: 'seven',
	8: 'eight',
	9: 'nine',
	10: 'ten',
	11: 'eleven',
	12: 'twelve',
	13: 'thirteen',
	14: 'fourteen',
	15: 'fifteen',
	18: 'eighteen'
}

tens_to_string = {
	0: '',
	1: 'teen',
	2: 'twenty',
	3: 'thirty',
	4: 'forty',
	5: 'fifty',
	6: 'sixty',
	7: 'seventy',
	8: 'eighty',
	9: 'ninety'
}

def numberStr(number):
	if number == 1000: return 'onethousand'

	str = ''
	hundreds = number / 100
	number = number % 100
	
	if num_to_string.has_key(hundreds):
		str += num_to_string[hundreds] + 'hundred'
		if number > 0:
			str += 'and'
	
	if num_to_string.has_key(number):
		str += num_to_string[number]
	else:
		tens = number / 10
		number = number % 10
	
		str += tens_to_string[tens]
		
		if num_to_string.has_key(number):
			str += num_to_string[number]

	return str

print(sum([len(numberStr(i)) for i in range(1, 1001)]))
