=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分探索（閉区間） ###
def binary_search(nums, target)
  # 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
  i, j = 0, nums.length - 1

  # 探索区間が空になるまで繰り返す（i > j のとき空になる）
  while i <= j
    # 理論上、Ruby の数値は無限に大きくできる（メモリ容量による）ため、大きな数のオーバーフローを考慮する必要がない
    m = (i + j) / 2   # 中央のインデックス m を計算する
  
    if nums[m] < target
      i = m + 1 # この場合、target は区間 [m+1, j] に存在する
    elsif nums[m] > target
      j = m - 1 # この場合、target は区間 [i, m-1] に存在する
    else
      return m  # 目的の要素が見つかったので、そのインデックスを返す
    end
  end

  -1  # 目的の要素が見つからなかったので、-1 を返す
end

### 二分探索（左閉右開区間） ###
def binary_search_lcro(nums, target)
  # 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
  i, j = 0, nums.length

  # 探索区間が空になるまで繰り返す（i = j のとき空になる）
  while i < j
    # 中央のインデックス m を計算する
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # この場合、target は区間 [m+1, j) に存在する
    elsif nums[m] > target
      j = m - 1 # この場合、target は区間 [i, m) に存在する
    else
      return m  # 目的の要素が見つかったので、そのインデックスを返す
    end
  end

  -1  # 目的の要素が見つからなかったので、-1 を返す
end

### 実行用コード ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分探索（閉区間）
  index = binary_search(nums, target)
  puts "目的の要素 6 のインデックス =  #{index}"

  # 二分探索（左閉右開区間）
  index = binary_search_lcro(nums, target)
  puts "目的の要素 6 のインデックス =  #{index}"
end
