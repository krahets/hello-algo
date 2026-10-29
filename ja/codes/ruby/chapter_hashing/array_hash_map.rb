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
    # 100 個のバケットを含む配列を初期化する
    @buckets = Array.new(100)
  end

  ### ハッシュ関数 ###
  def hash_func(key)
    index = key % 100
  end

  ### 取得操作 ###
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
    # nil に設定して、削除を表す
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

  ### ハッシュテーブルを表示する ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### 実行用コード ###
if __FILE__ == $0
  # ハッシュテーブルを初期化する
  hmap = ArrayHashMap.new

  # 追加操作
  # ハッシュテーブルにキーと値のペア (key, value) を追加する
  hmap.put(12836, "小哈")
  hmap.put(15937, "小啰")
  hmap.put(16750, "小算")
  hmap.put(13276, "小法")
  hmap.put(10583, "小鸭")
  puts "\n追加後のハッシュテーブル\nKey -> Value"
  hmap.print

  # 取得操作
  # ハッシュテーブルにキー key を渡し、値 value を取得する
  name = hmap.get(15937)
  puts "\n学生番号 15937 に対応する氏名は #{name}"

  # 削除操作
  # ハッシュテーブルから値のペア (key, value) を削除する
  hmap.remove(10583)
  puts "\n10583 を削除した後のハッシュテーブル\nKey -> Value"
  hmap.print

  # ハッシュテーブルを走査する
  puts "\nキーと値のペア Key->Value を走査する"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\nキー Key だけを走査する"
  for key in hmap.key_set
    puts key
  end

  puts "\n値 Value だけを走査する"
  for val in hmap.value_set
    puts val
  end
end
