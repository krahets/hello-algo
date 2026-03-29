=begin
File: selection_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 選択ソート ###
def selection_sort(nums)
  n = nums.length
  # 外側ループ：未整列区間は [i, n-1]
  for i in 0...(n - 1)
    # 内側のループ：未ソート区間の最小要素を見つける
    k = i
    for j in (i + 1)...n
      if nums[j] < nums[k]
        k = j # 最小要素のインデックスを記録
      end
    end
    # その最小要素を未整列区間の先頭要素と交換する
    nums[i], nums[k] = nums[k], nums[i]
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  selection_sort(nums)
  puts "選択ソート完了後 nums = #{nums}"
end
