=begin
File: insertion_sort.rb
Created Time: 2024-04-02
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 挿入ソート ###
def insertion_sort(nums)
  n = nums.length
  # 外側のループ：ソート済み区間は [0, i-1]
  for i in 1...n
    base = nums[i]
    j = i - 1
    # 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
    while j >= 0 && nums[j] > base
      nums[j + 1] = nums[j] # nums[j] を右に 1 つずらす
      j -= 1
    end
    nums[j + 1] = base # 正しい位置に base を代入する
  end
end

### 実行用コード ###
nums = [4, 1, 3, 1, 5, 2]
insertion_sort(nums)
puts "挿入ソート完了後 nums = #{nums}"
