=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # [region]{init_deque}
  # Initialize the deque
  # Ruby has no built-in deque class; use an Array as a deque
  deque = []
  # [endregion]{init_deque}

  # [region]{push}
  # Enqueue elements
  deque << 2
  deque << 5
  deque << 4
  # Note that Array#unshift has O(n) time complexity because the underlying structure is an array
  deque.unshift(3)
  deque.unshift(1)
  # [endregion]{push}
  puts "Deque deque = #{deque}"

  # [region]{peek_first}
  # Access an element
  peek_first = deque.first
  # [endregion]{peek_first}
  puts "Front element peek_first = #{peek_first}"
  # [region]{peek_last}
  peek_last = deque.last
  # [endregion]{peek_last}
  puts "Rear element peek_last = #{peek_last}"

  # [region]{pop_first}
  # Dequeue an element
  # Note that Array#shift has O(n) time complexity because the underlying structure is an array
  pop_front = deque.shift
  # [endregion]{pop_first}
  puts "Element dequeued from the front: pop_front = #{pop_front}; deque = #{deque}"
  # [region]{pop_last}
  pop_back = deque.pop
  # [endregion]{pop_last}
  puts "Element dequeued from the rear: pop_back = #{pop_back}; deque = #{deque}"

  # [region]{size}
  # Get the deque size
  size = deque.length
  # [endregion]{size}
  puts "Deque size = #{size}"

  # [region]{is_empty}
  # Check whether the deque is empty
  is_empty = size.zero?
  # [endregion]{is_empty}
  puts "Is the deque empty? #{is_empty}"
end
