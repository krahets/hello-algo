=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 採用開放定址法的雜湊表 ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 刪除標記

  ### 建構方法 ###
  def initialize
    @size = 0 # 鍵值對數量
    @capacity = 4 # 雜湊表容量
    @load_thres = 2.0 / 3.0 # 觸發容量擴充的負載因子門檻
    @extend_ratio = 2 # 容量擴充倍數
    @buckets = Array.new(@capacity) # 桶陣列
  end

  ### 雜湊函式 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負載因子 ###
  def load_factor
    @size / @capacity.to_f
  end

  ### 尋找 key 對應的桶索引 ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 進行線性探測，遇到空桶就跳出迴圈
    while !@buckets[index].nil?
      # 若遇到 key，回傳對應的桶索引
      if @buckets[index].key == key
        # 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 回傳移動後的桶索引
        end
        return index # 回傳桶索引
      end
      # 記錄遇到的第一個刪除標記
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # 計算桶索引，超過陣列尾端就回到開頭
      index = (index + 1) % @capacity
    end
    # 若 key 不存在，回傳可插入位置的索引
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 查詢操作 ###
  def get(key)
    # 尋找 key 對應的桶索引
    index = find_bucket(key)
    # 若找到鍵值對，回傳對應的 val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # 若鍵值對不存在，回傳 nil
    nil
  end

  ### 新增操作 ###
  def put(key, val)
    # 當負載因子超過門檻時，擴充容量
    extend if load_factor > @load_thres
    # 尋找 key 對應的桶索引
    index = find_bucket(key)
    # 若找到鍵值對，覆寫 val 並結束操作
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # 若鍵值對不存在，新增該鍵值對
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 刪除操作 ###
  def remove(key)
    # 尋找 key 對應的桶索引
    index = find_bucket(key)
    # 若找到鍵值對，以刪除標記取代它
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### 擴充雜湊表容量 ###
  def extend
    # 暫存原本的雜湊表
    buckets_tmp = @buckets
    # 初始化擴充後的新雜湊表
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # 將鍵值對從原本的雜湊表移到新表
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### 印出雜湊表 ###
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

### 主程式 ###
if __FILE__ == $0
  # 初始化雜湊表
  hashmap = HashMapOpenAddressing.new

  # 新增操作
  # 在雜湊表中新增鍵值對 (key, val)
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小囉")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鴨")
  puts "\n新增後的雜湊表\nKey -> Value"
  hashmap.print

  # 查詢操作
  # 輸入鍵 key，從雜湊表取得對應的值 val
  name = hashmap.get(13276)
  puts "\n輸入學號 13276，查得姓名 #{name}"

  # 刪除操作
  # 從雜湊表刪除鍵值對 (key, val)
  hashmap.remove(16750)
  puts "\n刪除 16750 後的雜湊表\nKey -> Value"
  hashmap.print
end
