=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # [region]{init_deque}
  # 両端キューを初期化する
  # Ruby には組み込みの両端キューがないため、Array を両端キューとして使うしかない
  deque = []
  # [endregion]{init_deque}

  # [region]{push}
  # 要素をエンキューする
  deque << 2
  deque << 5
  deque << 4
  # 配列なので Array#unshift メソッドの時間計算量は O(n) であることに注意
  deque.unshift(3)
  deque.unshift(1)
  # [endregion]{push}
  puts "両端キュー deque = #{deque}"

  # [region]{peek_first}
  # 要素にアクセスする
  peek_first = deque.first
  # [endregion]{peek_first}
  puts "キューの先頭要素 peek_first = #{peek_first}"
  # [region]{peek_last}
  peek_last = deque.last
  # [endregion]{peek_last}
  puts "キューの末尾要素 peek_last = #{peek_last}"

  # [region]{pop_first}
  # 要素をデキューする
  # 配列なので Array#shift メソッドの時間計算量は O(n) であることに注意
  pop_front = deque.shift
  # [endregion]{pop_first}
  puts "先頭からデキューした要素 pop_front = #{pop_front}、先頭からデキューした後 deque = #{deque}"
  # [region]{pop_last}
  pop_back = deque.pop
  # [endregion]{pop_last}
  puts "末尾からデキューした要素 pop_back = #{pop_back}, 末尾からデキューした後 deque = #{deque}"

  # [region]{size}
  # 両端キューの長さを取得する
  size = deque.length
  # [endregion]{size}
  puts "両端キューの長さ size = #{size}"

  # [region]{is_empty}
  # 両端キューが空かどうかを判定する
  is_empty = size.zero?
  # [endregion]{is_empty}
  puts "両端キューは空か = #{is_empty}"
end
