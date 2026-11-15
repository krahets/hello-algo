=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # [region]{init_stack}
  # スタックを初期化する
  # Ruby には組み込みのスタッククラスがないため、Array をスタックとして使える
  stack = []
  # [endregion]{init_stack}

  # [region]{push}
  # 要素をプッシュする
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  # [endregion]{push}
  puts "スタック stack = #{stack}"

  # [region]{peek}
  # スタックの先頭要素にアクセスする
  peek = stack.last
  # [endregion]{peek}
  puts "スタックの先頭要素 peek = #{peek}"

  # [region]{pop}
  # 要素をポップする
  pop = stack.pop
  # [endregion]{pop}
  puts "ポップした要素 pop = #{pop}"
  puts "ポップ後 stack = #{stack}"

  # [region]{size}
  # スタックの長さを取得する
  size = stack.length
  # [endregion]{size}
  puts "スタックの長さ size = #{size}"

  # [region]{is_empty}
  # 空かどうかを判定する
  is_empty = stack.empty?
  # [endregion]{is_empty}
  puts "スタックは空か = #{is_empty}"
end
