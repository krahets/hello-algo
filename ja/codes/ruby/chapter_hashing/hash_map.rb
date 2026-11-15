=begin
File: hash_map.rb
Created Time: 2024-04-14
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/print_util'

### 実行用コード ###
if __FILE__ == $0
  # [region]{init_hash_map}
  # ハッシュテーブルを初期化する
  hmap = {}
  # [endregion]{init_hash_map}

  # [region]{add_pairs}
  # 追加操作
  # ハッシュテーブルにキーと値のペア (key, value) を追加する
  hmap[12836] = "小哈"
  hmap[15937] = "小啰"
  hmap[16750] = "小算"
  hmap[13276] = "小法"
  hmap[10583] = "小鸭"
  # [endregion]{add_pairs}
  puts "\n追加後のハッシュテーブル\nKey -> Value"
  print_hash_map(hmap)

  # [region]{get_value}
  # 取得操作
  # ハッシュテーブルにキー key を渡し、値 value を取得する
  name = hmap[15937]
  # [endregion]{get_value}
  puts "\n学生番号 15937 に対応する氏名は #{name}"

  # [region]{remove_pair}
  # 削除操作
  # ハッシュテーブルからキーと値のペア (key, value) を削除する
  hmap.delete(10583)
  # [endregion]{remove_pair}
  puts "\n10583 を削除した後のハッシュテーブル\nKey -> Value"
  print_hash_map(hmap)

  puts "\nキーと値のペア Key->Value を走査する"
  # [region]{iterate_pairs}
  # ハッシュテーブルを走査する
  # キーと値のペア key->value を走査する
  hmap.entries.each { |key, value| puts "#{key} -> #{value}" }
  # [endregion]{iterate_pairs}

  puts "\nキー Key だけを走査する"
  # [region]{iterate_keys}
  # キー key だけを走査する
  hmap.keys.each { |key| puts key }
  # [endregion]{iterate_keys}

  puts "\n値 Value だけを走査する"
  # [region]{iterate_values}
  # 値 value だけを走査する
  hmap.values.each { |val| puts val }
  # [endregion]{iterate_values}
end
