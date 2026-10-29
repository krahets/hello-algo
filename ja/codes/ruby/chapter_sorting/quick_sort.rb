=begin
File: quick_sort.rb
Created Time: 2024-04-01
Author: Cy (3739004@gmail.com), Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### クイックソートクラス ###
class QuickSort
  class << self
    ### 番兵を用いた分割 ###
    def partition(nums, left, right)
      # nums[left] をピボットとする
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 右から左へ、ピボットより小さい最初の要素を探す
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 左から右へ、ピボットより大きい最初の要素を探す
        end
        # 要素の交換
        nums[i], nums[j] = nums[j], nums[i]
      end
      # ピボットを 2 つの部分配列の境界に移す
      nums[i], nums[left] = nums[left], nums[i]
      i # ピボットのインデックスを返す
    end

    ### クイックソートクラス ###
    def quick_sort(nums, left, right)
      # 部分配列の長さが 1 でない場合、再帰する
      if left < right
        # 番兵を用いた分割
        pivot = partition(nums, left, right)
        # 左部分配列と右部分配列を再帰的に処理する
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### クイックソートクラス（中央値による最適化）###
class QuickSortMedian
  class << self
    ### 候補となる 3 要素の中央値を選ぶ ###
    def median_three(nums, left, mid, right)
      # 候補となる 3 要素の中央値を選ぶ
      _l, _m, _r = nums[left], nums[mid], nums[right]
      # m が l と r の間にある
      return mid if (_l <= _m && _m <= _r) || (_r <= _m && _m <= _l)
      # l が m と r の間にある
      return left if (_m <= _l && _l <= _r) || (_r <= _l && _l <= _m)
      return right
    end

    ### 番兵を用いた分割（3 値の中央値を選択）###
    def partition(nums, left, right)
      ### nums[left] をピボットとする
      med = median_three(nums, left, (left + right) / 2, right)
      # 中央値を配列の左端に移す
      nums[left], nums[med] = nums[med], nums[left]
      i, j = left, right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 右から左へ、ピボットより小さい最初の要素を探す
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 左から右へ、ピボットより大きい最初の要素を探す
        end
        # 要素の交換
        nums[i], nums[j] = nums[j], nums[i]
      end
      # ピボットを 2 つの部分配列の境界に移す
      nums[i], nums[left] = nums[left], nums[i]
      i # ピボットのインデックスを返す
    end

    ### クイックソート ###
    def quick_sort(nums, left, right)
      # 部分配列の長さが 1 でない場合、再帰する
      if left < right
        # 番兵を用いた分割
        pivot = partition(nums, left, right)
        # 左部分配列と右部分配列を再帰的に処理する
        quick_sort(nums, left, pivot - 1)
        quick_sort(nums, pivot + 1, right)
      end
      nums
    end
  end
end

### クイックソートクラス（再帰の深さの最適化）###
class QuickSortTailCall
  class << self
    ### 番兵を用いた分割 ###
    def partition(nums, left, right)
      # nums[left] をピボットとする
      i = left
      j = right
      while i < j
        while i < j && nums[j] >= nums[left]
          j -= 1 # 右から左へ、ピボットより小さい最初の要素を探す
        end
        while i < j && nums[i] <= nums[left]
          i += 1 # 左から右へ、ピボットより大きい最初の要素を探す
        end
        # 要素の交換
        nums[i], nums[j] = nums[j], nums[i]
      end
      # ピボットを 2 つの部分配列の境界に移す
      nums[i], nums[left] = nums[left], nums[i]
      i # ピボットのインデックスを返す
    end

    ### クイックソート（再帰の深さの最適化）###
    def quick_sort(nums, left, right)
      # 部分配列の長さが 1 でない場合、再帰する
      while left < right
        # 番兵を用いた分割
        pivot = partition(nums, left, right)
        # 2 つの部分配列のうち短いほうにクイックソートを適用する
        if pivot - left < right - pivot
          quick_sort(nums, left, pivot - 1)
          left = pivot + 1 # 残りの未ソート区間は [pivot + 1, right]
        else
          quick_sort(nums, pivot + 1, right)
          right = pivot - 1 # 残りの未ソート区間は [left, pivot - 1]
        end
      end
    end
  end
end

### 実行用コード ###
if __FILE__ == $0
  # クイックソート
  nums = [2, 4, 1, 0, 3, 5]
  QuickSort.quick_sort(nums, 0, nums.length - 1)
  puts "クイックソート完了後 nums = #{nums}"

  # クイックソート（中央値ピボットによる最適化）
  nums1 = [2, 4, 1, 0, 3, 5]
  QuickSortMedian.quick_sort(nums1, 0, nums1.length - 1)
  puts "クイックソート（中央値ピボットによる最適化）の完了後 nums1 = #{nums1}"

  # クイックソート（再帰の深さの最適化）
  nums2 = [2, 4, 1, 0, 3, 5]
  QuickSortTailCall.quick_sort(nums2, 0, nums2.length - 1)
  puts "クイックソート（再帰の深さの最適化）の完了後 nums2 = #{nums2}"
end
