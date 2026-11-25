=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 將元素加入堆積 ###
def push_min_heap(heap, val)
  # 將元素變號
  heap.push(-val)
end

### 從堆積取出元素 ###
def pop_min_heap(heap)
  # 將元素變號
  -heap.pop
end

### 讀取堆積頂端元素 ###
def peek_min_heap(heap)
  # 將元素變號
  -heap.peek
end

### 取出堆積中的元素 ###
def get_min_heap(heap)
  # 將堆積裡的所有元素變號
  heap.max_heap.map { |x| -x }
end

### 以堆積找出陣列中最大的 k 個元素 ###
def top_k_heap(nums, k)
  # 初始化最小堆積
  # 注意：將堆積裡的所有元素變號，就能用最大堆積模擬最小堆積
  max_heap = MaxHeap.new([])

  # 將陣列的前 k 個元素加入堆積
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # 從第 k+1 個元素開始，讓堆積大小維持在 k
  for i in k...nums.length
    # 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
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
