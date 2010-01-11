function gcd(a, b){
	if(b == 0){ 
		return a 
	}else{
		return gcd(b, a % b)
	}
}

function lcm (a, b){
	return (a * b) / gcd(a, b)
}

curr = 1
for(i = 2; i < 20; i++){
	curr = lcm(curr, i)
}
print(curr)