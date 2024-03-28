/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 堆積的長度為 n ，從節點 i 開始，從頂至底堆積化 */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // 判斷節點 i, l, r 中值最大的節點，記為 ma
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
        if ma == i {
            break
        }
        // 交換兩節點
        nums.swapAt(i, ma)
        // 迴圈向下堆積化
        i = ma
    }
}

/* 堆積排序 */
func heapSort(nums: inout [Int]) {
    // 建堆積操作：堆積化除葉節點以外的其他所有節點
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // 從堆積中提取最大元素，迴圈 n-1 輪
    for i in nums.indices.dropFirst().reversed() {
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        nums.swapAt(0, i)
        // 以根節點為起點，從頂至底進行堆積化
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("堆積排序完成後 nums = \(nums)")
    }
}
