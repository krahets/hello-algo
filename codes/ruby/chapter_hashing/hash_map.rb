=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # 初始化哈希表
  hmap = {}

  # 添加操作
  # 在哈希表中添加键值对 (key, value)
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  puts "\n添加完成后，哈希表为\nKey -> Value"
  print_hash_map(hmap)

  # 查询操作
  # 向哈希表中输入键 key ，得到值 value
  name = hmap[15937]
  puts "\n输入学号 15937 ，查询到姓名 #{name}"

  # 删除操作
  # 在哈希表中删除键值对 (key, value)
  hmap.delete(10583)
  puts "\n删除 10583 后，哈希表为\nKey -> Value"
  print_hash_map(hmap)

  # 遍历哈希表
  puts "\n遍历键值对 Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\n单独遍历键 Key"
  hmap.keys.each { |key| puts key }

  puts "\n单独遍历值 Value"
  hmap.values.each { |val| puts val }
end
