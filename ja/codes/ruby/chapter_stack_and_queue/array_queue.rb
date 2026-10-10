=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 循環配列で実装したキュー ###
class ArrayQueue
  ### キューの長さを取得 ###
  attr_reader :size

  ### コンストラクタ ###
  def initialize(size)
    @nums = Array.new(size, 0) # キュー要素を格納する配列
    @front = 0 # 先頭ポインタ。先頭要素を指す
    @size = 0 # キューの長さ
  end

  ### キューの容量を取得 ###
  def capacity
    @nums.length
  end

  ### キューが空か判定 ###
  def is_empty?
    size.zero?
  end

  ### エンキュー ###
  def push(num)
    raise IndexError, 'キューがいっぱいです' if size == capacity

    # 末尾ポインタを計算し、末尾インデックス + 1 を指す
    # 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
    rear = (@front + size) % capacity
    # num をキュー末尾に追加
    @nums[rear] = num
    @size += 1
  end

  ### デキュー ###
  def pop
    num = peek
    # 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### 先頭要素にアクセス ###
  def peek
    raise IndexError, 'キューは空です' if is_empty?

    @nums[@front]
  end

  ### 表示用のリストを返す ###
  def to_array
    res = Array.new(size, 0)
    j = @front

    for i in 0...size
      res[i] = @nums[j % capacity]
      j += 1
    end

    res
  end
end

### Driver Code ###
if __FILE__ == $0
  # キューを初期化
  queue = ArrayQueue.new(10)

  # 要素をエンキュー
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue.to_array}"

  # キュー先頭の要素にアクセス
  peek = queue.peek
  puts "先頭要素 peek = #{peek}"

  # 要素をデキュー
  pop = queue.pop
  puts "取り出した要素 pop = #{pop}"
  puts "取り出し後 queue = #{queue.to_array}"

  # キューの長さを取得
  size = queue.size
  puts "キューの長さ size = #{size}"

  # キューが空かどうかを判定
  is_empty = queue.is_empty?
  puts "キューが空かどうか = #{is_empty}"

  # 循環配列をテストする
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "第 #{i} 回の追加 + 取り出し後 queue = #{queue.to_array}"
  end
end
