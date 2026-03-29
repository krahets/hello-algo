=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # キューを初期化する
  # Ruby 組み込みのキュー（Thread::Queue）には peek と走査メソッドがないため、Array をキューとして使える
  queue = []

  # 要素をエンキュー
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue}"

  # キューの要素にアクセス
  peek = queue.first
  puts "先頭要素 peek = #{peek}"

  # 要素をキューから取り出す
  # 配列であるため、Array#shift メソッドの時間計算量は O(n) である
  pop = queue.shift
  puts "取り出した要素 pop = #{pop}"
  puts "取り出し後 queue = #{queue}"

  # キューの長さを取得
  size = queue.length
  puts "キューの長さ size = #{size}"

  # キューが空かどうかを判定
  is_empty = queue.empty?
  puts "キューが空かどうか = #{is_empty}"
end
