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
    # Throw an exception if the index is out of bounds, here and below
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index]
  end

  ### Access an element ###
  def set(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    @arr[index] = num
  end

  ### Append an element ###
  def add(num)
    # Increase capacity when the elements would no longer fit
    extend_capacity if size == capacity
    @arr[size] = num

    # Update the element count
    @size += 1
  end

  ### Insert an element in the middle ###
  def insert(index, num)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size

    # Increase capacity when the elements would no longer fit
    extend_capacity if size == capacity

    # Shift the elements from index onward one position to the right
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # Update the element count
    @size += 1
  end

  ### Remove an element ###
  def remove(index)
    raise IndexError, "Index out of bounds" if index < 0 || index >= size
    num = @arr[index]

    # Shift the elements after index one position to the left
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # Update the element count
    @size -= 1

    # Return the removed element
    num
  end

  ### Increase the list capacity ###
  def extend_capacity
    # Create an array extend_ratio times as long and copy the original array into it
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # Update the list capacity
    @capacity = arr.length
  end

  ### Convert the list to an array ###
  def to_array
    sz = size
    # Convert only the elements within the current list length
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # Initialize the list
  nums = MyList.new

  # Append an element
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "List nums = #{nums.to_array}, capacity = #{nums.capacity}, length = #{nums.size}"

  # Insert an element in the middle
  nums.insert(3, 6)
  puts "After inserting 6 at index 3, nums = #{nums.to_array}"

  # Remove an element
  nums.remove(3)
  puts "After removing the element at index 3, nums = #{nums.to_array}"

  # Access an element
  num = nums.get(1)
  puts "Reading index 1 gives num = #{num}"

  # Update an element
  nums.set(1, 0)
  puts "After setting the element at index 1 to 0, nums = #{nums.to_array}"

  # Test capacity growth
  for i in 0...10
    # At i = 5, the list length would exceed its capacity, so the list grows
    nums.add(i)
  end
  puts "After increasing capacity, nums = #{nums.to_array}, capacity = #{nums.capacity}, length = #{nums.size}"
end
