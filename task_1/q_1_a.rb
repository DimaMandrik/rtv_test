# point A)
# #
# # ANSWERS the QUESTIONS:
# #
# # 1) What assumptions does your implementation make about the input parameter?
# # The first method <remove_duplicates(arr)> works for not sorted arrays but only for Fixnum.
# # The second method will work for Objects but only for sorted arrays
# #
# # 2) What is remove_duplicates(x).length in your implementation?
# # The remove_duplicates(x).length is the length of the new array without duplicates
# #
arr = [1, 2, 3.0, 3, 3, 4, 4, 10, 13, 15, 15, 17]
# the method works for unsorted arrays but only for Fixnum
puts 'remove_duplicates for [1, 2, 3.0, 3, 3, 4, 4, 10, 13, 15, 15, 17]. Result:'
def remove_duplicates(arr)
  arr.sort.map {|el|
    ind = arr.index(el)
    if el == arr[ind + 1]
      arr.delete_at(ind)
    end
  }
  print arr
end

remove_duplicates(arr)

puts "\nremove_duplicates_obj for ['1', '2', '3', '3', '3', '4', 4, 10, 13, 15, 15, 17]. Result:"
arr = ['1', '2', '3', '3', '3', '4', 4, 10, 13, 15, 15, 17]
# the method works for Objects but only for sorted arrays
def remove_duplicates_obj(arr)
  arr.map {|el|
    ind = arr.index(el)
    if el.eql? arr[ind + 1]
      arr.delete_at(ind)
    end
  }
  print arr
end

remove_duplicates_obj(arr)