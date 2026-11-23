=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### リストクラス ###
class MyList
  attr_reader :size       # リストの長さ（現在の要素数）を取得する
  attr_reader :capacity   # リストの容量を取得する

  ### コンストラクタ ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### 要素にアクセスする ###
  def get(index)
    # インデックスが範囲外の場合、例外を送出する。以下も同様
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
    @arr[index]
  end

  ### 要素にアクセスする ###
  def set(index, num)
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
    @arr[index] = num
  end

  ### 末尾に要素を追加する ###
  def add(num)
    # 要素数が容量を超える場合、容量を拡張する
    extend_capacity if size == capacity
    @arr[size] = num

    # 要素数を更新する
    @size += 1
  end

  ### 途中に要素を挿入する ###
  def insert(index, num)
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size

    # 要素数が容量を超える場合、容量を拡張する
    extend_capacity if size == capacity

    # インデックス index 以降の全要素を後ろに 1 つずらす
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # 要素数を更新する
    @size += 1
  end

  ### 要素を削除する ###
  def remove(index)
    raise IndexError, "インデックスが範囲外です" if index < 0 || index >= size
    num = @arr[index]

    # インデックス index より後の全要素を前に 1 つずらす
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # 要素数を更新する
    @size -= 1

    # 削除した要素を返す
    num
  end

  ### リストの容量を拡張する ###
  def extend_capacity
    # 元の配列の extend_ratio 倍の長さの配列を新たに作成し、元の配列をコピーする
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # リストの容量を更新する
    @capacity = arr.length
  end

  ### リストを配列に変換する ###
  def to_array
    sz = size
    # 有効な長さの範囲内にあるリストの要素だけを変換する
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### 実行用コード ###
if __FILE__ == $0
  # リストを初期化する
  nums = MyList.new

  # 末尾に要素を追加する
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "リスト nums = #{nums.to_array} 、容量 = #{nums.capacity} 、長さ = #{nums.size}"

  # 途中に要素を挿入する
  nums.insert(3, 6)
  puts "インデックス 3 に数値 6 を挿入した結果 nums = #{nums.to_array}"

  # 要素を削除する
  nums.remove(3)
  puts "インデックス 3 の要素を削除した結果 nums = #{nums.to_array}"

  # 要素にアクセスする
  num = nums.get(1)
  puts "インデックス 1 の要素にアクセスした結果 num = #{num}"

  # 要素を更新する
  nums.set(1, 0)
  puts "インデックス 1 の要素を 0 に更新した結果 nums = #{nums.to_array}"

  # 容量の拡張をテストする
  for i in 0...10
    # i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
    nums.add(i)
  end
  puts "容量を拡張した後のリスト nums = #{nums.to_array} 、容量 = #{nums.capacity} 、長さ = #{nums.size}"
end
