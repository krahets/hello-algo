=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分探索による挿入位置の探索（重複要素がない場合） ###
def binary_search_insertion_simple(nums, target)
  # 閉区間 [0, n-1] を初期化する
  i, j = 0, nums.length - 1

  while i <= j
    # 中央のインデックス m を計算する
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target は区間 [m+1, j] に存在する
    elsif nums[m] > target
      j = m - 1 # target は区間 [i, m-1] に存在する
    else
      return m  # target が見つかったので、挿入位置 m を返す
    end
  end

  i # target が見つからなかったので、挿入位置 i を返す
end

### 二分探索による挿入位置の探索（重複要素がある場合） ###
def binary_search_insertion(nums, target)
  # 閉区間 [0, n-1] を初期化する
  i, j = 0, nums.length - 1

  while i <= j
    # 中央のインデックス m を計算する
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target は区間 [m+1, j] に存在する
    elsif nums[m] > target
      j = m - 1 # target は区間 [i, m-1] に存在する
    else
      j = m - 1 # target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
    end
  end

  i # 挿入位置 i を返す
end

### 実行用コード ###
if __FILE__ == $0
  # 重複要素のない配列
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\n配列 nums = #{nums}"
  # 二分探索による挿入位置の探索
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "要素 #{target} の挿入位置のインデックスは #{index}"
  end

  # 重複要素を含む配列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n配列 nums = #{nums}"
  # 二分探索による挿入位置の探索
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "要素 #{target} の挿入位置のインデックスは #{index}"
  end
end
