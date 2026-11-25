=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 循環配列を使ったキュー ###
class ArrayQueue
  ### キューの要素数を取得する ###
  attr_reader :size

  ### 初期化メソッド ###
  def initialize(size)
    @nums = Array.new(size, 0) # キューの要素を格納する配列
    @front = 0 # キューの先頭要素を指すインデックス
    @size = 0 # キューの要素数
  end

  ### キューの容量を取得する ###
  def capacity
    @nums.length
  end

  ### キューが空かどうかを判定する ###
  def is_empty?
    size.zero?
  end

  ### エンキューする ###
  def push(num)
    raise IndexError, 'キューが満杯です' if size == capacity

    # キューの末尾要素の次の位置を示すインデックスを求める
    # 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
    rear = (@front + size) % capacity
    # num をキューの末尾に追加する
    @nums[rear] = num
    @size += 1
  end

  ### デキューする ###
  def pop
    num = peek
    # 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### キューの先頭要素を参照する ###
  def peek
    raise IndexError, 'キューが空です' if is_empty?

    @nums[@front]
  end

  ### 表示用の配列を返す ###
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

### 実行例 ###
if __FILE__ == $0
  # キューを初期化する
  queue = ArrayQueue.new(10)

  # 要素をキューに追加する
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "キュー queue = #{queue.to_array}"

  # キューの先頭要素を参照する
  peek = queue.peek
  puts "先頭要素 peek = #{peek}"

  # キューから要素を取り出す
  pop = queue.pop
  puts "デキューした要素 pop = #{pop}"
  puts "デキュー後の queue = #{queue.to_array}"

  # キューの要素数を取得する
  size = queue.size
  puts "キューの要素数 size = #{size}"

  # キューが空かどうかを判定する
  is_empty = queue.is_empty?
  puts "キューは空か = #{is_empty}"

  # 循環配列の動作を確認する
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "第 #{i} 回のエンキューとデキューを終えた後の queue = #{queue.to_array}"
  end
end
