# point B)
# #
# # ANSWERS the QUESTIONS:
# #
# # 1) Does your implementation work for generic objects, numbers, or integers?
# # yes, but it will not work if duplicates are not after each other(e.g. [1,2,1])
# #
# # 2) If it does not work with objects, what would be required to make it work for generic objects?
# #
class Obj123
  @@no_of_customers = 0
end

ob = Obj123.new
ob1 = Obj123.new

arr = [1, 2, '3', '3', 3, 4.0, 4, 10, 13, 15, 15, 17, ob, ob1, ob1, ob]
def mov_uniq_to_new_array(arr)
  arr1 = []
  arr.each {|el| arr1 << el if el != _next(arr, el)}
  arr1
end

def _next(arr, el)
  arr[arr.index(el) + 1]
end

def has_next?(arr, el)
  arr.include?(arr.index(el) + 1)
end

print mov_uniq_to_new_array(arr)