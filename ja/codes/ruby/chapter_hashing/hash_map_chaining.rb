=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### キーアドレス法ハッシュテーブル ###
class HashMapChaining
  ### コンストラクタ ###
  def initialize
    @size = 0 # キーと値のペア数
    @capacity = 4 # ハッシュテーブル容量
    @load_thres = 2.0 / 3.0 # リサイズを発動する負荷率のしきい値
    @extend_ratio = 2 # 拡張倍率
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

  ### 検索操作 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # バケットを走査し、key が見つかれば対応する val を返す
    for pair in bucket
      return pair.val if pair.key == key
    end
    # `key` が見つからなければ `nil` を返す
    nil
  end

  ### 追加操作 ###
  def put(key, val)
    # 負荷率がしきい値を超えたら、リサイズを実行
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # バケットを走査し、指定した key が見つかれば対応する val を更新して返す
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # その key が存在しなければ、キーと値のペアを末尾に追加
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 削除操作 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # バケットを走査してキーと値のペアを削除
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### ハッシュテーブルを拡張 ###
  def extend
    # 元のハッシュテーブルを一時保存
    buckets = @buckets
    # リサイズ後の新しいハッシュテーブルを初期化
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### ハッシュテーブルを出力 ###
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

### Driver Code ###
if __FILE__ == $0
  # ## ハッシュテーブルを初期化
  hashmap = HashMapChaining.new

  # 追加操作
  # ハッシュテーブルにキーと値の組 (key, value) を追加する
  hashmap.put(12836, "シャオハー")
  hashmap.put(15937, "シャオルオ")
  hashmap.put(16750, "シャオスワン")
  hashmap.put(13276, "シャオファー")
  hashmap.put(10583, "シャオヤー")
  puts "\n追加完了後、ハッシュテーブルは\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # 検索操作
  # ハッシュテーブルにキー key を入力し、値 value を取得する
  name = hashmap.get(13276)
  puts "\n学籍番号 13276 を入力すると、名前 #{name} が見つかりました"

  # 削除操作
  # ハッシュテーブルからキーと値の組 (key, value) を削除する
  hashmap.remove(12836)
  puts "\n12836 を削除した後、ハッシュテーブルは\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
