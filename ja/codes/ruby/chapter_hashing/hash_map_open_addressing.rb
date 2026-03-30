=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### オープンアドレス法ハッシュテーブル ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 削除済みマーク

  ### コンストラクタ ###
  def initialize
    @size = 0 # キーと値のペア数
    @capacity = 4 # ハッシュテーブル容量
    @load_thres = 2.0 / 3.0 # リサイズを発動する負荷率のしきい値
    @extend_ratio = 2 # 拡張倍率
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

  ### key に対応するバケットインデックスを検索 ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 線形プロービングを行い、空バケットに達したら終了
    while !@buckets[index].nil?
      # key が見つかったら、対応するバケットのインデックスを返す
      if @buckets[index].key == key
        # 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 移動後のバケットインデックスを返す
        end
        return index # バケットのインデックスを返す
      end
      # 最初に見つかった削除マークを記録
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # バケットのインデックスを計算し、末尾を越えたら先頭に戻る
      index = (index + 1) % @capacity
    end
    # key が存在しない場合は追加位置のインデックスを返す
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 検索操作 ###
  def get(key)
    # key に対応するバケットインデックスを探す
    index = find_bucket(key)
    # キーと値の組が見つかったら、対応する val を返す
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # キーと値のペアが存在しない場合は `nil` を返す
    nil
  end

  ### 追加操作 ###
  def put(key, val)
    # 負荷率がしきい値を超えたら、リサイズを実行
    extend if load_factor > @load_thres
    # key に対応するバケットインデックスを探す
    index = find_bucket(key)
    # キーと値のペアが見つかった場合は、`val` を上書きして返す
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # キーと値の組が存在しない場合は、その組を追加する
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 削除操作 ###
  def remove(key)
    # key に対応するバケットインデックスを探す
    index = find_bucket(key)
    # キーと値の組が見つかったら、削除マーカーで上書きする
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### ハッシュテーブルを拡張 ###
  def extend
    # 元のハッシュテーブルを一時保存
    buckets_tmp = @buckets
    # リサイズ後の新しいハッシュテーブルを初期化
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### ハッシュテーブルを出力 ###
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

### Driver Code ###
if __FILE__ == $0
  # ハッシュテーブルを初期化
  hashmap = HashMapOpenAddressing.new

  # 追加操作
  # ハッシュテーブルにキーと値の組 (key, val) を追加する
  hashmap.put(12836, "シャオハー")
  hashmap.put(15937, "シャオルオ")
  hashmap.put(16750, "シャオスワン")
  hashmap.put(13276, "シャオファー")
  hashmap.put(10583, "シャオヤー")
  puts "\n追加完了後、ハッシュテーブルは\nKey -> Value"
  hashmap.print

  # 検索操作
  # ハッシュテーブルにキー key を入力し、値 val を得る
  name = hashmap.get(13276)
  puts "\n学籍番号 13276 を入力すると、名前 #{name} が見つかりました"

  # 削除操作
  # ハッシュテーブルからキーと値の組 (key, val) を削除する
  hashmap.remove(16750)
  puts "\n16750 を削除した後、ハッシュテーブルは\nKey -> Value"
  hashmap.print
end
