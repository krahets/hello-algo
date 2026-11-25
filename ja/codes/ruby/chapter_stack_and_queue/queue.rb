=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行例 ###
if __FILE__ == $0
  # キューを初期化する
  # Ruby 組み込みのキュー（Thread::Queue）には peek メソッドも要素を順にたどるメソッドもないので、Array をキューとして使える
  queue = []

  # 要素をキューに追加する
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue}"

  # キューの要素を参照する
  peek = queue.first
  puts "先頭要素 peek = #{peek}"

  # キューから要素を取り出す
  # 配列を使うため、Array#shift の時間計算量は O(n) になる点に注意
  pop = queue.shift
  puts "デキューした要素 pop = #{pop}"
  puts "デキュー後の queue = #{queue}"

  # キューの要素数を取得する
  size = queue.length
  puts "キューの要素数 size = #{size}"

  # キューが空かどうかを判定する
  is_empty = queue.empty?
  puts "キューは空か = #{is_empty}"
end
