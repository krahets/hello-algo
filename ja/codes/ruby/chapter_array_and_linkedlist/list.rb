=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 実行用コード ###
if __FILE__ == $0
  # リストを初期化する
  nums = [1, 3, 2, 5, 4]
  puts "リスト nums = #{nums}"

  # 要素にアクセスする
  num = nums[1]
  puts "インデックス 1 の要素にアクセスした結果 num = #{num}"

  # 要素を更新する
  nums[1] = 0
  puts "インデックス 1 の要素を 0 に更新した結果 nums = #{nums}"

  # リストを空にする
  nums.clear
  puts "リストを空にした後 nums = #{nums}"

  # 末尾に要素を追加する
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "要素を追加した後 nums = #{nums}"

  # 途中に要素を挿入する
  nums.insert(3, 6)
  puts "インデックス 3 に要素 6 を挿入した結果 nums = #{nums}"

  # 要素を削除する
  nums.delete_at(3)
  puts "インデックス 3 の要素を削除した結果 nums = #{nums}"

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

  # 2 つのリストを連結する
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "リスト nums の後ろに nums1 を連結した結果 nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "リストをソートした後 nums = #{nums}"
end
