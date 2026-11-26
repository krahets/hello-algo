=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 双方向連結リストのノード ###
class ListNode
  attr_accessor :val
  attr_accessor :next # 次のノードへの参照
  attr_accessor :prev # 前のノードへの参照

  ### 初期化メソッド ###
  def initialize(val)
    @val = val
  end
end

### 双方向連結リストを使った両端キュー ###
class LinkedListDeque
  ### 両端キューの要素数を取得する ###
  attr_reader :size

  ### 初期化メソッド ###
  def initialize
    @front = nil  # 先頭ノード front
    @rear = nil   # 末尾ノード rear
    @size = 0     # 両端キューの要素数
  end

  ### 両端キューが空かどうかを判定する ###
  def is_empty?
    size.zero?
  end

  ### 両端キューに要素を追加する ###
  def push(num, is_front)
    node = ListNode.new(num)
    # リストが空なら、front と rear の両方が node を指すようにする
    if is_empty?
      @front = @rear = node
    # 先頭に追加する
    elsif is_front
      # node をリストの先頭に追加する
      @front.prev = node
      node.next = @front
      @front = node # 先頭ノードを更新する
    # 末尾に追加する
    else
      # node をリストの末尾に追加する
      @rear.next = node
      node.prev = @rear
      @rear = node # 末尾ノードを更新する
    end
    @size += 1 # 両端キューの要素数を更新する
  end

  ### 先頭に追加する ###
  def push_first(num)
    push(num, true)
  end

  ### 末尾に追加する ###
  def push_last(num)
    push(num, false)
  end

  ### 両端キューから要素を取り出す ###
  def pop(is_front)
    raise IndexError, '両端キューが空です' if is_empty?

    # 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # 先頭から取り出す
    elsif is_front
      val = @front.val # 先頭ノードの値を一時的に保存する
      # 先頭ノードを削除する
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # 先頭ノードを更新する
    # 末尾から取り出す
    else
      val = @rear.val # 末尾ノードの値を一時的に保存する
      # 末尾ノードを削除する
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # 末尾ノードを更新する
    end
    @size -= 1 # 両端キューの要素数を更新する

    val
  end

  ### 先頭から取り出す ###
  def pop_first
    pop(true)
  end

  ### 末尾から取り出す ###
  def pop_last
    pop(false)
  end

  ### 両端キューの先頭要素を参照する ###
  def peek_first
    raise IndexError, '両端キューが空です' if is_empty?

    @front.val
  end

  ### 両端キューの末尾要素を参照する ###
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

### 実行例 ###
if __FILE__ == $0
  # 両端キューを初期化する
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "両端キュー deque = #{deque.to_array}"

  # 要素を参照する
  peek_first = deque.peek_first
  puts "先頭要素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "末尾要素 peek_last = #{peek_last}"

  # 要素を両端キューに追加する
  deque.push_last(4)
  puts "末尾に 4 を追加した後の deque = #{deque.to_array}"
  deque.push_first(1)
  puts "先頭に 1 を追加した後の deque = #{deque.to_array}"

  # 両端キューから要素を取り出す
  pop_last = deque.pop_last
  puts "末尾から取り出した要素 = #{pop_last}、 末尾から取り出した後の deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "先頭から取り出した要素 = #{pop_first}、先頭から取り出した後の deque = #{deque.to_array}"

  # 両端キューの要素数を取得する
  size = deque.size
  puts "両端キューの要素数 size = #{size}"

  # 両端キューが空かどうかを判定する
  is_empty = deque.is_empty?
  puts "両端キューは空か = #{is_empty}"
end
