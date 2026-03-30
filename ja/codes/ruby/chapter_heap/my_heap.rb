=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 最大ヒープ ###
class MaxHeap
  attr_reader :max_heap

  ### コンストラクタ。入力リストに基づいてヒープを構築 ###
  def initialize(nums)
    # リスト要素をそのままヒープに追加
    @max_heap = nums
    # 葉ノード以外のすべてのノードをヒープ化
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 左子ノードのインデックスを取得 ###
  def left(i)
    2 * i + 1
  end

  ### 右子ノードのインデックスを取得 ###
  def right(i)
    2 * i + 2
  end

  ### 親ノードのインデックスを取得 ###
  def parent(i)
    (i - 1) / 2     # 切り捨て除算
  end

  ### 要素を交換 ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### ヒープのサイズを取得 ###
  def size
    @max_heap.length
  end

  ### ヒープが空かどうかを判定 ###
  def is_empty?
    size == 0
  end

  ### ヒープ先頭要素を参照 ###
  def peek
    @max_heap[0]
  end

  ### 要素をヒープに挿入 ###
  def push(val)
    # ノードを追加
    @max_heap << val
    # 下から上へヒープ化
    sift_up(size - 1)
  end

  ### ノード i から下から上へヒープ化 ###
  def sift_up(i)
    loop do
      # ノード i の親ノードを取得
      p = parent(i)
      # 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 2 つのノードを交換
      swap(i, p)
      # ループで下から上へヒープ化
      i = p
    end
  end

  ### 要素をヒープから取り出す ###
  def pop
    # 空判定の処理
    raise IndexError, "ヒープが空です" if is_empty?
    # 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
    swap(0, size - 1)
    # ノードを削除
    val = @max_heap.pop
    # 上から下へヒープ化
    sift_down(0)
    # ヒープ先頭要素を返す
    val
  end

  ### ノード i から上から下へヒープ化 ###
  def sift_down(i)
    loop do
      # ノード i, l, r のうち値が最大のノードを ma とする
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
      break if ma == i

      # 2 つのノードを交換
      swap(i, ma)
      # ループで上から下へヒープ化
      i = ma
    end
  end

  # ## ヒープを表示（二分木）###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # 最大ヒープを初期化
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nリストを入力してヒープを構築した後"
  max_heap.__print__

  # ヒープ頂点の要素を取得
  peek = max_heap.peek
  puts "\nヒープの先頭要素は #{peek}"

  # 要素をヒープに追加
  val = 7
  max_heap.push(val)
  puts "\n要素 #{val} をヒープに追加した後"
  max_heap.__print__

  # ヒープ頂点の要素を取り出す
  peek = max_heap.pop
  puts "\nヒープの先頭要素 #{peek} を取り出した後"
  max_heap.__print__

  # ヒープのサイズを取得
  size = max_heap.size
  puts "\nヒープ要素数は #{size}"

  # ヒープが空かどうかを判定
  is_empty = max_heap.is_empty?
  puts "\nヒープが空かどうかは #{is_empty}"
end
