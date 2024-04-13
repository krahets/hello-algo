/**
 * File: quick_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 元素交換 */
fun swap(nums: IntArray, i: Int, j: Int) {
    val temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

/* 哨兵劃分 */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // 以 nums[left] 為基準數
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // 從右向左找首個小於基準數的元素
        while (i < j && nums[i] <= nums[left])
            i++           // 從左向右找首個大於基準數的元素
        swap(nums, i, j)  // 交換這兩個元素
    }
    swap(nums, i, left)   // 將基準數交換至兩子陣列的分界線
    return i              // 返回基準數的索引
}

/* 快速排序 */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // 子陣列長度為 1 時終止遞迴
    if (left >= right) return
    // 哨兵劃分
    val pivot = partition(nums, left, right)
    // 遞迴左子陣列、右子陣列
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 選取三個候選元素的中位數 */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m 在 l 和 r 之間
    if ((l in m..r) || (l in r..m))
        return left // l 在 m 和 r 之間
    return right
}

/* 哨兵劃分（三數取中值） */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // 選取三個候選元素的中位數
    val med = medianThree(nums, left, (left + right) / 2, right)
    // 將中位數交換至陣列最左端
    swap(nums, left, med)
    // 以 nums[left] 為基準數
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // 從右向左找首個小於基準數的元素
        while (i < j && nums[i] <= nums[left])
            i++                      // 從左向右找首個大於基準數的元素
        swap(nums, i, j)             // 交換這兩個元素
    }
    swap(nums, i, left)              // 將基準數交換至兩子陣列的分界線
    return i                         // 返回基準數的索引
}

/* 快速排序 */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // 子陣列長度為 1 時終止遞迴
    if (left >= right) return
    // 哨兵劃分
    val pivot = partitionMedian(nums, left, right)
    // 遞迴左子陣列、右子陣列
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* 快速排序（尾遞迴最佳化） */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // 子陣列長度為 1 時終止
    var l = left
    var r = right
    while (l < r) {
        // 哨兵劃分操作
        val pivot = partition(nums, l, r)
        // 對兩個子陣列中較短的那個執行快速排序
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // 遞迴排序左子陣列
            l = pivot + 1 // 剩餘未排序區間為 [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // 遞迴排序右子陣列
            r = pivot - 1 // 剩餘未排序區間為 [left, pivot - 1]
        }
    }
}

/* Driver Code */
fun main() {
    /* 快速排序 */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("快速排序完成後 nums = ${nums.contentToString()}")

    /* 快速排序（中位基準數最佳化） */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("快速排序（中位基準數最佳化）完成後 nums1 = ${nums1.contentToString()}")

    /* 快速排序（尾遞迴最佳化） */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("快速排序（尾遞迴最佳化）完成後 nums2 = ${nums2.contentToString()}")
}