=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### オープンアドレス法によるハッシュ表 ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 削除済みマーカー

  ### コンストラクタ ###
  def initialize
    @size = 0 # キーと値のペアの数
    @capacity = 4 # ハッシュ表の容量
    @load_thres = 2.0 / 3.0 # 表を拡張する負荷率のしきい値
    @extend_ratio = 2 # 容量の拡張倍率
    @buckets = Array.new(@capacity) # バケットの配列
  end

  ### ハッシュ関数 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負荷率 ###
  def load_factor
    @size / @capacity.to_f
  end

  ### key に対応するバケットのインデックスを探す ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 線形探索を行い、空のバケットに出会ったらループを抜ける
    while !@buckets[index].nil?
      # key が見つかったら、そのバケットのインデックスを返す
      if @buckets[index].key == key
        # それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 移動先のバケットのインデックスを返す
        end
        return index # バケットのインデックスを返す
      end
      # 最初に見つかった削除済みマーカーの位置を記録する
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
      index = (index + 1) % @capacity
    end
    # key がなければ挿入位置のインデックスを返す
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 検索 ###
  def get(key)
    # key に対応するバケットのインデックスを探す
    index = find_bucket(key)
    # ペアが見つかったら対応する val を返す
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # ペアがなければ nil を返す
    nil
  end

  ### 追加 ###
  def put(key, val)
    # 負荷率がしきい値を超えたら表を拡張する
    extend if load_factor > @load_thres
    # key に対応するバケットのインデックスを探す
    index = find_bucket(key)
    # ペアが見つかったら val を上書きして処理を終える
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # ペアがなければ新しく追加する
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 削除 ###
  def remove(key)
    # key に対応するバケットのインデックスを探す
    index = find_bucket(key)
    # ペアが見つかったら削除済みマーカーで置き換える
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### ハッシュ表を拡張する ###
  def extend
    # 元のハッシュ表を一時保存する
    buckets_tmp = @buckets
    # 拡張後の新しいハッシュ表を初期化する
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # 元のハッシュ表から新しい表にペアを移す
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### ハッシュ表を表示する ###
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

### 実行例 ###
if __FILE__ == $0
  # ハッシュ表を初期化する
  hashmap = HashMapOpenAddressing.new

  # 追加
  # ハッシュ表にペア (key, val) を追加する
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n追加後のハッシュ表\nKey -> Value"
  hashmap.print

  # 検索
  # ハッシュ表でキー key に対応する値 val を取得する
  name = hashmap.get(13276)
  puts "\n学籍番号 13276 に対応する名前は #{name}"

  # 削除
  # ハッシュ表からペア (key, val) を削除する
  hashmap.remove(16750)
  puts "\n16750 を削除した後のハッシュ表\nKey -> Value"
  hashmap.print
end
