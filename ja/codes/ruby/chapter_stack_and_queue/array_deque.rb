=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 循環配列を使った両端キュー ###
class ArrayDeque
  ### 両端キューの要素数を取得する ###
  attr_reader :size

  ### 初期化メソッド ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 両端キューの容量を取得する ###
  def capacity
    @nums.length
  end

  ### 両端キューが空かどうかを判定する ###
  def is_empty?
    size.zero?
  end

  ### 先頭に追加する ###
  def push_first(num)
    if size == capacity
      puts '両端キューが満杯です'
      return
    end

    # 先頭のインデックスを左に 1 つ移す
    # 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
    @front = index(@front - 1)
    # num を両端キューの先頭に追加する
    @nums[@front] = num
    @size += 1
  end

  ### 末尾に追加する ###
  def push_last(num)
    if size == capacity
      puts '両端キューが満杯です'
      return
    end

    # 両端キューの末尾要素の次の位置を示すインデックスを求める
    rear = index(@front + size)
    # num を両端キューの末尾に追加する
    @nums[rear] = num
    @size += 1
  end

  ### 先頭から取り出す ###
  def pop_first
    num = peek_first
    # 先頭のインデックスを 1 つ進める
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### 末尾から取り出す ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### 両端キューの先頭要素を参照する ###
  def peek_first
    raise IndexError, '両端キューが空です' if is_empty?

    @nums[@front]
  end

  ### 両端キューの末尾要素を参照する ###
  def peek_last
    raise IndexError, '両端キューが空です' if is_empty?

    # 末尾要素のインデックスを求める
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 表示用の配列を返す ###
  def to_array
    # 両端キューの要素数に当たる範囲だけを変換する
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 循環配列のインデックスを求める ###
  def index(i)
    # 剰余を使って配列の先頭と末尾をつなぐ
    # i が配列の末尾を越えたら先頭に戻る
    # i が配列の先頭より前に出たら末尾に回る
    (i + capacity) % capacity
  end
end

### 実行例 ###
if __FILE__ == $0
  # 両端キューを初期化する
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "両端キュー deque = #{deque.to_array}"

  # 要素を参照する
  peek_first = deque.peek_first
  puts "先頭要素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "末尾要素 peek_last = #{peek_last}"

  # 要素を両端キューに追加する
  deque.push_last(4)
  puts "末尾に 4 を追加した後の deque = #{deque.to_array}"
  deque.push_first(1)
  puts "先頭に 1 を追加した後の deque = #{deque.to_array}"

  # 両端キューから要素を取り出す
  pop_last = deque.pop_last
  puts "末尾から取り出した要素 = #{pop_last}、末尾から取り出した後の deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "先頭から取り出した要素 = #{pop_first}、先頭から取り出した後の deque = #{deque.to_array}"

  # 両端キューの要素数を取得する
  size = deque.size
  puts "両端キューの要素数 size = #{size}"

  # 両端キューが空かどうかを判定する
  is_empty = deque.is_empty?
  puts "両端キューは空か = #{is_empty}"
end
