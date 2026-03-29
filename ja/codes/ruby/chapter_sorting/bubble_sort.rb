=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バブルソート ###
def bubble_sort(nums)
  n = nums.length
  # 外側のループ：未ソート区間は [0, i]
  for i in (n - 1).downto(1)
    # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j] と nums[j + 1] を交換
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

# ## バブルソート（フラグ最適化）###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 外側のループ：未ソート区間は [0, i]
  for i in (n - 1).downto(1)
    flag = false # フラグを初期化する

    # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j] と nums[j + 1] を交換
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 交換する要素を記録
      end
    end

    break unless flag # このバブル処理で要素交換が一度もなければそのまま終了
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "バブルソート完了後 nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "バブルソート完了後 nums = #{nums1}"
end
