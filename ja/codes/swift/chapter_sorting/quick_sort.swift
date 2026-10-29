/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* クイックソートクラス */
/* 番兵を用いた分割 */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // nums[left] をピボットとする
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // 右から左へ、ピボットより小さい最初の要素を探す
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // 左から右へ、ピボットより大きい最初の要素を探す
        }
        nums.swapAt(i, j) // この 2 つの要素を交換する
    }
    nums.swapAt(i, left) // ピボットを 2 つの部分配列の境界に移す
    return i // ピボットのインデックスを返す
}

/* クイックソート */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // 部分配列の長さが 1 になったら再帰を終了する
    if left >= right {
        return
    }
    // 番兵を用いた分割
    let pivot = partition(nums: &nums, left: left, right: right)
    // 左部分配列と右部分配列を再帰的に処理する
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* クイックソートクラス（中央値ピボットによる最適化） */
/* 候補となる 3 要素の中央値を選ぶ */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m が l と r の間にある
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l が m と r の間にある
    }
    return right
}

/* 番兵を用いた分割（3 値の中央値を選択） */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // 候補となる 3 要素の中央値を選ぶ
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // 中央値を配列の左端に移す
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* クイックソート（中央値ピボットによる最適化） */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // 部分配列の長さが 1 になったら再帰を終了する
    if left >= right {
        return
    }
    // 番兵を用いた分割
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // 左部分配列と右部分配列を再帰的に処理する
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* クイックソート（再帰の深さの最適化） */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // 部分配列の長さが 1 になったら終了する
    while left < right {
        // 番兵を用いた分割操作
        let pivot = partition(nums: &nums, left: left, right: right)
        // 2 つの部分配列のうち短いほうにクイックソートを適用する
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // 左部分配列を再帰的にソートする
            left = pivot + 1 // 残りの未ソート区間は [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // 右部分配列を再帰的にソートする
            right = pivot - 1 // 残りの未ソート区間は [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* 実行用コード */
    static func main() {
        /* クイックソート */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("クイックソート完了後 nums = \(nums)")

        /* クイックソート（中央値ピボットによる最適化） */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("クイックソート（中央値ピボットによる最適化）の完了後 nums1 = \(nums1)")

        /* クイックソート（再帰の深さの最適化） */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("クイックソート（再帰の深さの最適化）の完了後 nums2 = \(nums2)")
    }
}
