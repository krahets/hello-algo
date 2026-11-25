=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 採用鏈結法的雜湊表 ###
class HashMapChaining
  ### 建構方法 ###
  def initialize
    @size = 0 # 鍵值對數量
    @capacity = 4 # 雜湊表容量
    @load_thres = 2.0 / 3.0 # 觸發容量擴充的負載因子門檻
    @extend_ratio = 2 # 容量擴充倍數
    @buckets = Array.new(@capacity) { [] } # 桶陣列
  end

  ### 雜湊函式 ###
  def hash_func(key)
    key % @capacity
  end

  ### 負載因子 ###
  def load_factor
    @size / @capacity.to_f
  end

  ### 查詢操作 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 走訪桶中的元素，若找到 key，就回傳對應的 val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # 若找不到 key，回傳 nil
    nil
  end

  ### 新增操作 ###
  def put(key, val)
    # 當負載因子超過門檻時，擴充容量
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # 若沒有這個 key，就將鍵值對加到尾端
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 刪除操作 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 走訪桶中的元素，從中刪除鍵值對
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### 擴充雜湊表容量 ###
  def extend
    # 暫存原本的雜湊表
    buckets = @buckets
    # 初始化擴充後的新雜湊表
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # 將鍵值對從原本的雜湊表移到新表
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### 印出雜湊表 ###
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

### 主程式 ###
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
  puts "\n新增後的雜湊表\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # 查詢操作
  # 輸入鍵 key，從雜湊表取得對應的值 value
  name = hashmap.get(13276)
  puts "\n輸入學號 13276，查得姓名 #{name}"

  # 刪除操作
  # 從雜湊表刪除鍵值對 (key, value)
  hashmap.remove(12836)
  puts "\n刪除 12836 後的雜湊表\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
