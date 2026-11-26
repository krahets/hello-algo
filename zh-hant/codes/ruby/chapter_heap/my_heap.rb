=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 最大堆積 ###
class MaxHeap
  attr_reader :max_heap

  ### 建構式，根據輸入串列建立堆積 ###
  def initialize(nums)
    # 將串列元素依原順序全部加入堆積
    @max_heap = nums
    # 從每個非葉節點向下調整堆積
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 取得左子節點的索引 ###
  def left(i)
    2 * i + 1
  end

  ### 取得右子節點的索引 ###
  def right(i)
    2 * i + 2
  end

  ### 取得父節點的索引 ###
  def parent(i)
    (i - 1) / 2     # 向下取整的整數除法
  end

  ### 交換元素 ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### 取得堆積大小 ###
  def size
    @max_heap.length
  end

  ### 判斷堆積是否為空 ###
  def is_empty?
    size == 0
  end

  ### 讀取堆積頂端元素 ###
  def peek
    @max_heap[0]
  end

  ### 將元素加入堆積 ###
  def push(val)
    # 新增節點
    @max_heap << val
    # 由下往上調整堆積
    sift_up(size - 1)
  end

  ### 從節點 i 開始向上調整堆積 ###
  def sift_up(i)
    loop do
      # 取得節點 i 的父節點
      p = parent(i)
      # 若已越過根節點，或節點已符合堆積性質，就結束調整
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 交換兩個節點
      swap(i, p)
      # 繼續向上調整堆積
      i = p
    end
  end

  ### 從堆積取出元素 ###
  def pop
    # 檢查堆積是否為空
    raise IndexError, "堆積為空" if is_empty?
    # 交換根節點與最右側的葉節點（即首尾兩個元素）
    swap(0, size - 1)
    # 刪除節點
    val = @max_heap.pop
    # 由上往下調整堆積
    sift_down(0)
    # 回傳堆積頂端元素
    val
  end

  ### 從節點 i 開始向下調整堆積 ###
  def sift_down(i)
    loop do
      # 找出節點 i、l、r 中值最大的節點，記為 ma
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
      break if ma == i

      # 交換兩個節點
      swap(i, ma)
      # 繼續向下調整堆積
      i = ma
    end
  end

  ### 印出堆積（二元樹）###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化最大堆積
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\n用輸入串列建立堆積後"
  max_heap.__print__

  # 取得堆積頂端元素
  peek = max_heap.peek
  puts "\n堆積頂端元素為 #{peek}"

  # 將元素加入堆積
  val = 7
  max_heap.push(val)
  puts "\n將元素 #{val} 加入堆積後"
  max_heap.__print__

  # 取出堆積頂端元素
  peek = max_heap.pop
  puts "\n取出堆積頂端元素 #{peek} 後"
  max_heap.__print__

  # 取得堆積大小
  size = max_heap.size
  puts "\n堆積中的元素個數為 #{size}"

  # 判斷堆積是否為空
  is_empty = max_heap.is_empty?
  puts "\n堆積是否為空 #{is_empty}"
end
