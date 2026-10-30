=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### List class ###
class MyList
  attr_reader :size       # Get the list length (current number of elements)
  attr_reader :capacity   # Get the list capacity

  ### Constructor ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### Access an element ###
  def get(index)
    # Raise an exception if the index is out of bounds; the same applies below
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index]
  end

  ### Update an element ###
  def set(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index] = num
  end

  ### Append an element at the end ###
  def add(num)
    # Grow the capacity when adding an element would exceed it
    extend_capacity if size == capacity
    @arr[size] = num

    # Update the number of elements
    @size += 1
  end

  ### Insert an element in the middle ###
  def insert(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size

    # Grow the capacity when adding an element would exceed it
    extend_capacity if size == capacity

    # Shift all elements at and after index `index` one position to the right
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Update the number of elements
    @size += 1
  end

  ### Remove an element ###
  def remove(index)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    num = @arr[index]

    # Shift all elements after index one position to the left
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Update the number of elements
    @size -= 1

    # Return the removed element
    num
  end

  ### Grow the list capacity ###
  def extend_capacity
    # Duplicate the original array and append capacity * (extend_ratio - 1) empty slots
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # Update the list capacity
    @capacity = arr.length
  end

  ### Convert the list to an array ###
  def to_array
    sz = size
    # Convert only the list elements within the occupied range
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the list
  nums = MyList.new

  # Append an element at the end
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "List nums = #{nums.to_array}, capacity = #{nums.capacity}, size = #{nums.size}"

  # Insert an element in the middle
  nums.insert(3, 6)
  puts "After inserting 6 at index 3, nums = #{nums.to_array}"

  # Remove an element
  nums.remove(3)
  puts "After removing the element at index 3, nums = #{nums.to_array}"

  # Access an element
  num = nums.get(1)
  puts "Access the element at index 1: num = #{num}"

  # Update an element
  nums.set(1, 0)
  puts "After updating the element at index 1 to 0, nums = #{nums.to_array}"

  # Test capacity growth
  for i in 0...10
    # When i = 5, the list length would exceed its capacity, triggering capacity growth
    nums.add(i)
  end
  puts "After capacity expansion, list nums = #{nums.to_array}, capacity = #{nums.capacity}, size = #{nums.size}"
end
