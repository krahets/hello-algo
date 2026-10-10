/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* クイックソートクラス */
/* 番兵分割 */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // nums[left] を基準値とする
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // 右から左へ基準値未満の最初の要素を探す
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // 左から右へ基準値より大きい最初の要素を探す
        }
        nums.swapAt(i, j) // この 2 つの要素を交換
    }
    nums.swapAt(i, left) // 基準値を 2 つの部分配列の境界へ交換する
    return i // 基準値のインデックスを返す
}

/* クイックソート */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // 部分配列の長さが 1 なら再帰を終了する
    if left >= right {
        return
    }
    // 番兵分割
    let pivot = partition(nums: &nums, left: left, right: right)
    // 左右の部分配列を再帰処理
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* クイックソートクラス（中央値ピボット最適化） */
/* 3つの候補要素の中央値を選ぶ */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m は l と r の間
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l は m と r の間
    }
    return right
}

/* 番兵による分割処理（3 点中央値） */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // 3つの候補要素の中央値を選ぶ
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // 中央値を配列の最左端に交換する
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* クイックソート（中央値の基準値で最適化） */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // 部分配列の長さが 1 なら再帰を終了する
    if left >= right {
        return
    }
    // 番兵分割
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // 左右の部分配列を再帰処理
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* クイックソート（再帰深度最適化） */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // 部分配列の長さが 1 なら終了
    while left < right {
        // 番兵による分割処理
        let pivot = partition(nums: &nums, left: left, right: right)
        // 2 つの部分配列のうち短いほうにクイックソートを適用する
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 左部分配列を再帰的にソート
            left = pivot + 1 // 未ソート区間の残りは [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 右部分配列を再帰的にソート
            right = pivot - 1 // 未ソート区間の残りは [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Driver Code */
    static func main() {
        /* クイックソート */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("クイックソート完了後 nums = \(nums)")

        /* クイックソート（中央値の基準値で最適化） */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("クイックソート（中央値ピボット最適化）完了後 nums1 = \(nums1)")

        /* クイックソート（再帰深度最適化） */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("クイックソート（再帰深度最適化）完了後 nums2 = \(nums2)")
    }
}
