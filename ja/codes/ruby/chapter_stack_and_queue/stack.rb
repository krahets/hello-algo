=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # スタックを初期化する
  # Ruby には組み込みのスタッククラスがないため、Array をスタックとして使える
  stack = []

  # 要素をプッシュする
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "スタック stack = #{stack}"

  # スタックの先頭要素にアクセスする
  peek = stack.last
  puts "スタックの先頭要素 peek = #{peek}"

  # 要素をポップする
  pop = stack.pop
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後 stack = #{stack}"

  # スタックの長さを取得する
  size = stack.length
  puts "スタックの長さ size = #{size}"

  # 空かどうかを判定する
  is_empty = stack.empty?
  puts "スタックは空か = #{is_empty}"
end
