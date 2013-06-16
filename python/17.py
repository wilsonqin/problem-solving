"""
  Hope there is a more efficient way to code this logic up.
"""
#default to process one single digit
def default_count_digit(dig):
  if dig in [1,2,6]:
    return 3
  elif dig in [4,5,9]:
    return 4
  elif dig in [3,7,8]:
    return 5
  return 0

#default to process two digits (tens, ones)
def count_tens(dig):
  count = 0

  #treat 01-09
  if len(dig) == 1:
    count += default_count_digit(dig[0])
  #treat 10-19 specially
  elif dig[0] == 1:
    if dig[1] == 0:
      count += 3
    elif dig[1] in [1,2]:
      count += 6
    elif dig[1] in [3,4,8,9]: 
      count += 8
    elif dig[1] in [5,6]:
      count += 7
    elif dig[1] == 7:
      count += 9
  else:
    if dig[0] in [2,3,8,9]:
      count += 6
    elif dig[0] in [4,5,6]:
      count += 5
    elif dig[0] in [7]:
      count += 7
    count += default_count_digit(dig[1])

  return count




#process three digits at a time
def count_hundreds(digits):
  length = len(digits)
  letter_count = 0
  if length == 3:
    # add len("X hundred") to letter count
    letter_count += default_count_digit(digits[0]) + 7
    tens_and_ones = digits[1:3]
    tens_count = count_tens(tens_and_ones)

    # add len("and XX") to letter count, if not 00
    if tens_count > 0:
      letter_count += tens_count + 3
  else:
    letter_count += count_tens(digits)
  return letter_count

#being lazy here, one off method
def count_one_thousand():
  return len("onethousand")


# iterate through 1,999 and 1000, summing
def iterate():
  numbers = map(list, map(str, range(1,1000)))
  numbers = map(lambda x: map(int, x), numbers)
  dig_sum = reduce(lambda u,x: count_hundreds(x)+u, numbers, 0)
  dig_sum += count_one_thousand()
  print dig_sum
  return

iterate()

def unit_tests():
  onetofive = map(lambda x: map(int, x), map(list, map(str, range(1,6))))
  onetofive_sum = reduce(lambda u,x: count_hundreds(x)+u, onetofive, 0)
  assert(onetofive_sum == 19)

  assert(count_hundreds([3,4,2]) == 23)
  assert(count_hundreds([1,1,5]) == 20)
  assert(count_hundreds([9,0,8]) == 19)
  assert(count_hundreds([8,3,2]) == 24)
  assert(count_hundreds([7,1,5]) == 22)
  assert(count_hundreds([1,9]) == 8)
  assert(count_hundreds([1,8]) == 8)
  assert(count_hundreds([1,7]) == 9)
  assert(count_hundreds([1,6]) == 7)
  assert(count_hundreds([1,5]) == 7)
  assert(count_hundreds([1,4]) == 8)
  assert(count_hundreds([1,3]) == 8)
  assert(count_hundreds([1,2]) == 6)
  assert(count_hundreds([1,1]) == 6)
  assert(count_hundreds([2,7]) == 11)
  assert(count_hundreds([1,0,0]) == 10)
  assert(count_hundreds([1,0,1]) == 16)
  assert(count_hundreds([1,1,9]) == 21)
  return

unit_tests()


