=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 連結リストで実装したキュー ###
class LinkedListQueue
  ### キューの長さを取得 ###
  attr_reader :size

  ### コンストラクタ ###
  def initialize
    @front = nil  # 先頭ノード front
    @rear = nil   # 末尾ノード rear
    @size = 0
  end

  ### キューが空か判定 ###
  def is_empty?
    @front.nil?
  end

  ### エンキュー ###
  def push(num)
    # 末尾ノードの後ろに num を追加
    node = ListNode.new(num)

    # キューが空なら、先頭ノードと末尾ノードの両方をそのノードに向ける
    if @front.nil?
      @front = node
      @rear = node
    # キューが空でなければ、そのノードを末尾ノードの後ろに追加する
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### デキュー ###
  def pop
    num = peek
    # 先頭ノードを削除
    @front = @front.next
    @size -= 1
    num
  end

  ### 先頭要素にアクセス ###
  def peek
    raise IndexError, 'キューは空です' if is_empty?

    @front.val
  end

  ### 連結リストを Array に変換して返す ###
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

### Driver Code ###
if __FILE__ == $0
  # キューを初期化
  queue = LinkedListQueue.new

  # 要素をキューに入れる
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue.to_array}"

  # キュー先頭の要素にアクセス
  peek = queue.peek
  puts "先頭要素 front = #{peek}"

  # 要素をデキュー
  pop_front = queue.pop
  puts "取り出した要素 pop = #{pop_front}"
  puts "取り出し後 queue = #{queue.to_array}"

  # キューの長さを取得
  size = queue.size
  puts "キューの長さ size = #{size}"

  # キューが空かどうかを判定
  is_empty = queue.is_empty?
  puts "キューが空かどうか = #{is_empty}"
end
