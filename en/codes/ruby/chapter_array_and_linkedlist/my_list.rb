=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### List class ###
class MyList
  attr_reader :size       # Get list length (current number of elements)
  attr_reader :capacity   # Get list capacity

  ### Constructor ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### Access element ###
  def get(index)
    # If the index is out of bounds, throw an exception, as below
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index]
  end

  ### Access element ###
  def set(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index] = num
  end

  ### Add element at end ###
  def add(num)
    # When the number of elements exceeds capacity, trigger the extension mechanism
    extend_capacity if size == capacity
    @arr[size] = num

    # Update the number of elements
    @size += 1
  end

  ### Insert element in middle ###
  def insert(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size

    # When the number of elements exceeds capacity, trigger the extension mechanism
    extend_capacity if size == capacity

    # Move all elements after index index forward by one position
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Update the number of elements
    @size += 1
  end

  ### Delete element ###
  def remove(index)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    num = @arr[index]

    # Move all elements after index forward by one position
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Update the number of elements
    @size -= 1

    # Return the removed element
    num
  end

  ### Expand list capacity ###
  def extend_capacity
    # Create new array with length extend_ratio times original, copy original array to new array
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # Add elements at the end
    @capacity = arr.length
  end

  ### Convert list to array ###
  def to_array
    sz = size
    # Elements enqueue
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # Initialize list
  nums = MyList.new

  # Direct traversal of list elements
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "List nums = #{nums.to_array}, capacity = #{nums.capacity}, length = #{nums.size}"

  # Sort list
  nums.insert(3, 6)
  puts "Insert number 6 at index 3, get nums = #{nums.to_array}"

  # Remove element
  nums.remove(3)
  puts "Delete element at index 3, get nums = #{nums.to_array}"

  # Update element
  num = nums.get(1)
  puts "Access element at index 1, get num = #{num}"

  # Add elements at the end
  nums.set(1, 0)
  puts "Update element at index 1 to 0, get nums = #{nums.to_array}"

  # Test capacity expansion mechanism
  for i in 0...10
    # At i = 5, the list length will exceed the list capacity, triggering the expansion mechanism
    nums.add(i)
  end
  puts "After expansion, list nums = #{nums.to_array}, capacity = #{nums.capacity}, length = #{nums.size}"
end
