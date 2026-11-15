=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # 両端キューを初期化する
  # Ruby には組み込みの両端キューがないため、Array を両端キューとして使うしかない
  deque = []

  # 要素をエンキューする
  deque << 2
  deque << 5
  deque << 4
  # 配列なので Array#unshift メソッドの時間計算量は O(n) であることに注意
  deque.unshift(3)
  deque.unshift(1)
  puts "両端キュー deque = #{deque}"

  # 要素にアクセスする
  peek_first = deque.first
  puts "キューの先頭要素 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "キューの末尾要素 peek_last = #{peek_last}"

  # 要素をデキューする
  # 配列なので Array#shift メソッドの時間計算量は O(n) であることに注意
  pop_front = deque.shift
  puts "先頭からデキューした要素 pop_front = #{pop_front}、先頭からデキューした後 deque = #{deque}"
  pop_back = deque.pop
  puts "末尾からデキューした要素 pop_back = #{pop_back}, 末尾からデキューした後 deque = #{deque}"

  # 両端キューの長さを取得する
  size = deque.length
  puts "両端キューの長さ size = #{size}"

  # 両端キューが空かどうかを判定する
  is_empty = size.zero?
  puts "両端キューは空か = #{is_empty}"
end
