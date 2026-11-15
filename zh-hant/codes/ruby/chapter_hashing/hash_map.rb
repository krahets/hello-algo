=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # [region]{init_hash_map}
  # 初始化雜湊表
  hmap = {}
  # [endregion]{init_hash_map}

  # [region]{add_pairs}
  # 新增操作
  # 在雜湊表中新增鍵值對 (key, value)
  hmap[12836] = "小哈"
  hmap[15937] = "小囉"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鴨"
  # [endregion]{add_pairs}
  puts "\n新增完成後，雜湊表為\nKey -> Value"
  print_hash_map(hmap)

  # [region]{get_value}
  # 查詢操作
  # 向雜湊表中輸入鍵 key ，得到值 value
  name = hmap[15937]
  # [endregion]{get_value}
  puts "\n輸入學號 15937 ，查詢到姓名 #{name}"

  # [region]{remove_pair}
  # 刪除操作
  # 在雜湊表中刪除鍵值對 (key, value)
  hmap.delete(10583)
  # [endregion]{remove_pair}
  puts "\n刪除 10583 後，雜湊表為\nKey -> Value"
  print_hash_map(hmap)

  puts "\n走訪鍵值對 Key->Value"
  # [region]{iterate_pairs}
  # 走訪雜湊表
  # 走訪鍵值對 key->value
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
  # [endregion]{iterate_pairs}

  puts "\n單獨走訪鍵 Key"
  # [region]{iterate_keys}
  # 單獨走訪鍵 key
  hmap.keys.each { |key| puts key }
  # [endregion]{iterate_keys}

  puts "\n單獨走訪值 Value"
  # [region]{iterate_values}
  # 單獨走訪值 value
  hmap.values.each { |val| puts val }
  # [endregion]{iterate_values}
end
