# find the first fibonacci term to contain n digits.
num = 1000

#precondition n > 1
def calc_fib(fib_arr, n):
  next_fib = fib_arr[n-1] + fib_arr[n-2]
  fib_arr.append(next_fib)
  if (len(str(next_fib)) >= num):
    print next_fib
    print str(n+1)
    return True
  return False

#main
def main():
  fib_arr = []
  fib_arr.append(1)
  fib_arr.append(1)
  i = 2
  while (not calc_fib(fib_arr,i)):
    i = i + 1
  return

main()