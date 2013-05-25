#gives a list of digits in string form
digits = list(str(pow(2,1000)))

#convert all digits to strings
digits = map(int, digits)

def add(x,y):
  return x+y

sum_of_digits = reduce(add, digits, 0)

print sum_of_digits