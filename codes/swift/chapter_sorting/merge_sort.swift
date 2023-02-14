/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 合并左子数组和右子数组 */
// 左子数组区间 [left, mid]
// 右子数组区间 [mid + 1, right]
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 初始化辅助数组
    let tmp = Array(nums[left ..< (right + 1)])
    // 左子数组的起始索引和结束索引
    let leftStart = left - left
    let leftEnd = mid - left
    // 右子数组的起始索引和结束索引
    let rightStart = mid + 1 - left
    let rightEnd = right - left
    // i, j 分别指向左子数组、右子数组的首元素
    var i = leftStart
    var j = rightStart
    // 通过覆盖原数组 nums 来合并左子数组和右子数组
    for k in left ... right {
        // 若“左子数组已全部合并完”，则选取右子数组元素，并且 j++
        if i > leftEnd {
            nums[k] = tmp[j]
            j += 1
        }
        // 否则，若“右子数组已全部合并完”或“左子数组元素 <= 右子数组元素”，则选取左子数组元素，并且 i++
        else if j > rightEnd || tmp[i] <= tmp[j] {
            nums[k] = tmp[i]
            i += 1
        }
        // 否则，若“左右子数组都未全部合并完”且“左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
        else {
            nums[k] = tmp[j]
            j += 1
        }
    }
}

/* 归并排序 */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 终止条件
    if left >= right { // 当子数组长度为 1 时终止递归
        return
    }
    // 划分阶段
    let mid = (left + right) / 2 // 计算中点
    mergeSort(nums: &nums, left: left, right: mid) // 递归左子数组
    mergeSort(nums: &nums, left: mid + 1, right: right) // 递归右子数组
    // 合并阶段
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Driver Code */
    static func main() {
        /* 归并排序 */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: 0, right: nums.count - 1)
        print("归并排序完成后 nums = \(nums)")
    }
}
