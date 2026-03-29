=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分探索（両閉区間） ###
def binary_search(nums, target)
  # 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
  i, j = 0, nums.length - 1

  # ループし、探索区間が空になったら終了する（i > j で空）
  while i <= j
    # 理論上、Ruby の数値は無限に大きくできるため（メモリ容量に依存）、大きな数のオーバーフローを考慮する必要はない
    m = (i + j) / 2   # 中点インデックス m を計算
  
    if nums[m] < target
      i = m + 1 # この場合、target は区間 [m+1, j] にある
    elsif nums[m] > target
      j = m - 1 # この場合、target は区間 [i, m-1] にある
    else
      return m  # 目標要素が見つかったらそのインデックスを返す
    end
  end

  -1  # 目標要素が見つからなければ -1 を返す
end

### 二分探索（左閉右開区間） ###
def binary_search_lcro(nums, target)
  # 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
  i, j = 0, nums.length

  # ループし、探索区間が空になったら終了する（i = j で空）
  while i < j
    # 中点インデックス m を計算
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # この場合、target は区間 [m+1, j) にある
    elsif nums[m] > target
      j = m - 1 # この場合、target は区間 [i, m) にある
    else
      return m  # 目標要素が見つかったらそのインデックスを返す
    end
  end

  -1  # 目標要素が見つからなければ -1 を返す
end

### Driver Code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分探索（両閉区間）
  index = binary_search(nums, target)
  puts "対象要素 6 のインデックス =  #{index}"

  # 二分探索（左閉右開区間）
  index = binary_search_lcro(nums, target)
  puts "対象要素 6 のインデックス =  #{index}"
end
