=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 元素入堆 ###
def push_min_heap(heap, val)
  # 元素取反
  heap.push(-val)
end

### 元素出堆 ###
def pop_min_heap(heap)
  # 元素取反
  -heap.pop
end

### 访问堆顶元素 ###
def peek_min_heap(heap)
  # 元素取反
  -heap.peek
end

### 取出堆中元素 ###
def get_min_heap(heap)
  # 将堆中所有元素取反
  heap.max_heap.map { |x| -x }
end

### 基于堆查找数组中最大的 k 个元素 ###
def top_k_heap(nums, k)
  # 初始化小顶堆
  # 请注意：我们将堆中所有元素取反，从而用大顶堆来模拟小顶堆
  max_heap = MaxHeap.new([])

  # 将数组的前 k 个元素入堆
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # 从第 k+1 个元素开始，保持堆的长度为 k
  for i in k...nums.length
    # 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
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
  puts "最大的 #{k} 个元素为"
  print_heap(res)
end
