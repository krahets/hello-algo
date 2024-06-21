=begin
File: hash_map_open_addressing.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative './array_hash_map'

### 开放寻址哈希表 ###
class HashMapOpenAddressing
  TOMBSTONE = Pair.new(-1, '-1') # 删除标记

  ### 构造方法 ###
  def initialize
    @size = 0 # 键值对数量
    @capacity = 4 # 哈希表容量
    @load_thres = 2.0 / 3.0 # 触发扩容的负载因子阈值
    @extend_ratio = 2 # 扩容倍数
    @buckets = Array.new(@capacity) # 桶数组
  end

  ### 哈希函数 ###
  def hash_func(key)
    key % @capacity
  end

  ### 负载因子 ###
  def load_factor
    @size / @capacity
  end

  ### 搜索 key 对应的桶索引 ###
  def find_bucket(key)
    index = hash_func(key)
    first_tombstone = -1
    # 线性探测，当遇到空桶时跳出
    while !@buckets[index].nil?
      # 若遇到 key ，返回对应的桶索引
      if @buckets[index].key == key
        # 若之前遇到了删除标记，则将键值对移动至该索引处
        if first_tombstone != -1
          @buckets[first_tombstone] = @buckets[index]
          @buckets[index] = TOMBSTONE
          return first_tombstone # 返回移动后的桶索引
        end
        return index # 返回桶索引
      end
      # 记录遇到的首个删除标记
      first_tombstone = index if first_tombstone == -1 && @buckets[index] == TOMBSTONE
      # 计算桶索引，越过尾部则返回头部
      index = (index + 1) % @capacity
    end
    # 若 key 不存在，则返回添加点的索引
    first_tombstone == -1 ? index : first_tombstone
  end

  ### 查询操作 ###
  def get(key)
    # 搜索 key 对应的桶索引
    index = find_bucket(key)
    # 若找到键值对，则返回对应 val
    return @buckets[index].val unless [nil, TOMBSTONE].include?(@buckets[index])
    # 若键值对不存在，则返回 nil
    nil
  end

  ### 添加操作 ###
  def put(key, val)
    # 当负载因子超过阈值时，执行扩容
    extend if load_factor > @load_thres
    # 搜索 key 对应的桶索引
    index = find_bucket(key)
    # 若找到键值对，则覆盖 val 开返回
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index].val = val
      return
    end
    # 若键值对不存在，则添加该键值对
    @buckets[index] = Pair.new(key, val)
    @size += 1
  end

  ### 删除操作 ###
  def remove(key)
    # 搜索 key 对应的桶索引
    index = find_bucket(key)
    # 若找到键值对，则用删除标记覆盖它
    unless [nil, TOMBSTONE].include?(@buckets[index])
      @buckets[index] = TOMBSTONE
      @size -= 1
    end
  end

  ### 扩容哈希表 ###
  def extend
    # 暂存原哈希表
    buckets_tmp = @buckets
    # 初始化扩容后的新哈希表
    @capacity *= @extend_ratio
    @buckets = Array.new(@capacity)
    @size = 0
    # 将键值对从原哈希表搬运至新哈希表
    for pair in buckets_tmp
      put(pair.key, pair.val) unless [nil, TOMBSTONE].include?(pair)
    end
  end

  ### 打印哈希表 ###
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
  # 初始化哈希表
  hashmap = HashMapOpenAddressing.new

  # 添加操作
  # 在哈希表中添加键值对 (key, val)
  hashmap.put(12836, "小哈")
  hashmap.put(15937, "小啰")
  hashmap.put(16750, "小算")
  hashmap.put(13276, "小法")
  hashmap.put(10583, "小鸭")
  puts "\n添加完成后，哈希表为\nKey -> Value"
  hashmap.print

  # 查询操作
  # 向哈希表中输入键 key ，得到值 val
  name = hashmap.get(13276)
  puts "\n输入学号 13276 ，查询到姓名 #{name}"

  # 删除操作
  # 在哈希表中删除键值对 (key, val)
  hashmap.remove(16750)
  puts "\n删除 16750 后，哈希表为\nKey -> Value"
  hashmap.print
end
