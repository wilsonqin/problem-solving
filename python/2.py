LIM = 4000000

def even_fib_sum(lim):
	f_sum = 0
	fib_arr = [1,1]
	while True:
		next_num = fib_arr[0] + fib_arr[1]
		if (next_num > lim):
			break
		if (next_num % 2 == 0):
			f_sum += next_num
		fib_arr[0] = fib_arr[1]
		fib_arr[1] = next_num
	print f_sum

even_fib_sum(LIM)	
