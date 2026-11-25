=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行例 ###
if __FILE__ == $0
  # スタックを初期化する
  # Ruby には組み込みのスタッククラスがないので、Array をスタックとして使える
  stack = []

  # 要素をプッシュする
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "スタック stack = #{stack}"

  # スタックのトップを参照する
  peek = stack.last
  puts "スタックのトップの要素 peek = #{peek}"

  # 要素をポップする
  pop = stack.pop
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後の stack = #{stack}"

  # スタックの要素数を取得する
  size = stack.length
  puts "スタックの要素数 size = #{size}"

  # 空かどうかを判定する
  is_empty = stack.empty?
  puts "スタックは空か = #{is_empty}"
end
