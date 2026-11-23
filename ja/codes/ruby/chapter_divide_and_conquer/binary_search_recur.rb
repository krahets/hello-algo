=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二分探索：問題 f(i, j) ###
def dfs(nums, target, i, j)
  # 区間が空なら目的の要素が存在しないため、-1 を返す
  return -1 if i > j
  
  # 中央のインデックス m を計算する
  m = (i + j) / 2

  if nums[m] < target
    # 部分問題 f(m+1, j) を再帰的に解く
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # 部分問題 f(i, m-1) を再帰的に解く
    return dfs(nums, target, i, m - 1)
  else
    # 目的の要素が見つかったので、そのインデックスを返す
    return m
  end
end

### 二分探索 ###
def binary_search(nums, target)
  n = nums.length
  # 問題 f(0, n-1) を解く
  dfs(nums, target, 0, n - 1)
end

### 実行用コード ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分探索（閉区間）
  index = binary_search(nums, target)
  puts "目的の要素 6 のインデックス = #{index}"
end
