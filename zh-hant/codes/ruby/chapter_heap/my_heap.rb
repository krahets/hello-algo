=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 大頂堆積 ###
class MaxHeap
  attr_reader :max_heap

  ### 建構子，根據輸入串列建堆積 ###
  def initialize(nums)
    # 將串列元素原封不動新增進堆積
    @max_heap = nums
    # 堆積化除葉節點以外的其他所有節點
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 獲取左子節點的索引 ###
  def left(i)
    2 * i + 1
  end

  ### 獲取右子節點的索引 ###
  def right(i)
    2 * i + 2
  end

  ### 獲取父節點的索引 ###
  def parent(i)
    (i - 1) / 2     # 向下整除
  end

  ### 交換元素 ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### 獲取堆積大小 ###
  def size
    @max_heap.length
  end

  ### 判斷堆積是否為空 ###
  def is_empty?
    size == 0
  end

  ### 訪問堆積頂元素 ###
  def peek
    @max_heap[0]
  end

  ### 元素入堆積 ###
  def push(val)
    # 新增節點
    @max_heap << val
    # 從底至頂堆積化
    sift_up(size - 1)
  end

  ### 從節點 i 開始，從底至頂堆積化 ###
  def sift_up(i)
    loop do
      # 獲取節點 i 的父節點
      p = parent(i)
      # 當“越過根節點”或“節點無須修復”時，結束堆積化
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 交換兩節點
      swap(i, p)
      # 迴圈向上堆積化
      i = p
    end
  end

  ### 元素出堆積 ###
  def pop
    # 判空處理
    raise IndexError, "堆積為空" if is_empty?
    # 交換根節點與最右葉節點（交換首元素與尾元素）
    swap(0, size - 1)
    # 刪除節點
    val = @max_heap.pop
    # 從頂至底堆積化
    sift_down(0)
    # 返回堆積頂元素
    val
  end

  ### 從節點 i 開始，從頂至底堆積化 ###
  def sift_down(i)
    loop do
      # 判斷節點 i, l, r 中值最大的節點，記為 ma
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
      break if ma == i

      # 交換兩節點
      swap(i, ma)
      # 迴圈向下堆積化
      i = ma
    end
  end

  ### 列印堆積（二元樹）###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化大頂堆積
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\n輸入串列並建堆積後"
  max_heap.__print__

  # 獲取堆積頂元素
  peek = max_heap.peek
  puts "\n堆積頂元素為 #{peek}"

  # 元素入堆積
  val = 7
  max_heap.push(val)
  puts "\n元素 #{val} 入堆積後"
  max_heap.__print__

  # 堆積頂元素出堆積
  peek = max_heap.pop
  puts "\n堆積頂元素 #{peek} 出堆積後"
  max_heap.__print__

  # 獲取堆積大小
  size = max_heap.size
  puts "\n堆積元素數量為 #{size}"

  # 判斷堆積是否為空
  is_empty = max_heap.is_empty?
  puts "\n堆積是否為空 #{is_empty}"
end
