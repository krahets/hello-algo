=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### ヒープに要素を挿入する ###
def push_min_heap(heap, val)
  # 要素の符号を反転する
  heap.push(-val)
end

### ヒープから要素を取り出す ###
def pop_min_heap(heap)
  # 要素の符号を反転する
  -heap.pop
end

### ヒープの先頭要素にアクセスする ###
def peek_min_heap(heap)
  # 要素の符号を反転する
  -heap.peek
end

### ヒープ内の要素を取り出す ###
def get_min_heap(heap)
  # ヒープの全要素の符号を反転する
  heap.max_heap.map { |x| -x }
end

### ヒープを使って配列内の大きいほうから k 個の要素を求める ###
def top_k_heap(nums, k)
  # 最小ヒープを初期化する
  # 注意：ヒープの全要素の符号を反転することで、最大ヒープを使って最小ヒープを再現する
  max_heap = MaxHeap.new([])

  # 配列の先頭 k 個の要素をヒープに挿入する
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # k+1 番目の要素から始め、ヒープの長さを k に保つ
  for i in k...nums.length
    # 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### 実行用コード ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "大きいほうから #{k} 個の要素は"
  print_heap(res)
end
