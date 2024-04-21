=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # 初始化雜湊表
  hmap = {}

  # 新增操作
  # 在雜湊表中新增鍵值對 (key, value)
  hmap[12836] = "小哈"
  hmap[15937] = "小囉"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鴨"
  puts "\n新增完成後，雜湊表為\nKey -> Value"
  print_hash_map(hmap)

  # 查詢操作
  # 向雜湊表中輸入鍵 key ，得到值 value
  name = hmap[15937]
  puts "\n輸入學號 15937 ，查詢到姓名 #{name}"

  # 刪除操作
  # 在雜湊表中刪除鍵值對 (key, value)
  hmap.delete(10583)
  puts "\n刪除 10583 後，雜湊表為\nKey -> Value"
  print_hash_map(hmap)

  # 走訪雜湊表
  puts "\n走訪鍵值對 Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\n單獨走訪鍵 Key"
  hmap.keys.each { |key| puts key }

  puts "\n單獨走訪值 Value"
  hmap.values.each { |val| puts val }
end
