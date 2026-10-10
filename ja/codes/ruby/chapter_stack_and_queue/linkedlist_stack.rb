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

  ### スタックが空か判定 ###
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

  ### スタックトップ要素を参照 ###
  def peek
    raise IndexError, 'スタックは空です' if is_empty?

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

### Driver Code ###
if __FILE__ == $0
  # スタックを初期化
  stack = LinkedListStack.new

  # 要素をプッシュ
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "スタック stack = #{stack.to_array}"

  # スタックトップの要素にアクセス
  peek = stack.peek
  puts "スタックトップ要素 peek = #{peek}"

  # 要素をポップ
  pop = stack.pop
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後 stack = #{stack.to_array}"

  # スタックの長さを取得
  size = stack.size
  puts "スタックの長さ size = #{size}"

  # 空かどうかを判定
  is_empty = stack.is_empty?
  puts "スタックが空かどうか = #{is_empty}"
end
