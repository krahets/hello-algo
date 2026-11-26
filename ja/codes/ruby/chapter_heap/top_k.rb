=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 要素をヒープに挿入する ###
def push_min_heap(heap, val)
  # 要素の符号を反転する
  heap.push(-val)
end

### 根の要素をヒープから取り出す ###
def pop_min_heap(heap)
  # 要素の符号を反転する
  -heap.pop
end

### ヒープの根の要素を参照する ###
def peek_min_heap(heap)
  # 要素の符号を反転する
  -heap.peek
end

### ヒープから要素を取り出す ###
def get_min_heap(heap)
  # ヒープの全要素の符号を反転する
  heap.max_heap.map { |x| -x }
end

### ヒープを使って配列の上位 k 個の要素を求める ###
def top_k_heap(nums, k)
  # 最小ヒープを初期化する
  # すべての要素の符号を反転し、最大ヒープで最小ヒープを模擬する
  max_heap = MaxHeap.new([])

  # 配列の先頭 k 個の要素をヒープに入れる
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # k+1 番目の要素からはヒープのサイズを k に保つ
  for i in k...nums.length
    # 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### 実行例 ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "上位 #{k} 個の要素："
  print_heap(res)
end
