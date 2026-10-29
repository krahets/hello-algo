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

  ### スタックの長さを取得する ###
  def size
    @stack.length
  end

  ### スタックが空かどうかを判定する ###
  def is_empty?
    @stack.empty?
  end

  ### プッシュ ###
  def push(item)
    @stack << item
  end

  ### ポップ ###
  def pop
    raise IndexError, 'スタックが空です' if is_empty?

    @stack.pop
  end

  ### スタックの先頭要素にアクセスする ###
  def peek
    raise IndexError, 'スタックが空です' if is_empty?

    @stack.last
  end

  ### 表示用のリストを返す ###
  def to_array
    @stack
  end
end

### 実行用コード ###
if __FILE__ == $0
  # スタックを初期化する
  stack = ArrayStack.new

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
