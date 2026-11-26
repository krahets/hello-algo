/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 堆積的長度為 n，從節點 i 開始由上而下調整堆積 */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // 找出節點 i、l、r 中值最大的節點，記為 ma
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // 若節點 i 的值最大或索引 l、r 超出範圍，便無須繼續調整堆積，跳出迴圈
        if ma == i {
            break
        }
        // 交換兩個節點
        nums.swapAt(i, ma)
        // 以迴圈繼續向下調整堆積
        i = ma
    }
}

/* 堆積排序 */
func heapSort(nums: inout [Int]) {
    // 建立堆積：對所有非葉節點執行堆積調整
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // 從堆積中取出最大元素，重複 n-1 輪
    for i in nums.indices.dropFirst().reversed() {
        // 交換根節點與最右側的葉節點（即交換首尾元素）
        nums.swapAt(0, i)
        // 從根節點開始，由上而下調整堆積
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* 主程式 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("堆積排序完成後 nums = \(nums)")
    }
}
