=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # キューを初期化する
  # Ruby の組み込みキュー（Thread::Queue）には peek と走査のメソッドがないため、Array をキューとして使える
  queue = []

  # 要素をエンキューする
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue}"

  # キューの要素にアクセスする
  peek = queue.first
  puts "キューの先頭要素 peek = #{peek}"

  # 要素をデキューする
  # 配列なので Array#shift メソッドの時間計算量は O(n) であることに注意
  pop = queue.shift
  puts "デキューした要素 pop = #{pop}"
  puts "デキュー後 queue = #{queue}"

  # キューの長さを取得
  size = queue.length
  puts "キューの長さ size = #{size}"

  # キューが空か判定
  is_empty = queue.empty?
  puts "キューは空か = #{is_empty}"
end
