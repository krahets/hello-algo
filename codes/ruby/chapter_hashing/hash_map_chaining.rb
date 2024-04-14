=begin
File: hash_map_chaining.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 键式地址哈希表 ###
class HashMapChaining
  ### 构造方法 ###
  def initialize
    @size = 0 # 键值对数量
    @capacity = 4 # 哈希表容量
    @load_thres = 2.0 / 3.0 # 触发扩容的负载因子阈值
    @extend_ratio = 2 # 扩容倍数
    @buckets = Array.new(@capacity) { [] } # 桶数组
  end

  ### 哈希函数 ###
  def hash_func(key)
    key % @capacity
  end

  ### 负载因子 ###
  def load_factor
    @size / @capacity
  end

  ### 查询操作 ###
  def get(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 遍历桶，若找到 key ，则返回对应 val
    for pair in bucket
      return pair.val if pair.key == key
    end
    # 若未找到 key , 则返回 nil
    nil
  end

  ### 添加操作 ###
  def put(key, val)
    # 当负载因子超过阈值时，执行扩容
    extend if load_factor > @load_thres
    index = hash_func(key)
    bucket = @buckets[index]
    # 遍历桶，若遇到指定 key ，则更新对应 val 并返回
    for pair in bucket
      if pair.key == key
        pair.val = val
        return
      end
    end
    # 若无该 key ，则将键值对添加至尾部
    pair = Pair.new(key, val)
    bucket << pair
    @size += 1
  end

  ### 删除操作 ###
  def remove(key)
    index = hash_func(key)
    bucket = @buckets[index]
    # 遍历桶，从中删除键值对
    for pair in bucket
      if pair.key == key
        bucket.delete(pair)
        @size -= 1
        break
      end
    end
  end

  ### 扩容哈希表 ###
  def extend
    # 暫存原哈希表
    buckets = @buckets
    # 初始化扩容后的新哈希表
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity) { [] }
    @size = 0
    # 将键值对从原哈希表搬运至新哈希表
    for bucket in buckets
      for pair in bucket
        put(pair.key, pair.val)
      end
    end
  end

  ### 打印哈希表 ###
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
  ### 初始化哈希表
  hashmap = HashMapChaining.new

  # 添加操作
  # 在哈希表中添加键值对 (key, value)
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n添加完成后，哈希表为\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print

  # 查询操作
  # 向哈希表中输入键 key ，得到值 value
  name = hashmap.get(13276)
  puts "\n输入学号 13276 ，查询到姓名 #{name}"

  # 删除操作
  # 在哈希表中删除键值对 (key, value)
  hashmap.remove(12836)
  puts "\n删除 12836 后，哈希表为\n[Key1 -> Value1, Key2 -> Value2, ...]"
  hashmap.print
end
