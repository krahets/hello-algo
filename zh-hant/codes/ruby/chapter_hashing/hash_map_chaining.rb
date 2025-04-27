=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 鍵式位址雜湊表 ###
class HashMapChaining
  ### 建構子 ###
  def initialize
    @size = 0 # 鍵值對數量
    @capacity = 4 # 雜湊表容量
    @load_thres = 2.0 / 3.0 # 觸發擴容的負載因子閾值
    @extend_ratio = 2 # 擴容倍數
    @buckets = Array.new(@capacity) { [] } # 桶陣列
  end

  ### 雜湊函式 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負載因子 ###
  def load_factor
    @size / @capacity
  end

  ### 查詢操作 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 走訪桶，若找到 key ，則返回對應 val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # 若未找到 key , 則返回 nil
    nil
  end

  ### 新增操作 ###
  def put(key, val)
    # 當負載因子超過閾值時，執行擴容
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # 走訪桶，若遇到指定 key ，則更新對應 val 並返回
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # 若無該 key ，則將鍵值對新增至尾部
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 刪除操作 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 走訪桶，從中刪除鍵值對
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### 擴容雜湊表 ###
  def extend
    # 暫存原雜湊表
    buckets = @buckets
    # 初始化擴容後的新雜湊表
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # 將鍵值對從原雜湊表搬運至新雜湊表
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### 列印雜湊表 ###
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
  ### 初始化雜湊表
  hashmap = HashMapChaining.new

  # 新增操作
  # 在雜湊表中新增鍵值對 (key, value)
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小囉")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鴨")
  puts "\n新增完成後，雜湊表為\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # 查詢操作
  # 向雜湊表中輸入鍵 key ，得到值 value
  name = hashmap.get(13276)
  puts "\n輸入學號 13276 ，查詢到姓名 #{name}"

  # 刪除操作
  # 在雜湊表中刪除鍵值對 (key, value)
  hashmap.remove(12836)
  puts "\n刪除 12836 後，雜湊表為\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
