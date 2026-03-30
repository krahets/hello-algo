=begin
File: insertion_sort.rb
Created Time: 2024-04-02
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 挿入ソート ###
def insertion_sort(nums)
  n = nums.length
  # 外側ループ：整列済み区間は [0, i-1]
  for i in 1...n
    base = nums[i]
    j = i - 1
    # 内側ループ: base をソート済み区間 [0, i-1] の正しい位置に挿入する
    while j >= 0 && nums[j] > base
      nums[j + 1] = nums[j] # nums[j] を 1 つ右へ移動する
      j -= 1
    end
    nums[j + 1] = base # base を正しい位置に配置する
  end
end

### Driver Code ###
nums = [4, 1, 3, 1, 5, 2]
insertion_sort(nums)
puts "挿入ソート完了後 nums = #{nums}"
