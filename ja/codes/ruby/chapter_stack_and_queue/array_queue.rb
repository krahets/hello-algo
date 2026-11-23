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
    @nums = Array.new(size, 0) # キューの要素を格納する配列
    @front = 0 # キューの先頭要素を指す先頭ポインタ
    @size = 0 # キューの長さ
  end

  ### キューの容量を取得する ###
  def capacity
    @nums.length
  end

  ### キューが空か判定 ###
  def is_empty?
    size.zero?
  end

  ### エンキュー ###
  def push(num)
    raise IndexError, 'キューが満杯です' if size == capacity

    # 末尾のインデックス + 1 を指す末尾ポインタを計算する
    # 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
    rear = (@front + size) % capacity
    # num をキューの末尾に追加する
    @nums[rear] = num
    @size += 1
  end

  ### デキュー ###
  def pop
    num = peek
    # 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### キューの先頭要素にアクセス ###
  def peek
    raise IndexError, 'キューが空です' if is_empty?

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

### 実行用コード ###
if __FILE__ == $0
  # キューを初期化する
  queue = ArrayQueue.new(10)

  # 要素をエンキューする
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue.to_array}"

  # キューの先頭要素にアクセス
  peek = queue.peek
  puts "キューの先頭要素 peek = #{peek}"

  # 要素をデキューする
  pop = queue.pop
  puts "デキューした要素 pop = #{pop}"
  puts "デキュー後 queue = #{queue.to_array}"

  # キューの長さを取得
  size = queue.size
  puts "キューの長さ size = #{size}"

  # キューが空か判定
  is_empty = queue.is_empty?
  puts "キューは空か = #{is_empty}"

  # 循環配列をテストする
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "第 #{i} 回のエンキューとデキューの後 queue = #{queue.to_array}"
  end
end
