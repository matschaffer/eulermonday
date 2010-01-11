function nextFib(last, secondLast){
	return last + secondLast;
}

var last = 2
var secondLast = 1
var total = last
while((next = nextFib(last, secondLast)) < 4000000){
	if(next % 2 == 0){ total = total + next }
	secondLast = last
	last = next
}
print(total)
