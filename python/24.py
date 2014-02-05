#lexicographic ordering

# returns a modified digit list
# with the sub list starting at index l reversed
def get_reverse(dig_list, l):
  new_list = list(dig_list)
  reflect_index = l
  for i in range(len(dig_list)-1, l-1, -1):
    new_list[reflect_index] = dig_list[i]
    reflect_index += 1
  return new_list

def gen_next(dig_list):
  k = 0
  l = 0
  # first find the largest index k
  for i in range(0, len(dig_list)-1, 1):
    if dig_list[i] < dig_list[i+1]:
      k = i
  #print k
  i = 0
  # then find the largest index l
  for i in range(0, len(dig_list), 1):
    if dig_list[k] < dig_list[i]:
      l = i
    i += 1

  #print l
  # swap the digit at index k with l
  temp = dig_list[k]
  dig_list[k] = dig_list[l]
  dig_list[l] = temp
  #print "after swap:", dig_list

  # reverse the list starting at k+1
  dig_list = get_reverse(dig_list, k+1)

  #print "Next:", dig_list
  return dig_list

def main():
  N = 1000000
  dig_list = [0,1,2,3,4,5,6,7,8,9]
  for i in range(2, N+1, 1):
    dig_list = gen_next(dig_list)
    #print dig_list
  print dig_list

main()