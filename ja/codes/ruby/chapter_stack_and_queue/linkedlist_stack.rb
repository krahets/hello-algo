=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 連結リストで実装したスタック ###
class LinkedListStack
  attr_reader :size

  ### コンストラクタ ###
  def initialize
    @size = 0
  end

  ### スタックが空かどうかを判定する ###
  def is_empty?
    @peek.nil?
  end

  ### プッシュ ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### ポップ ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### スタックの先頭要素にアクセスする ###
  def peek
    raise IndexError, 'スタックが空です' if is_empty?

    @peek.val
  end

  ### 連結リストを Array に変換して返す ###
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

### 実行用コード ###
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

  # スタックの先頭要素にアクセスする
  peek = stack.peek
  puts "スタックの先頭要素 peek = #{peek}"

  # 要素をポップする
  pop = stack.pop
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後 stack = #{stack.to_array}"

  # スタックの長さを取得する
  size = stack.size
  puts "スタックの長さ size = #{size}"

  # 空かどうかを判定する
  is_empty = stack.is_empty?
  puts "スタックは空か = #{is_empty}"
end
