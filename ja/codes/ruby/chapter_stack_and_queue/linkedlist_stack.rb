=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 連結リストを使ったスタック ###
class LinkedListStack
  attr_reader :size

  ### 初期化メソッド ###
  def initialize
    @size = 0
  end

  ### スタックが空かどうかを判定する ###
  def is_empty?
    @peek.nil?
  end

  ### プッシュする ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### ポップする ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### スタックのトップを参照する ###
  def peek
    raise IndexError, 'スタックが空です' if is_empty?

    @peek.val
  end

  ### 連結リストを配列に変換して返す ###
  def to_array
    arr = []
    node = @peek
    while node
      arr << node.val
      node = node.next
    end
    arr.reverse
  end
end

### 実行例 ###
if __FILE__ == $0
  # スタックを初期化する
  stack = LinkedListStack.new

  # 要素をプッシュする
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "スタック stack = #{stack.to_array}"

  # スタックのトップを参照する
  peek = stack.peek
  puts "スタックのトップの要素 peek = #{peek}"

  # 要素をポップする
  pop = stack.pop
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後の stack = #{stack.to_array}"

  # スタックの要素数を取得する
  size = stack.size
  puts "スタックの要素数 size = #{size}"

  # 空かどうかを判定する
  is_empty = stack.is_empty?
  puts "スタックは空か = #{is_empty}"
end
