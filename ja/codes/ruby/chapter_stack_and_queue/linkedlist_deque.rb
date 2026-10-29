=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 双方向連結リストのノード
class ListNode
  attr_accessor :val
  attr_accessor :next # 後続ノードへの参照
  attr_accessor :prev # 前のノードへの参照

  ### コンストラクタ ###
  def initialize(val)
    @val = val
  end
end

### 双方向連結リストで実装した両端キュー ###
class LinkedListDeque
  ### 両端キューの長さを取得する ###
  attr_reader :size

  ### コンストラクタ ###
  def initialize
    @front = nil  # 先頭ノード front
    @rear = nil   # 末尾ノード rear
    @size = 0     # 両端キューの長さ
  end

  ### 両端キューが空かどうかを判定する ###
  def is_empty?
    size.zero?
  end

  ### エンキュー操作 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 連結リストが空の場合、front と rear の両方が node を指すようにする
    if is_empty?
      @front = @rear = node
    # 先頭へのエンキュー操作
    elsif is_front
      # node を連結リストの先頭に追加する
      @front.prev = node
      node.next = @front
      @front = node # 先頭ノードを更新する
    # 末尾へのエンキュー操作
    else
      # node を連結リストの末尾に追加する
      @rear.next = node
      node.prev = @rear
      @rear = node # 末尾ノードを更新する
    end
    @size += 1 # キューの長さを更新する
  end

  ### 先頭にエンキューする ###
  def push_first(num)
    push(num, true)
  end

  ### 末尾にエンキューする ###
  def push_last(num)
    push(num, false)
  end

  ### デキュー操作 ###
  def pop(is_front)
    raise IndexError, '両端キューが空です' if is_empty?

    # キューの長さが 1 のとき、先頭と末尾は同じノードを指す
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # 先頭からのデキュー操作
    elsif is_front
      val = @front.val # 先頭ノードの値を一時保存する
      # 先頭ノードを削除する
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # 先頭ノードを更新する
    # 末尾からのデキュー操作
    else
      val = @rear.val # 末尾ノードの値を一時保存する
      # 末尾ノードを削除する
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # 末尾ノードを更新する
    end
    @size -= 1 # キューの長さを更新する

    val
  end

  ### 先頭からデキューする ###
  def pop_first
    pop(true)
  end

  ### 先頭からデキューする ###
  def pop_last
    pop(false)
  end

  ### キューの先頭要素にアクセス ###
  def peek_first
    raise IndexError, '両端キューが空です' if is_empty?

    @front.val
  end

  ### キューの末尾要素にアクセスする ###
  def peek_last
    raise IndexError, '両端キューが空です' if is_empty?

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

### 実行用コード ###
if __FILE__ == $0
  # 両端キューを初期化する
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "両端キュー deque = #{deque.to_array}"

  # 要素にアクセスする
  peek_first = deque.peek_first
  puts "キューの先頭要素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "キューの先頭要素 peek_last = #{peek_last}"

  # 要素をエンキューする
  deque.push_last(4)
  puts "要素 4 を末尾にエンキューした後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "要素 1 を先頭にエンキューした後 deque = #{deque.to_array}"

  # 要素をデキューする
  pop_last = deque.pop_last
  puts "末尾からデキューした要素 = #{pop_last}, 末尾からデキューした後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "先頭からデキューした要素 = #{pop_first}、先頭からデキューした後 deque = #{deque.to_array}"

  # 両端キューの長さを取得する
  size = deque.size
  puts "両端キューの長さ size = #{size}"

  # 両端キューが空かどうかを判定する
  is_empty = deque.is_empty?
  puts "両端キューは空か = #{is_empty}"
end
