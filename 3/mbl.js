var num = 600851475143
var div = 2

// divides out sucessively larger factors until there's nothing left to divide by.
while(num > 1){
	// if it's a factor, remove it and try again
	if(0 == (num % div)){
		num = num / div
	// otherwise try the next biggest number
	}else{
		div = div + 1
	}
}

print(div)

