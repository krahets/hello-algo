=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 循環配列で実装した両端キュー ###
class ArrayDeque
  ### 両端キューの長さを取得 ###
  attr_reader :size

  ### コンストラクタ ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 両端キューの容量を取得 ###
  def capacity
    @nums.length
  end

  ### 両端キューが空か判定 ###
  def is_empty?
    size.zero?
  end

  ### キュー先頭に追加 ###
  def push_first(num)
    if size == capacity
      puts '両端キューがいっぱいです'
      return
    end

    # 先頭ポインタを左に 1 つ移動する
    # 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
    @front = index(@front - 1)
    # num をキュー先頭に追加
    @nums[@front] = num
    @size += 1
  end

  ### キュー末尾に追加 ###
  def push_last(num)
    if size == capacity
      puts '両端キューがいっぱいです'
      return
    end

    # キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
    rear = index(@front + size)
    # num をキュー末尾に追加
    @nums[rear] = num
    @size += 1
  end

  ### キュー先頭から取り出す ###
  def pop_first
    num = peek_first
    # 先頭ポインタを 1 つ後ろへ進める
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### キューの末尾から取り出す ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### 先頭要素にアクセス ###
  def peek_first
    raise IndexError, '両端キューは空です' if is_empty?

    @nums[@front]
  end

  ### キュー末尾要素を参照 ###
  def peek_last
    raise IndexError, '両端キューは空です' if is_empty?

    # 末尾要素のインデックスを計算
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 表示用の配列を返す ###
  def to_array
    # 有効長の範囲内のリスト要素のみを変換
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 循環配列のインデックスを計算 ###
  def index(i)
    # 剰余演算により配列の先頭と末尾をつなげる
    # i が配列の末尾を越えたら先頭に戻る
    # i が配列の先頭を越えて前に出たら末尾に戻る
    (i + capacity) % capacity
  end
end

### Driver Code ###
if __FILE__ == $0
  # 両端キューを初期化
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "両端キュー deque = #{deque.to_array}"

  # 要素にアクセス
  peek_first = deque.peek_first
  puts "先頭要素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "末尾要素 peek_last = #{peek_last}"

  # 要素をエンキュー
  deque.push_last(4)
  puts "要素 4 を末尾に追加後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "要素 1 を末尾に追加後 deque = #{deque.to_array}"

  # 要素をデキュー
  pop_last = deque.pop_last
  puts "末尾から取り出した要素 = #{pop_last}，末尾から取り出した後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "末尾から取り出した要素 = #{pop_first}，末尾から取り出した後 deque = #{deque.to_array}"

  # 両端キューの長さを取得
  size = deque.size
  puts "両端キューの長さ size = #{size}"

  # 両端キューが空かどうかを判定
  is_empty = deque.is_empty?
  puts "両端キューが空かどうか = #{is_empty}"
end
