=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 実行例 ###
if __FILE__ == $0
  # ハッシュ表を初期化する
  hmap = {}

  # 追加
  # ハッシュ表にペア (key, value) を追加する
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  puts "\n追加後のハッシュ表\nKey -> Value"
  print_hash_map(hmap)

  # 検索
  # ハッシュ表でキー key に対応する値 value を取得する
  name = hmap[15937]
  puts "\n学籍番号 15937 に対応する名前は #{name}"

  # 削除
  # ハッシュ表からペア (key, value) を削除する
  hmap.delete(10583)
  puts "\n10583 を削除した後のハッシュ表\nKey -> Value"
  print_hash_map(hmap)

  # ハッシュ表を走査する
  puts "\nキーと値のペアを順に表示 Key->Value"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nキーだけを順に表示 Key"
  hmap.keys.each { |key| puts key }

  puts "\n値だけを順に表示 Value"
  hmap.values.each { |val| puts val }
end
