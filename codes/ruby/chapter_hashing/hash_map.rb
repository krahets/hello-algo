=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # [region]{init_hash_map}
  # 初始化哈希表
  hmap = {}
  # [endregion]{init_hash_map}

  # [region]{add_pairs}
  # 添加操作
  # 在哈希表中添加键值对 (key, value)
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  # [endregion]{add_pairs}
  puts "\n添加完成后，哈希表为\nKey -> Value"
  print_hash_map(hmap)

  # [region]{get_value}
  # 查询操作
  # 向哈希表中输入键 key ，得到值 value
  name = hmap[15937]
  # [endregion]{get_value}
  puts "\n输入学号 15937 ，查询到姓名 #{name}"

  # [region]{remove_pair}
  # 删除操作
  # 在哈希表中删除键值对 (key, value)
  hmap.delete(10583)
  # [endregion]{remove_pair}
  puts "\n删除 10583 后，哈希表为\nKey -> Value"
  print_hash_map(hmap)

  puts "\n遍历键值对 Key->Value"
  # [region]{iterate_pairs}
  # 遍历哈希表
  # 遍历键值对 key->value
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
  # [endregion]{iterate_pairs}

  puts "\n单独遍历键 Key"
  # [region]{iterate_keys}
  # 单独遍历键 key
  hmap.keys.each { |key| puts key }
  # [endregion]{iterate_keys}

  puts "\n单独遍历值 Value"
  # [region]{iterate_values}
  # 单独遍历值 value
  hmap.values.each { |val| puts val }
  # [endregion]{iterate_values}
end
