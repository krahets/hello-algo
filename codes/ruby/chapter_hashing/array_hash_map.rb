=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 键值对 ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

### 基于数组实现的哈希表 ###
class ArrayHashMap
  ### 构造方法 ###
  def initialize
    # 初始化数组，包含 100 个桶
    @buckets = Array.new(100)
  end

  ### 哈希函数 ###
  def hash_func(key)
    index = key % 100
  end

  ### 查询操作 ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### 添加操作 ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### 删除操作 ###
  def remove(key)
    index = hash_func(key)
    # 置为 nil ，代表删除
    @buckets[index] = nil
  end

  ### 获取所有键值对 ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### 获取所有键 ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### 获取所有值 ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### 打印哈希表 ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化哈希表
  hmap = ArrayHashMap.new

  # 添加操作
  # 在哈希表中添加键值对 (key, value)
  hmap.put(12836, "小哈")
  hmap.put(15937, "小啰")
  hmap.put(16750, "小算")
  hmap.put(13276, "小法")
  hmap.put(10583, "小鸭")
  puts "\n添加完成后，哈希表为\nKey -> Value"
  hmap.print

  # 查询操作
  # 向哈希表中输入键 key , 得到值 value
  name = hmap.get(15937)
  puts "\n输入学号 15937 ，查询到姓名 #{name}"

  # 删除操作
  # 在哈希表中删除值对 (key, value)
  hmap.remove(10583)
  puts "\n删除 10583 后，哈希表为\nKey -> Value"
  hmap.print

  # 遍历哈希表
  puts "\n遍历键值对 Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\n单独篇遍历键 Key"
  for key in hmap.key_set
    puts key
  end

  puts "\n单独遍历值 Value"
  for val in hmap.value_set
    puts val
  end
end
