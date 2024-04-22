=begin
File: array_hash_map.rb
Created Time: 2024-04-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 鍵值對 ###
class Pair
  attr_accessor :key, :val

  def initialize(key, val)
    @key = key
    @val = val
  end
end

### 基於陣列實現的雜湊表 ###
class ArrayHashMap
  ### 建構子 ###
  def initialize
    # 初始化陣列，包含 100 個桶
    @buckets = Array.new(100)
  end

  ### 雜湊函式 ###
  def hash_func(key)
    index = key % 100
  end

  ### 查詢操作 ###
  def get(key)
    index = hash_func(key)
    pair = @buckets[index]

    return if pair.nil?
    pair.val
  end

  ### 新增操作 ###
  def put(key, val)
    pair = Pair.new(key, val)
    index = hash_func(key)
    @buckets[index] = pair
  end

  ### 刪除操作 ###
  def remove(key)
    index = hash_func(key)
    # 置為 nil ，代表刪除
    @buckets[index] = nil
  end

  ### 獲取所有鍵值對 ###
  def entry_set
    result = []
    @buckets.each { |pair| result << pair unless pair.nil? }
    result
  end

  ### 獲取所有鍵 ###
  def key_set
    result = []
    @buckets.each { |pair| result << pair.key unless pair.nil? }
    result
  end

  ### 獲取所有值 ###
  def value_set
    result = []
    @buckets.each { |pair| result << pair.val unless pair.nil? }
    result
  end

  ### 列印雜湊表 ###
  def print
    @buckets.each { |pair| puts "#{pair.key} -> #{pair.val}" unless pair.nil? }
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化雜湊表
  hmap = ArrayHashMap.new

  # 新增操作
  # 在雜湊表中新增鍵值對 (key, value)
  hmap.put(12836, "小哈")
  hmap.put(15937, "小囉")
  hmap.put(16750, "小算")
  hmap.put(13276, "小法")
  hmap.put(10583, "小鴨")
  puts "\n新增完成後，雜湊表為\nKey -> Value"
  hmap.print

  # 查詢操作
  # 向雜湊表中輸入鍵 key , 得到值 value
  name = hmap.get(15937)
  puts "\n輸入學號 15937 ，查詢到姓名 #{name}"

  # 刪除操作
  # 在雜湊表中刪除值對 (key, value)
  hmap.remove(10583)
  puts "\n刪除 10583 後，雜湊表為\nKey -> Value"
  hmap.print

  # 走訪雜湊表
  puts "\n走訪鍵值對 Key->Value"
  for pair in hmap.entry_set
    puts "#{pair.key} -> #{pair.val}"
  end

  puts "\n單獨篇走訪鍵 Key"
  for key in hmap.key_set
    puts key
  end

  puts "\n單獨走訪值 Value"
  for val in hmap.value_set
    puts val
  end
end
