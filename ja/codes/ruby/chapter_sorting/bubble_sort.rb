=begin
File: bubble_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### バブルソート ###
def bubble_sort(nums)
  n = nums.length
  # 外側のループ：未整列区間は [0, i]
  for i in (n - 1).downto(1)
    # 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j] と nums[j + 1] を交換
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
      end
    end
  end
end

### バブルソート（フラグによる最適化）###
def bubble_sort_with_flag(nums)
  n = nums.length
  # 外側のループ：未整列区間は [0, i]
  for i in (n - 1).downto(1)
    flag = false # フラグを初期化

    # 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j] と nums[j + 1] を交換
        nums[j], nums[j + 1] = nums[j + 1], nums[j]
        flag = true # 交換があったことを記録
      end
    end

    break unless flag # この走査で交換がなければループを終了
  end
end

### 実行例 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  bubble_sort(nums)
  puts "バブルソート後の nums = #{nums}"

  nums1 = [4, 1, 3, 1, 5, 2]
  bubble_sort_with_flag(nums1)
  puts "バブルソート後の nums = #{nums1}"
end
