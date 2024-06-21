=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 開放定址雜湊表 ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 刪除標記

  ### 建構子 ###
  def initialize
    @size = 0 # 鍵值對數量
    @capacity = 4 # 雜湊表容量
    @load_thres = 2.0 / 3.0 # 觸發擴容的負載因子閾值
    @extend_ratio = 2 # 擴容倍數
    @buckets = Array.new(@capacity) # 桶陣列
  end

  ### 雜湊函式 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負載因子 ###
  def load_factor
    @size / @capacity
  end

  ### 搜尋 key 對應的桶索引 ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 線性探查，當遇到空桶時跳出
    while !@buckets[index].nil?
      # 若遇到 key ，返回對應的桶索引
      if @buckets[index].key == key
        # 若之前遇到了刪除標記，則將鍵值對移動至該索引處
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 返回移動後的桶索引
        end
        return index # 返回桶索引
      end
      # 記錄遇到的首個刪除標記
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # 計算桶索引，越過尾部則返回頭部
      index = (index + 1) % @capacity
    end
    # 若 key 不存在，則返回新增點的索引
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 查詢操作 ###
  def get(key)
    # 搜尋 key 對應的桶索引
    index = find_bucket(key)
    # 若找到鍵值對，則返回對應 val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # 若鍵值對不存在，則返回 nil
    nil
  end

  ### 新增操作 ###
  def put(key, val)
    # 當負載因子超過閾值時，執行擴容
    extend if load_factor > @load_thres
    # 搜尋 key 對應的桶索引
    index = find_bucket(key)
    # 若找到鍵值對，則覆蓋 val 開返回
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # 若鍵值對不存在，則新增該鍵值對
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 刪除操作 ###
  def remove(key)
    # 搜尋 key 對應的桶索引
    index = find_bucket(key)
    # 若找到鍵值對，則用刪除標記覆蓋它
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### 擴容雜湊表 ###
  def extend
    # 暫存原雜湊表
    buckets_tmp = @buckets
    # 初始化擴容後的新雜湊表
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # 將鍵值對從原雜湊表搬運至新雜湊表
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### 列印雜湊表 ###
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
  # 初始化雜湊表
  hashmap = HashMapOpenAddressing.new

  # 新增操作
  # 在雜湊表中新增鍵值對 (key, val)
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小囉")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鴨")
  puts "\n新增完成後，雜湊表為\nKey -> Value"
  hashmap.print

  # 查詢操作
  # 向雜湊表中輸入鍵 key ，得到值 val
  name = hashmap.get(13276)
  puts "\n輸入學號 13276 ，查詢到姓名 #{name}"

  # 刪除操作
  # 在雜湊表中刪除鍵值對 (key, val)
  hashmap.remove(16750)
  puts "\n刪除 16750 後，雜湊表為\nKey -> Value"
  hashmap.print
end
