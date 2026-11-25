=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 挿入位置の二分探索（重複する要素がない場合） ###
def binary_search_insertion_simple(nums, target)
  # 閉区間 [0, n-1] で初期化する
  i, j = 0, nums.length - 1

  while i <= j
    # 中央のインデックス m を求める
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target の探索範囲は [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target の探索範囲は [i, m-1]
    else
      return m  # target が見つかったので挿入位置 m を返す
    end
  end

  i # target が見つからなかったので挿入位置 i を返す
end

### 挿入位置の二分探索（重複する要素がある場合） ###
def binary_search_insertion(nums, target)
  # 閉区間 [0, n-1] で初期化する
  i, j = 0, nums.length - 1

  while i <= j
    # 中央のインデックス m を求める
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target の探索範囲は [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target の探索範囲は [i, m-1]
    else
      j = m - 1 # target 未満の最も右の要素を [i, m-1] で探す
    end
  end

  i # 挿入位置 i を返す
end

### 実行例 ###
if __FILE__ == $0
  # 重複する要素がない配列
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\n配列 nums = #{nums}"
  # 挿入位置の二分探索
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "要素 #{target} の挿入位置のインデックスは #{index}"
  end

  # 重複する要素がある配列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n配列 nums = #{nums}"
  # 挿入位置の二分探索
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "要素 #{target} の挿入位置のインデックスは #{index}"
  end
end
