=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 要素をヒープに挿入 ###
def push_min_heap(heap, val)
  # 要素を反転する
  heap.push(-val)
end

### 要素をヒープから取り出す ###
def pop_min_heap(heap)
  # 要素を反転する
  -heap.pop
end

### ヒープ先頭要素を参照 ###
def peek_min_heap(heap)
  # 要素を反転する
  -heap.peek
end

### ヒープから要素を取り出す ###
def get_min_heap(heap)
  # ヒープ内のすべての要素を反転
  heap.max_heap.map { |x| -x }
end

### ヒープに基づいて配列中の最大 k 個の要素を探す ###
def top_k_heap(nums, k)
  # 最小ヒープを初期化する
  # 注意: ヒープ内の全要素を反転し、最大ヒープで最小ヒープをシミュレートする
  max_heap = MaxHeap.new([])

  # 配列の先頭 k 個の要素をヒープに追加
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # k+1 番目の要素から開始し、ヒープ長を k に保つ
  for i in k...nums.length
    # 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
  puts "最大の #{k} 個の要素は"
  print_heap(res)
end
