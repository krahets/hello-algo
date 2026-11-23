=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 最大ヒープ ###
class MaxHeap
  attr_reader :max_heap

  ### コンストラクタ：入力リストからヒープを構築する ###
  def initialize(nums)
    # リストの要素をそのままヒープに追加する
    @max_heap = nums
    # 葉ノード以外の全ノードをヒープ化する
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 左の子のインデックスを取得 ###
  def left(i)
    2 * i + 1
  end

  ### 右の子のインデックスを取得 ###
  def right(i)
    2 * i + 2
  end

  ### 親のインデックスを取得 ###
  def parent(i)
    (i - 1) / 2     # 切り捨て除算
  end

  ### 要素を交換する ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### ヒープのサイズを取得する ###
  def size
    @max_heap.length
  end

  ### ヒープが空か判定 ###
  def is_empty?
    size == 0
  end

  ### ヒープの先頭要素にアクセスする ###
  def peek
    @max_heap[0]
  end

  ### ヒープに要素を挿入する ###
  def push(val)
    # ノードを追加する
    @max_heap << val
    # 下から上へヒープ化する
    sift_up(size - 1)
  end

  ### ノード i から上向きにヒープ化する ###
  def sift_up(i)
    loop do
      # ノード i の親ノードを取得する
      p = parent(i)
      # 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 2 つのノードを交換する
      swap(i, p)
      # 上向きのヒープ化を繰り返す
      i = p
    end
  end

  ### ヒープから要素を取り出す ###
  def pop
    # 空かどうかを確認する
    raise IndexError, "ヒープが空です" if is_empty?
    # 根と最右の葉を交換（先頭要素と末尾要素を交換）
    swap(0, size - 1)
    # ノードを削除する
    val = @max_heap.pop
    # 上から下へヒープ化する
    sift_down(0)
    # ヒープの先頭要素を返す
    val
  end

  ### ノード i から下向きにヒープ化する ###
  def sift_down(i)
    loop do
      # ノード i, l, r のうち値が最大のノードを求め、ma とする
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
      break if ma == i

      # 2 つのノードを交換する
      swap(i, ma)
      # 下向きのヒープ化を繰り返す
      i = ma
    end
  end

  ### ヒープ（二分木）を表示する###
  def __print__
    print_heap(@max_heap)
  end
end

### 実行用コード ###
if __FILE__ == $0
  # 最大ヒープを初期化する
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nリストを入力してヒープを構築した後"
  max_heap.__print__

  # ヒープの先頭要素を取得する
  peek = max_heap.peek
  puts "\nヒープの先頭要素は #{peek}"

  # ヒープに要素を挿入する
  val = 7
  max_heap.push(val)
  puts "\n要素 #{val} をヒープに挿入した後"
  max_heap.__print__

  # ヒープの先頭要素を取り出す
  peek = max_heap.pop
  puts "\nヒープの先頭要素 #{peek} を取り出した後"
  max_heap.__print__

  # ヒープのサイズを取得する
  size = max_heap.size
  puts "\nヒープの要素数は #{size}"

  # ヒープが空か判定
  is_empty = max_heap.is_empty?
  puts "\nヒープは空か #{is_empty}"
end
