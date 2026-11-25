=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 主程式 ###
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
  puts "\n新增後的雜湊表\nKey -> Value"
  print_hash_map(hmap)

  # 查詢操作
  # 輸入鍵 key，從雜湊表取得對應的值 value
  name = hmap[15937]
  puts "\n輸入學號 15937，查得姓名 #{name}"

  # 刪除操作
  # 從雜湊表刪除鍵值對 (key, value)
  hmap.delete(10583)
  puts "\n刪除 10583 後的雜湊表\nKey -> Value"
  print_hash_map(hmap)

  # 走訪雜湊表
  puts "\n走訪鍵值對 Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\n只走訪鍵 Key"
  hmap.keys.each { |key| puts key }

  puts "\n只走訪值 Value"
  hmap.values.each { |val| puts val }
end
