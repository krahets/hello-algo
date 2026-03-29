=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## 双方向連結リストノード
class ListNode
  attr_accessor :val
  attr_accessor :next # 後続ノードへの参照
  attr_accessor :prev # 前ノードへの参照

  ### コンストラクタ ###
  def initialize(val)
    @val = val
  end
end

### 双方向連結リストで実装した両端キュー ###
class LinkedListDeque
  ### 両端キューの長さを取得 ###
  attr_reader :size

  ### コンストラクタ ###
  def initialize
    @front = nil  # 先頭ノード front
    @rear = nil   # 末尾ノード rear
    @size = 0     # 両端キューの長さ
  end

  ### 両端キューが空か判定 ###
  def is_empty?
    size.zero?
  end

  ### エンキュー操作 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 連結リストが空なら、`front` と `rear` の両方を `node` に向ける
    if is_empty?
      @front = @rear = node
    # 先頭へのエンキュー操作
    elsif is_front
      # node を連結リストの先頭に追加
      @front.prev = node
      node.next = @front
      @front = node # 先頭ノードを更新する
    # 末尾へのエンキュー操作
    else
      # node を連結リストの末尾に追加
      @rear.next = node
      node.prev = @rear
      @rear = node # 末尾ノードを更新する
    end
    @size += 1 # キューの長さを更新
  end

  ### キュー先頭に追加 ###
  def push_first(num)
    push(num, true)
  end

  ### キュー末尾に追加 ###
  def push_last(num)
    push(num, false)
  end

  ### デキュー操作 ###
  def pop(is_front)
    raise IndexError, '両端キューは空です' if is_empty?

    # キュー先頭からの取り出し
    if is_front
      val = @front.val # 先頭ノードの値を一時保存
      # 先頭ノードを削除
      fnext = @front.next
      unless fnext.nil?
        fnext.prev = nil
        @front.next = nil
      end
      @front = fnext # 先頭ノードを更新する
    # キュー末尾からの取り出し
    else
      val = @rear.val # 末尾ノードの値を一時保存
      # 末尾ノードを削除
      rprev = @rear.prev
      unless rprev.nil?
        rprev.next = nil
        @rear.prev = nil
      end
      @rear = rprev # 末尾ノードを更新する
    end
    @size -= 1 # キューの長さを更新

    val
  end

  ### キュー先頭から取り出す ###
  def pop_first
    pop(true)
  end

  ### キュー先頭から取り出す ###
  def pop_last
    pop(false)
  end

  ### 先頭要素にアクセス ###
  def peek_first
    raise IndexError, '両端キューは空です' if is_empty?

    @front.val
  end

  ### キュー末尾要素を参照 ###
  def peek_last
    raise IndexError, '両端キューは空です' if is_empty?

    @rear.val
  end

  ### 表示用の配列を返す ###
  def to_array
    node = @front
    res = Array.new(size, 0)
    for i in 0...size
      res[i] = node.val
      node = node.next
    end
    res
  end
end

### Driver Code ###
if __FILE__ == $0
  # 両端キューを初期化
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "両端キュー deque = #{deque.to_array}"

  # 要素にアクセス
  peek_first = deque.peek_first
  puts "先頭要素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "先頭要素 peek_last = #{peek_last}"

  # 要素をエンキュー
  deque.push_last(4)
  puts "要素 4 を末尾に追加後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "要素 1 を先頭に追加後 deque = #{deque.to_array}"

  # 要素をデキュー
  pop_last = deque.pop_last
  puts "末尾から取り出した要素 = #{pop_last}, 末尾から取り出した後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "先頭から取り出した要素 = #{pop_first}，先頭から取り出した後 deque = #{deque.to_array}"

  # 両端キューの長さを取得
  size = deque.size
  puts "両端キューの長さ size = #{size}"

  # 両端キューが空かどうかを判定
  is_empty = deque.is_empty?
  puts "両端キューが空かどうか = #{is_empty}"
end
