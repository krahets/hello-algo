=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # [region]{init_list}
  # リストを初期化する
  # 初期値なし
  empty_nums = []
  # 初期値あり
  nums = [1, 3, 2, 5, 4]
  # [endregion]{init_list}
  puts "リスト nums = #{nums}"
  puts "リスト empty_nums = #{empty_nums}"

  # [region]{access_element}
  # 要素にアクセスする
  num = nums[1] # インデックス 1 の要素にアクセスする
  # [endregion]{access_element}
  puts "インデックス 1 の要素にアクセスした結果 num = #{num}"

  # [region]{update_element}
  # 要素を更新する
  nums[1] = 0 # インデックス 1 の要素を 0 に更新する
  # [endregion]{update_element}
  puts "インデックス 1 の要素を 0 に更新した結果 nums = #{nums}"

  # [region]{clear_list}
  # リストを空にする
  nums.clear
  # [endregion]{clear_list}
  puts "リストを空にした後 nums = #{nums}"

  # [region]{append_element}
  # 末尾に要素を追加する
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  # [endregion]{append_element}
  puts "要素を追加した後 nums = #{nums}"

  # [region]{insert_element}
  # 途中に要素を挿入する
  nums.insert(3, 6) # インデックス 3 に数値 6 を挿入する
  # [endregion]{insert_element}
  puts "インデックス 3 に要素 6 を挿入した結果 nums = #{nums}"

  # [region]{remove_element}
  # 要素を削除する
  nums.delete_at(3) # インデックス 3 の要素を削除する
  # [endregion]{remove_element}
  puts "インデックス 3 の要素を削除した結果 nums = #{nums}"

  # [region]{iterate_list}
  # インデックスを使ってリストを走査する
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # リストの要素を直接走査する
  count = 0
  nums.each do |x|
    count += x
  end
  # [endregion]{iterate_list}

  # [region]{concat_list}
  # 2 つのリストを連結する
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  # [endregion]{concat_list}
  puts "リスト nums の後ろに nums1 を連結した結果 nums = #{nums}"

  # [region]{sort_list}
  # リストをソートする
  nums = nums.sort { |a, b| a <=> b } # ソート後、リストの要素は昇順に並ぶ
  # [endregion]{sort_list}
  puts "リストをソートした後 nums = #{nums}"
end
