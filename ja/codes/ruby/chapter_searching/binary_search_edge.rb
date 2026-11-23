=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### 二分探索で最も左にある target を探す ###
def binary_search_left_edge(nums, target)
  # target の挿入位置を探すことに等しい
  i = binary_search_insertion(nums, target)

  # target が見つからなかったので、-1 を返す
  return -1 if i == nums.length || nums[i] != target

  i # target が見つかったので、インデックス i を返す
end

### 二分探索で最も右にある target を探す ###
def binary_search_right_edge(nums, target)
  # 最も左にある target + 1 を探す問題に変換する
  i = binary_search_insertion(nums, target + 1)

  # j は最も右にある target を指し、i は target より大きい最初の要素を指す
  j = i - 1

  # target が見つからなかったので、-1 を返す
  return -1 if j == -1 || nums[j] != target

  j # target が見つかったので、インデックス j を返す
end

### 実行用コード ###
if __FILE__ == $0
  # 重複要素を含む配列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n配列 nums = #{nums}"

  # 二分探索で左境界と右境界を求める
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "最も左にある要素 #{target} のインデックスは #{index}"
    index = binary_search_right_edge(nums, target)
    puts "最も右にある要素 #{target} のインデックスは #{index}"
  end
end
