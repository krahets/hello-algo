=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 実行用コード ###
if __FILE__ == $0
  # ハッシュテーブルを初期化する
  hmap = {}

  # 追加操作
  # ハッシュテーブルにキーと値のペア (key, value) を追加する
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  puts "\n追加後のハッシュテーブル\nKey -> Value"
  print_hash_map(hmap)

  # 取得操作
  # ハッシュテーブルにキー key を渡し、値 value を取得する
  name = hmap[15937]
  puts "\n学生番号 15937 に対応する氏名は #{name}"

  # 削除操作
  # ハッシュテーブルからキーと値のペア (key, value) を削除する
  hmap.delete(10583)
  puts "\n10583 を削除した後のハッシュテーブル\nKey -> Value"
  print_hash_map(hmap)

  # ハッシュテーブルを走査する
  puts "\nキーと値のペア Key->Value を走査する"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nキー Key だけを走査する"
  hmap.keys.each { |key| puts key }

  puts "\n値 Value だけを走査する"
  hmap.values.each { |val| puts val }
end
