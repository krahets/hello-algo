=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### リストクラス ###
class MyList
  attr_reader :size       # リストの長さを取得（現在の要素数）
  attr_reader :capacity   # リスト容量を取得する

  ### コンストラクタ ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### 要素にアクセス ###
  def get(index)
    # インデックスが範囲外なら例外を送出する。以下同様
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
    @arr[index]
  end

  ### 要素にアクセス ###
  def set(index, num)
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
    @arr[index] = num
  end

  ### 末尾に要素を追加 ###
  def add(num)
    # 要素数が容量を超えると、拡張機構が発動する
    extend_capacity if size == capacity
    @arr[size] = num

    # 要素数を更新
    @size += 1
  end

  ### 途中に要素を挿入 ###
  def insert(index, num)
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size

    # 要素数が容量を超えると、拡張機構が発動する
    extend_capacity if size == capacity

    # index 以降の要素をすべて 1 つ後ろへずらす
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # 要素数を更新
    @size += 1
  end

  ### 要素の削除 ###
  def remove(index)
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
    num = @arr[index]

    # インデックス index より後の要素をすべて 1 つ前に移動する
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # 要素数を更新
    @size -= 1

    # 削除された要素を返す
    num
  end

  ### リストの容量拡張 ###
  def extend_capacity
    # 元の配列の extend_ratio 倍の長さを持つ新しい配列を作成し、元の配列をコピーする
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # リストの容量を更新
    @capacity = arr.length
  end

  ### リストを配列に変換 ###
  def to_array
    sz = size
    # 有効長の範囲内のリスト要素のみを変換
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # リストを初期化
  nums = MyList.new

  # 末尾に要素を追加
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "リスト nums = #{nums.to_array}、容量 = #{nums.capacity}、長さ = #{nums.size}"

  # 中間に要素を挿入
  nums.insert(3, 6)
  puts "インデックス 3 に数値 6 を挿入し、nums = #{nums.to_array}"

  # 要素を削除
  nums.remove(3)
  puts "インデックス 3 の要素を削除し、nums = #{nums.to_array}"

  # 要素にアクセス
  num = nums.get(1)
  puts "インデックス 1 の要素にアクセスし、num = #{num}"

  # 要素を更新
  nums.set(1, 0)
  puts "インデックス 1 の要素を 0 に更新し、nums = #{nums.to_array}"

  # 拡張機構をテストする
  for i in 0...10
    # i = 5 のとき、リスト長が容量を超えるため、この時点で拡張機構が発動する
    nums.add(i)
  end
  puts "拡張後のリスト nums = #{nums.to_array}、容量 = #{nums.capacity}、長さ = #{nums.size}"
end
