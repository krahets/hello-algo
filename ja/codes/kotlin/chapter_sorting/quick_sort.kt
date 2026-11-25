/**
 * File: quick_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 要素を交換 */
fun swap(nums: IntArray, i: Int, j: Int) {
    val temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

/* 左右から走査して分割 */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // nums[left] をピボットとする
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // 右から左へ走査し、ピボットより小さい最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++           // 左から右へ走査し、ピボットより大きい最初の要素を探す
        swap(nums, i, j)  // この 2 要素を交換
    }
    swap(nums, i, left)   // ピボットを交換して左右の部分配列の境界に移す
    return i              // ピボットのインデックスを返す
}

/* クイックソート */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // 部分配列の長さが 1 になったら再帰を終了
    if (left >= right) return
    // 左右から走査して分割
    val pivot = partition(nums, left, right)
    // 左右の部分配列を再帰的に処理
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 3 つの候補の中央値を選ぶ */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m の値は l と r の値の間にある
    if ((l in m..r) || (l in r..m))
        return left // l の値は m と r の値の間にある
    return right
}

/* 左右から走査して分割（3 要素の中央値を使用） */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // 3 つの候補の中央値を選ぶ
    val med = medianThree(nums, left, (left + right) / 2, right)
    // 中央値の要素を配列の左端に移す
    swap(nums, left, med)
    // nums[left] をピボットとする
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // 右から左へ走査し、ピボットより小さい最初の要素を探す
        while (i < j && nums[i] <= nums[left])
            i++                      // 左から右へ走査し、ピボットより大きい最初の要素を探す
        swap(nums, i, j)             // この 2 要素を交換
    }
    swap(nums, i, left)              // ピボットを交換して左右の部分配列の境界に移す
    return i                         // ピボットのインデックスを返す
}

/* クイックソート */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // 部分配列の長さが 1 になったら再帰を終了
    if (left >= right) return
    // 左右から走査して分割
    val pivot = partitionMedian(nums, left, right)
    // 左右の部分配列を再帰的に処理
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* クイックソート（再帰の深さを最適化） */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // 部分配列の長さが 1 になったら終了
    var l = left
    var r = right
    while (l < r) {
        // 左右から走査して分割
        val pivot = partition(nums, l, r)
        // 短いほうの部分配列にクイックソートを適用
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // 左の部分配列を再帰的にソート
            l = pivot + 1 // 残りの未整列区間は [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // 右の部分配列を再帰的にソート
            r = pivot - 1 // 残りの未整列区間は [left, pivot - 1]
        }
    }
}

/* 実行例 */
fun main() {
    /* クイックソート */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("クイックソート後の nums = ${nums.contentToString()}")

    /* クイックソート（中央値をピボットに使用） */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("クイックソート（中央値をピボットに使用）後の nums1 = ${nums1.contentToString()}")

    /* クイックソート（再帰の深さを最適化） */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("クイックソート（再帰の深さを最適化）後の nums2 = ${nums2.contentToString()}")
}