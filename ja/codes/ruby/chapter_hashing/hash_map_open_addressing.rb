=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### オープンアドレス法のハッシュテーブル ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 削除マーカー

  ### コンストラクタ ###
  def initialize
    @size = 0 # キーと値のペアの数
    @capacity = 4 # ハッシュテーブルの容量
    @load_thres = 2.0 / 3.0 # 容量の拡張を開始する負荷率のしきい値
    @extend_ratio = 2 # 容量の拡張倍率
    @buckets = Array.new(@capacity) # バケット配列
  end

  ### ハッシュ関数 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負荷率 ###
  def load_factor
    @size / @capacity
  end

  ### key に対応するバケットのインデックスを探索する ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 線形探索法で探索し、空のバケットに到達したら終了する
    while !@buckets[index].nil?
      # key が見つかった場合、対応するバケットのインデックスを返す
      if @buckets[index].key == key
        # それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 移動後のバケットのインデックスを返す
        end
        return index # バケットのインデックスを返す
      end
      # 最初に見つかった削除マーカーを記録する
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # バケットのインデックスを計算し、末尾を越えたら先頭に戻る
      index = (index + 1) % @capacity
    end
    # key が存在しない場合、追加位置のインデックスを返す
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 取得操作 ###
  def get(key)
    # key に対応するバケットのインデックスを探索する
    index = find_bucket(key)
    # キーと値のペアが見つかった場合、対応する val を返す
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # キーと値のペアが存在しない場合、nil を返す
    nil
  end

  ### 追加操作 ###
  def put(key, val)
    # 負荷率がしきい値を超えた場合、容量を拡張する
    extend if load_factor > @load_thres
    # key に対応するバケットのインデックスを探索する
    index = find_bucket(key)
    # キーと値のペアが見つかった場合、val を上書きして戻る
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # キーと値のペアが存在しない場合、そのペアを追加する
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 削除操作 ###
  def remove(key)
    # key に対応するバケットのインデックスを探索する
    index = find_bucket(key)
    # キーと値のペアが見つかった場合、削除マーカーで上書きする
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### ハッシュテーブルの容量を拡張する ###
  def extend
    # 元のハッシュテーブルを一時保存する
    buckets_tmp = @buckets
    # 拡張後の新しいハッシュテーブルを初期化する
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### ハッシュテーブルを表示する ###
  def print
    for pair in @buckets
      if pair.nil?
        puts "Nil"
      elsif pair == TOMBSTONE
        puts "TOMBSTONE"
      else
        puts "#{pair.key} -> #{pair.val}"
      end
    end
  end
end

### 実行用コード ###
if __FILE__ == $0
  # ハッシュテーブルを初期化する
  hashmap = HashMapOpenAddressing.new

  # 追加操作
  # ハッシュテーブルにキーと値のペア (key, val) を追加する
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n追加後のハッシュテーブル\nKey -> Value"
  hashmap.print

  # 取得操作
  # ハッシュテーブルにキー key を渡し、値 val を取得する
  name = hashmap.get(13276)
  puts "\n学生番号 13276 に対応する氏名は #{name}"

  # 削除操作
  # ハッシュテーブルからキーと値のペア (key, val) を削除する
  hashmap.remove(16750)
  puts "\n16750 を削除した後のハッシュテーブル\nKey -> Value"
  hashmap.print
end
