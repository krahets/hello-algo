=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### チェイン法のハッシュテーブル ###
class HashMapChaining
  ### コンストラクタ ###
  def initialize
    @size = 0 # キーと値のペアの数
    @capacity = 4 # ハッシュテーブルの容量
    @load_thres = 2.0 / 3.0 # 容量の拡張を開始する負荷率のしきい値
    @extend_ratio = 2 # 容量の拡張倍率
    @buckets = Array.new(@capacity) { [] } # バケット配列
  end

  ### ハッシュ関数 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負荷率 ###
  def load_factor
    @size / @capacity
  end

  ### 取得操作 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # バケットを走査し、key が見つかったら対応する val を返す
    for pair in bucket
      return pair.val if pair.key == key
    end
    # key が見つからなかった場合、nil を返す
    nil
  end

  ### 追加操作 ###
  def put(key, val)
    # 負荷率がしきい値を超えた場合、容量を拡張する
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # key が存在しない場合、キーと値のペアを末尾に追加する
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 削除操作 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # バケットを走査し、キーと値のペアを削除する
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### ハッシュテーブルの容量を拡張する ###
  def extend
    # 元のハッシュテーブルを一時保存する
    buckets = @buckets
    # 拡張後の新しいハッシュテーブルを初期化する
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### ハッシュテーブルを表示する ###
  def print
    for bucket in @buckets
      res = []
      for pair in bucket
        res << "#{pair.key} -> #{pair.val}"
      end
      pp res
    end
  end
end

### 実行用コード ###
if __FILE__ == $0
  ### ハッシュテーブルを初期化する
  hashmap = HashMapChaining.new

  # 追加操作
  # ハッシュテーブルにキーと値のペア (key, value) を追加する
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n追加後のハッシュテーブル\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # 取得操作
  # ハッシュテーブルにキー key を渡し、値 value を取得する
  name = hashmap.get(13276)
  puts "\n学生番号 13276 に対応する氏名は #{name}"

  # 削除操作
  # ハッシュテーブルからキーと値のペア (key, value) を削除する
  hashmap.remove(12836)
  puts "\n12836 を削除した後のハッシュテーブル\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
