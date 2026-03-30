=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 配列で実装したスタック ###
class ArrayStack
  ### コンストラクタ ###
  def initialize
    @stack = []
  end

  ### スタックの長さを取得 ###
  def size
    @stack.length
  end

  ### スタックが空か判定 ###
  def is_empty?
    @stack.empty?
  end

  ### プッシュ ###
  def push(item)
    @stack << item
  end

  ### ポップ ###
  def pop
    raise IndexError, 'スタックは空です' if is_empty?

    @stack.pop
  end

  ### スタックトップ要素を参照 ###
  def peek
    raise IndexError, 'スタックは空です' if is_empty?

    @stack.last
  end

  ### 表示用のリストを返す ###
  def to_array
    @stack
  end
end

### Driver Code ###
if __FILE__ == $0
  # スタックを初期化
  stack = ArrayStack.new

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
