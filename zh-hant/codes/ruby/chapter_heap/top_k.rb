=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 元素入堆積 ###
def push_min_heap(heap, val)
  # 元素取反
  heap.push(-val)
end

### 元素出堆積 ###
def pop_min_heap(heap)
  # 元素取反
  -heap.pop
end

### 訪問堆積頂元素 ###
def peek_min_heap(heap)
  # 元素取反
  -heap.peek
end

### 取出堆積中元素 ###
def get_min_heap(heap)
  # 將堆積中所有元素取反
  heap.max_heap.map { |x| -x }
end

### 基於堆積查詢陣列中最大的 k 個元素 ###
def top_k_heap(nums, k)
  # 初始化小頂堆積
  # 請注意：我們將堆積中所有元素取反，從而用大頂堆積來模擬小頂堆積
  max_heap = MaxHeap.new([])

  # 將陣列的前 k 個元素入堆積
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # 從第 k+1 個元素開始，保持堆積的長度為 k
  for i in k...nums.length
    # 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "最大的 #{k} 個元素為"
  print_heap(res)
end
