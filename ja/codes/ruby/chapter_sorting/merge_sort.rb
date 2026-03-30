=begin
File: merge_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 左部分配列と右部分配列をマージ ###
def merge(nums, left, mid, right)
  # 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
  # マージ結果を格納する一時配列 tmp を作成
  tmp = Array.new(right - left + 1, 0)
  # 左右の部分配列の開始インデックスを初期化する
  i, j, k = left, mid + 1, 0
  # 左右の部分配列にまだ要素がある間は比較し、小さいほうを一時配列にコピーする
  while i <= mid && j <= right
    if nums[i] <= nums[j]
      tmp[k] = nums[i]
      i += 1
    else
      tmp[k] = nums[j]
      j += 1
    end
    k += 1
  end
  # 左右の部分配列の残り要素を一時配列にコピーする
  while i <= mid
    tmp[k] = nums[i]
    i += 1
    k += 1
  end
  while j <= right
    tmp[k] = nums[j]
    j += 1
    k += 1
  end
  # 一時配列 tmp の要素を元の配列 nums の対応区間にコピーする
  (0...tmp.length).each do |k|
    nums[left + k] = tmp[k]
  end
end

### マージソート ###
def merge_sort(nums, left, right)
  # 終了条件
  # 部分配列の長さが 1 になったら再帰を終了する
  return if left >= right
  # 分割フェーズ
  mid = left + (right - left) / 2 # 中点を計算
  merge_sort(nums, left, mid) # 左部分配列を再帰処理
  merge_sort(nums, mid + 1, right) # 右部分配列を再帰処理
  # マージフェーズ
  merge(nums, left, mid, right)
end

### Driver Code ###
if __FILE__ == $0
  nums = [7, 3, 2, 6, 0, 1, 5, 4]
  merge_sort(nums, 0, nums.length - 1)
  puts "マージソート完了後 nums = #{nums.inspect}"
end
