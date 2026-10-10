=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### クイックソートクラス ###
class QuickSort
  class << self
    ### 番兵分割 ###
    def partition(nums, left, right)
      # nums[left] を基準値とする
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 右から左へ基準値未満の最初の要素を探す
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 左から右へ基準値より大きい最初の要素を探す
        end
        # 要素の交換
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 基準値を 2 つの部分配列の境界へ交換する
      nums[i], nums[left] = nums[left], nums[i]
      i # 基準値のインデックスを返す
    end

    ### クイックソートクラス ###
    def quick_sort(nums, left, right)
      # 部分配列の長さが 1 でない場合は再帰する
      if left < right
        # 番兵分割
        pivot = partition(nums, left, right)
        # 左右の部分配列を再帰処理
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## クイックソートクラス（中央値最適化）###
class QuickSortMedian
  class << self
    ### 3 つの候補要素の中央値を選ぶ ###
    def median_three(nums, left, mid, right)
      # 3つの候補要素の中央値を選ぶ
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m は l と r の間
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l は m と r の間
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    # ## 番兵分割（三数中央値）###
    def partition(nums, left, right)
      # ## nums[left] を基準値とする
      med = median_three(nums, left, (left + right) / 2, right)
      # 中央値を配列の最左端に交換する
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 右から左へ基準値未満の最初の要素を探す
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 左から右へ基準値より大きい最初の要素を探す
        end
        # 要素の交換
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 基準値を 2 つの部分配列の境界へ交換する
      nums[i], nums[left] = nums[left], nums[i]
      i # 基準値のインデックスを返す
    end

    ### クイックソート ###
    def quick_sort(nums, left, right)
      # 部分配列の長さが 1 でない場合は再帰する
      if left < right
        # 番兵分割
        pivot = partition(nums, left, right)
        # 左右の部分配列を再帰処理
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

# ## クイックソートクラス（再帰深度最適化）###
class QuickSortTailCall
  class << self
    ### 番兵分割 ###
    def partition(nums, left, right)
      # nums[left] を基準値とする
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 右から左へ基準値未満の最初の要素を探す
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 左から右へ基準値より大きい最初の要素を探す
        end
        # 要素の交換
        nums[i], nums[j] = nums[j], nums[i]
      end
      # 基準値を 2 つの部分配列の境界へ交換する
      nums[i], nums[left] = nums[left], nums[i]
      i # 基準値のインデックスを返す
    end

    # ## クイックソート（再帰深度最適化）###
    def quick_sort(nums, left, right)
      # 部分配列の長さが 1 でない場合は再帰する
      while left < right
        # 番兵分割
        pivot = partition(nums, left, right)
        # 2 つの部分配列のうち短いほうにクイックソートを適用する
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 未ソート区間の残りは [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 未ソート区間の残りは [left, pivot - 1]
        end
      end
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # クイックソート
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "クイックソート完了後 nums = #{nums}"

  # クイックソート（中央値の基準値で最適化）
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "クイックソート（中央値ピボット最適化）完了後 nums1 = #{nums1}"

  # クイックソート（再帰深度最適化）
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "クイックソート（再帰深度最適化）完了後 nums2 = #{nums2}"
end
