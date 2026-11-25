=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### 最も左にある target の二分探索 ###
def binary_search_left_edge(nums, target)
  # target の挿入位置を探すことと同じ
  i = binary_search_insertion(nums, target)

  # target が見つからなかったので -1 を返す
  return -1 if i == nums.length || nums[i] != target

  i # target が見つかったのでインデックス i を返す
end

### 最も右にある target の二分探索 ###
def binary_search_right_edge(nums, target)
  # 最も左にある target + 1 の探索に置き換える
  i = binary_search_insertion(nums, target + 1)

  # j は最も右の target を、i は target より大きい最初の要素を指す
  j = i - 1

  # target が見つからなかったので -1 を返す
  return -1 if j == -1 || nums[j] != target

  j # target が見つかったのでインデックス j を返す
end

### 実行例 ###
if __FILE__ == $0
  # 重複する要素がある配列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n配列 nums = #{nums}"

  # 左端と右端の二分探索
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "最も左にある #{target} のインデックスは #{index}"
    index = binary_search_right_edge(nums, target)
    puts "最も右にある #{target} のインデックスは #{index}"
  end
end
