=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # ハッシュテーブルを初期化
  hmap = {}

  # 追加操作
  # ハッシュテーブルにキーと値の組 (key, value) を追加する
  hmap[12836] = "シャオハー"
  hmap[15937] = "シャオルオ"
  hmap[16750] = "シャオスワン"
  hmap[13276] = "シャオファー"
  hmap[10583] = "シャオヤー"
  puts "\n追加完了後、ハッシュテーブルは\nKey -> Value"
  print_hash_map(hmap)

  # 検索操作
  # ハッシュテーブルにキー key を入力し、値 value を取得する
  name = hmap[15937]
  puts "\n学籍番号 15937 を入力すると、名前 #{name} が見つかりました"

  # 削除操作
  # ハッシュテーブルからキーと値の組 (key, value) を削除する
  hmap.delete(10583)
  puts "\n10583 を削除した後、ハッシュテーブルは\nKey -> Value"
  print_hash_map(hmap)

  # ハッシュテーブルを走査
  puts "\nキーと値のペア Key->Value を走査"
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

  puts "\nキー Key のみを個別に走査"
  hmap.keys.each { |key| puts key }

  puts "\n値 Value のみを個別に走査"
  hmap.values.each { |val| puts val }
end
