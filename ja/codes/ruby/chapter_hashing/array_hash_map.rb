=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### キーと値のペア ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

### 配列で実装したハッシュテーブル ###
class ArrayHashMap
  ### コンストラクタ ###
  def initialize
    # 100 個のバケットを含む配列を初期化
    @buckets = Array.new(100)
  end

  ### ハッシュ関数 ###
  def hash_func(key)
    index = key % 100
  end

  ### 検索操作 ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### 追加操作 ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### 削除操作 ###
  def remove(key)
    index = hash_func(key)
    # nil に設定し、削除を表す
    @buckets[index] = nil
  end

  ### すべてのキーと値のペアを取得 ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### すべてのキーを取得 ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### すべての値を取得 ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### ハッシュテーブルを出力 ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Driver Code ###
if __FILE__ == $0
  # ハッシュテーブルを初期化
  hmap = ArrayHashMap.new

  # 追加操作
  # ハッシュテーブルにキーと値の組 (key, value) を追加する
  hmap.put(12836, "シャオハー")
  hmap.put(15937, "シャオルオ")
  hmap.put(16750, "シャオスワン")
  hmap.put(13276, "シャオファー")
  hmap.put(10583, "シャオヤー")
  puts "\n追加完了後、ハッシュテーブルは\nKey -> Value"
  hmap.print

  # 検索操作
  # ハッシュテーブルにキー `key` を入力し、値 `value` を取得する
  name = hmap.get(15937)
  puts "\n学籍番号 15937 を入力すると、名前 #{name} が見つかりました"

  # 削除操作
  # ハッシュテーブルからキーと値の組 (key, value) を削除する
  hmap.remove(10583)
  puts "\n10583 を削除した後、ハッシュテーブルは\nKey -> Value"
  hmap.print

  # ハッシュテーブルを走査
  puts "\nキーと値のペア Key->Value を走査"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nキー Key のみを個別に走査"
  for key in hmap.key_set
    puts key
  end

  puts "\n値 Value のみを個別に走査"
  for val in hmap.value_set
    puts val
  end
end
