function reverseString(str){
	return str.split("").reverse().join("")
}

function isPalindrome(num){
	return (num+"") == reverseString(num+"")
}

/* super brute force! */
palindromes = []
for(var i = 999 * 999; i >=0; i--){
	if(isPalindrome(i)){
		palindromes.push(i)
	}
}

for(i = 0; i<palindromes.length; i++){
	palindrome = palindromes[i]
	print("trying palindrome: " + palindrome)
	j = 100
	for(j = 100; j < 1000; j++){
		if(palindrome % j != 0){ continue }
		factor = palindrome / j
		if((factor+"").length == 3){
			print(palindrome)
			break
		}
	}
}

