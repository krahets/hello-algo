=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 両端キューを初期化する
  # Ruby には組み込みの両端キューがないため、Array を両端キューとして使う
  deque = []

  # 要素をキューに入れる
  deque << 2
  deque << 5
  deque << 4
  # 注意：配列であるため、Array#unshift メソッドの時間計算量は O(n) です
  deque.unshift(3)
  deque.unshift(1)
  puts "両端キュー deque = #{deque}"

  # 要素にアクセス
  peek_first = deque.first
  puts "先頭要素 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "末尾要素 peek_last = #{peek_last}"

  # 要素をキューから取り出す
  # 配列であるため、Array#shift メソッドの時間計算量は O(n) である
  pop_front = deque.shift
  puts "先頭から取り出した要素 pop_front = #{pop_front}，先頭から取り出した後 deque = #{deque}"
  pop_back = deque.pop
  puts "末尾から取り出した要素 pop_back = #{pop_back}, 末尾から取り出した後 deque = #{deque}"

  # 両端キューの長さを取得
  size = deque.length
  puts "両端キューの長さ size = #{size}"

  # 両端キューが空かどうかを判定
  is_empty = size.zero?
  puts "両端キューが空かどうか = #{is_empty}"
end
