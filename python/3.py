NUM = 600851475143

def is_prime(n):
	for i in range(2,n):
		if (n % i == 0):
			return False
	return True

def largest_prime_factor(n):
	max_pf = 0
	f = 2
	while f < n:
		#print f , n
		if n == 1 or n == 0:
			break
		elif (n % f == 0):
			if max_pf < f and is_prime(f):
				max_pf = f
				print f , n
			n = n / f
		else:
			f += 1

	if n > max_pf:
		return n
	return max_pf

print largest_prime_factor(NUM)
