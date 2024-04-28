=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 大顶堆 ###
class MaxHeap
  attr_reader :max_heap

  ### 构造方法，根据输入列表建堆 ###
  def initialize(nums)
    # 将列表元素原封不动添加进堆
    @max_heap = nums
    # 堆化除叶节点以外的其他所有节点
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 获取左子节点的索引 ###
  def left(i)
    2 * i + 1
  end

  ### 获取右子节点的索引 ###
  def right(i)
    2 * i + 2
  end

  ### 获取父节点的索引 ###
  def parent(i)
    (i - 1) / 2     # 向下整除
  end

  ### 交换元素 ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### 获取堆大小 ###
  def size
    @max_heap.length
  end

  ### 判断堆是否为空 ###
  def is_empty?
    size == 0
  end

  ### 访问堆顶元素 ###
  def peek
    @max_heap[0]
  end

  ### 元素入堆 ###
  def push(val)
    # 添加节点
    @max_heap << val
    # 从底至顶堆化
    sift_up(size - 1)
  end

  ### 从节点 i 开始，从底至顶堆化 ###
  def sift_up(i)
    loop do
      # 获取节点 i 的父节点
      p = parent(i)
      # 当“越过根节点”或“节点无须修复”时，结束堆化
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 交换两节点
      swap(i, p)
      # 循环向上堆化
      i = p
    end
  end

  ### 元素出堆 ###
  def pop
    # 判空处理
    raise IndexError, "堆为空" if is_empty?
    # 交换根节点与最右叶节点（交换首元素与尾元素）
    swap(0, size - 1)
    # 删除节点
    val = @max_heap.pop
    # 从顶至底堆化
    sift_down(0)
    # 返回堆顶元素
    val
  end

  ### 从节点 i 开始，从顶至底堆化 ###
  def sift_down(i)
    loop do
      # 判断节点 i, l, r 中值最大的节点，记为 ma
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
      break if ma == i

      # 交换两节点
      swap(i, ma)
      # 循环向下堆化
      i = ma
    end
  end

  ### 打印堆（二叉树）###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化大顶堆
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\n输入列表并建堆后"
  max_heap.__print__

  # 获取堆顶元素
  peek = max_heap.peek
  puts "\n堆顶元素为 #{peek}"

  # 元素入堆
  val = 7
  max_heap.push(val)
  puts "\n元素 #{val} 入堆后"
  max_heap.__print__

  # 堆顶元素出堆
  peek = max_heap.pop
  puts "\n堆顶元素 #{peek} 出堆后"
  max_heap.__print__

  # 获取堆大小
  size = max_heap.size
  puts "\n堆元素数量为 #{size}"

  # 判断堆是否为空
  is_empty = max_heap.is_empty?
  puts "\n堆是否为空 #{is_empty}"
end
