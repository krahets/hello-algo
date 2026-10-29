=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 長さ n のヒープを、ノード i から下向きにヒープ化する ###
def sift_down(nums, n, i)
  while true
    # ノード i, l, r のうち値が最大のノードを求め、ma とする
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
    break if ma == i
    # 2 つのノードを交換する
    nums[i], nums[ma] = nums[ma], nums[i]
    # 下向きのヒープ化を繰り返す
    i = ma
  end
end

### ヒープソート ###
def heap_sort(nums)
  # ヒープの構築：葉ノード以外の全ノードをヒープ化する
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # ヒープから最大要素を取り出す処理を n-1 回繰り返す
  (nums.length - 1).downto(1) do |i|
    # 根と最右の葉を交換（先頭要素と末尾要素を交換）
    nums[0], nums[i] = nums[i], nums[0]
    # 根ノードから下向きにヒープ化する
    sift_down(nums, i, 0)
  end
end

### 実行用コード ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "ヒープソート完了後 nums = #{nums.inspect}"
end
