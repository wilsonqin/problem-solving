import math

N = 10001

def is_prime(x):
  if x == 2:
    return True
  for i in range(2,int(math.sqrt(x)+1)):
    if x % i == 0:
      return False
  return True

def find_nth_prime(n):
  x = 2
  count = 0
  while count < n:
    if is_prime(x):
      count += 1
      if count == n:
        return x
    x += 1
  return x


assert(is_prime(2) == True)
assert(is_prime(4) == False)
assert(is_prime(19) == True)

print find_nth_prime(N)