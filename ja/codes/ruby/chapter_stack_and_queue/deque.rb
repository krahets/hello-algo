=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行例 ###
if __FILE__ == $0
  # 両端キューを初期化する
  # Ruby には組み込みの両端キューがなく、Array で代用するしかない
  deque = []

  # 要素を両端キューに追加する
  deque << 2
  deque << 5
  deque << 4
  # 配列を使うため、Array#unshift の時間計算量は O(n) になる点に注意
  deque.unshift(3)
  deque.unshift(1)
  puts "両端キュー deque = #{deque}"

  # 要素を参照する
  peek_first = deque.first
  puts "先頭要素 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "末尾要素 peek_last = #{peek_last}"

  # 両端キューから要素を取り出す
  # 配列を使うため、Array#shift の時間計算量は O(n) になる点に注意
  pop_front = deque.shift
  puts "先頭から取り出した要素 pop_front = #{pop_front}、先頭から取り出した後の deque = #{deque}"
  pop_back = deque.pop
  puts "末尾から取り出した要素 pop_back = #{pop_back}、 末尾から取り出した後の deque = #{deque}"

  # 両端キューの要素数を取得する
  size = deque.length
  puts "両端キューの要素数 size = #{size}"

  # 両端キューが空かどうかを判定する
  is_empty = size.zero?
  puts "両端キューは空か = #{is_empty}"
end
