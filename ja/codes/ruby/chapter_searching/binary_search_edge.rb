=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### target の最左位置を二分探索 ###
def binary_search_left_edge(nums, target)
  # target の挿入位置を探すのと等価
  i = binary_search_insertion(nums, target)

  # target が見つからなければ、-1 を返す
  return -1 if i == nums.length || nums[i] != target

  i # target が見つかったら、インデックス i を返す
end

### target の最右位置を二分探索 ###
def binary_search_right_edge(nums, target)
  # 最左の target + 1 を探す問題に変換する
  i = binary_search_insertion(nums, target + 1)

  # j は最も右の target を指し、i は target より大きい最初の要素を指す
  j = i - 1

  # target が見つからなければ、-1 を返す
  return -1 if j == -1 || nums[j] != target

  j # target が見つかったら、インデックス j を返す
end

### Driver Code ###
if __FILE__ == $0
  # 重複要素を含む配列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n配列 nums = #{nums}"

  # 二分探索で左端と右端を探す
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "最も左の要素 #{target} のインデックスは #{index}"
    index = binary_search_right_edge(nums, target)
    puts "最も右の要素 #{target} のインデックスは #{index}"
  end
end
