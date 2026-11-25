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

### 配列で実装したハッシュ表 ###
class ArrayHashMap
  ### コンストラクタ ###
  def initialize
    # 100 個のバケットを持つ配列を初期化する
    @buckets = Array.new(100)
  end

  ### ハッシュ関数 ###
  def hash_func(key)
    index = key % 100
  end

  ### 検索 ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### 追加 ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### 削除 ###
  def remove(key)
    index = hash_func(key)
    # nil を代入して削除する
    @buckets[index] = nil
  end

  ### キーと値のペアをすべて取得する ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### すべてのキーを取得する ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### すべての値を取得する ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### ハッシュ表を表示する ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### 実行例 ###
if __FILE__ == $0
  # ハッシュ表を初期化する
  hmap = ArrayHashMap.new

  # 追加
  # ハッシュ表にペア (key, value) を追加する
  hmap.put(12836, "小哈")
  hmap.put(15937, "小啰")
  hmap.put(16750, "小算")
  hmap.put(13276, "小法")
  hmap.put(10583, "小鸭")
  puts "\n追加後のハッシュ表\nKey -> Value"
  hmap.print

  # 検索
  # ハッシュ表でキー key に対応する値 value を取得する
  name = hmap.get(15937)
  puts "\n学籍番号 15937 に対応する名前は #{name}"

  # 削除
  # ハッシュ表からペア (key, value) を削除する
  hmap.remove(10583)
  puts "\n10583 を削除した後のハッシュ表\nKey -> Value"
  hmap.print

  # ハッシュ表を走査する
  puts "\nキーと値のペアを順に表示 Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nキーだけを順に表示 Key"
  for key in hmap.key_set
    puts key
  end

  puts "\n値だけを順に表示 Value"
  for val in hmap.value_set
    puts val
  end
end
