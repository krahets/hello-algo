=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 循環配列で実装した両端キュー ###
class ArrayDeque
  ### 両端キューの長さを取得する ###
  attr_reader :size

  ### コンストラクタ ###
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

  ### 先頭にエンキューする ###
  def push_first(num)
    if size == capacity
      puts '両端キューが満杯です'
      return
    end

    # 先頭ポインタを左に 1 つ移動する
    # 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
    @front = index(@front - 1)
    # num をキューの先頭に追加する
    @nums[@front] = num
    @size += 1
  end

  ### 末尾にエンキューする ###
  def push_last(num)
    if size == capacity
      puts '両端キューが満杯です'
      return
    end

    # 末尾のインデックス + 1 を指す末尾ポインタを計算する
    rear = index(@front + size)
    # num をキューの末尾に追加する
    @nums[rear] = num
    @size += 1
  end

  ### 先頭からデキューする ###
  def pop_first
    num = peek_first
    # 先頭ポインタを後ろに 1 つ移動する
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### 末尾からデキューする ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### キューの先頭要素にアクセス ###
  def peek_first
    raise IndexError, '両端キューが空です' if is_empty?

    @nums[@front]
  end

  ### キューの末尾要素にアクセスする ###
  def peek_last
    raise IndexError, '両端キューが空です' if is_empty?

    # 末尾要素のインデックスを計算する
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 表示用の配列を返す ###
  def to_array
    # 有効な長さの範囲内にあるリストの要素だけを変換する
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 循環配列のインデックスを計算する ###
  def index(i)
    # 剰余演算を使い、配列の先頭と末尾をつなぐ
    # i が配列の末尾を越えたら、先頭に戻る
    # i が配列の先頭を越えたら、末尾に戻る
    (i + capacity) % capacity
  end
end

### 実行用コード ###
if __FILE__ == $0
  # 両端キューを初期化する
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "両端キュー deque = #{deque.to_array}"

  # 要素にアクセスする
  peek_first = deque.peek_first
  puts "キューの先頭要素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "キューの末尾要素 peek_last = #{peek_last}"

  # 要素をエンキューする
  deque.push_last(4)
  puts "要素 4 を末尾にエンキューした後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "要素 1 を末尾にエンキューした後 deque = #{deque.to_array}"

  # 要素をデキューする
  pop_last = deque.pop_last
  puts "末尾からデキューした要素 = #{pop_last}、末尾からデキューした後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "末尾からデキューした要素 = #{pop_first}、末尾からデキューした後 deque = #{deque.to_array}"

  # 両端キューの長さを取得する
  size = deque.size
  puts "両端キューの長さ size = #{size}"

  # 両端キューが空かどうかを判定する
  is_empty = deque.is_empty?
  puts "両端キューは空か = #{is_empty}"
end
