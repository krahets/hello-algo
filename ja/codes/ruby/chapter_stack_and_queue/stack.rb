=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # スタックを初期化する
  # Ruby には組み込みのスタッククラスがないため、Array をスタックとして使える
  stack = []

  # 要素をプッシュ
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "スタック stack = #{stack}"

  # スタックトップの要素にアクセス
  peek = stack.last
  puts "スタックトップ要素 peek = #{peek}"

  # 要素をポップ
  pop = stack.pop
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後 stack = #{stack}"

  # スタックの長さを取得
  size = stack.length
  puts "スタックの長さ size = #{size}"

  # 空かどうかを判定
  is_empty = stack.empty?
  puts "スタックが空かどうか = #{is_empty}"
end
