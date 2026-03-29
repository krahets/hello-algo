/**
 * File: quick_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 要素の交換 */
fun swap(nums: IntArray, i: Int, j: Int) {
    val temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

/* 番兵分割 */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // nums[left] を基準値とする
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // 右から左へ基準値未満の最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++           // 左から右へ基準値より大きい最初の要素を探す
        swap(nums, i, j)  // この 2 つの要素を交換
    }
    swap(nums, i, left)   // 基準値を 2 つの部分配列の境界へ交換する
    return i              // 基準値のインデックスを返す
}

/* クイックソート */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // 部分配列の長さが 1 なら再帰を終了する
    if (left >= right) return
    // 番兵分割
    val pivot = partition(nums, left, right)
    // 左右の部分配列を再帰処理
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 3つの候補要素の中央値を選ぶ */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m は l と r の間
    if ((l in m..r) || (l in r..m))
        return left // l は m と r の間
    return right
}

/* 番兵による分割処理（3 点中央値） */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // 3つの候補要素の中央値を選ぶ
    val med = medianThree(nums, left, (left + right) / 2, right)
    // 中央値を配列の最左端に交換する
    swap(nums, left, med)
    // nums[left] を基準値とする
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // 右から左へ基準値未満の最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++                      // 左から右へ基準値より大きい最初の要素を探す
        swap(nums, i, j)             // この 2 つの要素を交換
    }
    swap(nums, i, left)              // 基準値を 2 つの部分配列の境界へ交換する
    return i                         // 基準値のインデックスを返す
}

/* クイックソート */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // 部分配列の長さが 1 なら再帰を終了する
    if (left >= right) return
    // 番兵分割
    val pivot = partitionMedian(nums, left, right)
    // 左右の部分配列を再帰処理
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* クイックソート（再帰深度最適化） */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // 部分配列の長さが 1 なら終了
    var l = left
    var r = right
    while (l < r) {
        // 番兵による分割処理
        val pivot = partition(nums, l, r)
        // 2 つの部分配列のうち短いほうにクイックソートを適用する
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // 左部分配列を再帰的にソート
            l = pivot + 1 // 未ソート区間の残りは [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // 右部分配列を再帰的にソート
            r = pivot - 1 // 未ソート区間の残りは [left, pivot - 1]
        }
    }
}

/* Driver Code */
fun main() {
    /* クイックソート */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("クイックソート完了後 nums = ${nums.contentToString()}")

    /* クイックソート（中央値の基準値で最適化） */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("クイックソート（中央値ピボット最適化）完了後 nums1 = ${nums1.contentToString()}")

    /* クイックソート（再帰深度最適化） */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("クイックソート（再帰深度最適化）完了後 nums2 = ${nums2.contentToString()}")
}