=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分探索（閉区間） ###
def binary_search(nums, target)
  # 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
  i, j = 0, nums.length - 1

  # 探索区間が空になるまで繰り返す（i > j のとき空）
  while i <= j
    # Ruby の整数はメモリが許す限りいくらでも大きくできるため、オーバーフローを考慮する必要はない
    m = (i + j) / 2   # 中央のインデックス m を求める
  
    if nums[m] < target
      i = m + 1 # この場合、target の探索範囲は [m+1, j]
    elsif nums[m] > target
      j = m - 1 # この場合、target の探索範囲は [i, m-1]
    else
      return m  # 目標の要素が見つかったので、そのインデックスを返す
    end
  end

  -1  # 目標の要素が見つからなかったので -1 を返す
end

### 二分探索（左閉右開区間） ###
def binary_search_lcro(nums, target)
  # 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
  i, j = 0, nums.length

  # 探索区間が空になるまで繰り返す（i = j のとき空）
  while i < j
    # 中央のインデックス m を求める
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # この場合、target の探索範囲は [m+1, j)
    elsif nums[m] > target
      j = m # この場合、target の探索範囲は [i, m)
    else
      return m  # 目標の要素が見つかったので、そのインデックスを返す
    end
  end

  -1  # 目標の要素が見つからなかったので -1 を返す
end

### 実行例 ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分探索（閉区間）
  index = binary_search(nums, target)
  puts "目標値 6 のインデックス =  #{index}"

  # 二分探索（左閉右開区間）
  index = binary_search_lcro(nums, target)
  puts "目標値 6 のインデックス =  #{index}"
end
