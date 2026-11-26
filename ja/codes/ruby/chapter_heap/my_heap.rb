=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 最大ヒープ ###
class MaxHeap
  attr_reader :max_heap

  ### 入力リストからヒープを構築するコンストラクタ ###
  def initialize(nums)
    # リストの要素をそのままヒープに追加する
    @max_heap = nums
    # 葉以外のすべてのノードをヒープ化する
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 左の子のインデックスを取得する ###
  def left(i)
    2 * i + 1
  end

  ### 右の子のインデックスを取得する ###
  def right(i)
    2 * i + 2
  end

  ### 親のインデックスを取得する ###
  def parent(i)
    (i - 1) / 2     # 商を負の無限大方向に切り捨てる
  end

  ### 要素を交換する ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### ヒープのサイズを取得する ###
  def size
    @max_heap.length
  end

  ### ヒープが空か判定する ###
  def is_empty?
    size == 0
  end

  ### ヒープの根の要素を参照する ###
  def peek
    @max_heap[0]
  end

  ### 要素をヒープに挿入する ###
  def push(val)
    # ノードを追加する
    @max_heap << val
    # 上に向かってヒープ化する
    sift_up(size - 1)
  end

  ### ノード i から上に向かってヒープ化する ###
  def sift_up(i)
    loop do
      # ノード i の親を取得する
      p = parent(i)
      # 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 2 つのノードを交換する
      swap(i, p)
      # 上へのヒープ化を繰り返す
      i = p
    end
  end

  ### 根の要素をヒープから取り出す ###
  def pop
    # 空の場合の処理
    raise IndexError, "ヒープが空です" if is_empty?
    # 根と最も右の葉（先頭要素と末尾要素）を交換する
    swap(0, size - 1)
    # ノードを削除する
    val = @max_heap.pop
    # 下に向かってヒープ化する
    sift_down(0)
    # 根の要素を返す
    val
  end

  ### ノード i から下に向かってヒープ化する ###
  def sift_down(i)
    loop do
      # ノード i、l、r のうち値が最大のものを ma とする
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
      break if ma == i

      # 2 つのノードを交換する
      swap(i, ma)
      # 下へのヒープ化を繰り返す
      i = ma
    end
  end

  ### ヒープを二分木として表示する###
  def __print__
    print_heap(@max_heap)
  end
end

### 実行例 ###
if __FILE__ == $0
  # 最大ヒープを初期化する
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\n入力リストから構築したヒープ："
  max_heap.__print__

  # ヒープの根の要素を取得する
  peek = max_heap.peek
  puts "\nヒープの根の要素：#{peek}"

  # 要素をヒープに挿入する
  val = 7
  max_heap.push(val)
  puts "\n要素 #{val} の挿入後："
  max_heap.__print__

  # 根の要素を取り出す
  peek = max_heap.pop
  puts "\n根の要素 #{peek} を取り出した後："
  max_heap.__print__

  # ヒープのサイズを取得する
  size = max_heap.size
  puts "\nヒープの要素数：#{size}"

  # ヒープが空か判定する
  is_empty = max_heap.is_empty?
  puts "\nヒープは空か：#{is_empty}"
end
