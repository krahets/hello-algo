=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 連結リストを使ったキュー ###
class LinkedListQueue
  ### キューの要素数を取得する ###
  attr_reader :size

  ### 初期化メソッド ###
  def initialize
    @front = nil  # 先頭ノード front
    @rear = nil   # 末尾ノード rear
    @size = 0
  end

  ### キューが空かどうかを判定する ###
  def is_empty?
    @front.nil?
  end

  ### エンキューする ###
  def push(num)
    # 値が num のノードを末尾ノードの後ろに追加する
    node = ListNode.new(num)

    # キューが空なら、先頭と末尾の両方がこのノードを指すようにする
    if @front.nil?
      @front = node
      @rear = node
    # キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### デキューする ###
  def pop
    num = peek
    # 先頭ノードを削除する
    @front = @front.next
    @size -= 1
    num
  end

  ### キューの先頭要素を参照する ###
  def peek
    raise IndexError, 'キューが空です' if is_empty?

    @front.val
  end

  ### 連結リストを配列に変換して返す ###
  def to_array
    queue = []
    temp = @front
    while temp
      queue << temp.val
      temp = temp.next
    end
    queue
  end
end

### 実行例 ###
if __FILE__ == $0
  # キューを初期化する
  queue = LinkedListQueue.new

  # 要素をキューに追加する
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue.to_array}"

  # キューの先頭要素を参照する
  peek = queue.peek
  puts "先頭要素 front = #{peek}"

  # キューから要素を取り出す
  pop_front = queue.pop
  puts "デキューした要素 pop = #{pop_front}"
  puts "デキュー後の queue = #{queue.to_array}"

  # キューの要素数を取得する
  size = queue.size
  puts "キューの要素数 size = #{size}"

  # キューが空かどうかを判定する
  is_empty = queue.is_empty?
  puts "キューは空か = #{is_empty}"
end
