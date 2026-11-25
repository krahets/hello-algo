=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 選択ソート ###
def selection_sort(nums)
  n = nums.length
  # 外側のループ：未整列区間は [i, n-1]
  for i in 0...(n - 1)
    # 内側のループ：未整列区間の最小要素を探す
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # 最小要素のインデックスを記録
      end
    end
    # その最小要素と未整列区間の先頭要素を交換
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### 実行例 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "選択ソート後の nums = #{nums}"
end
