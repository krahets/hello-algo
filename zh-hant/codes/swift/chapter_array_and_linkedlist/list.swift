/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* 初始化串列 */
        var nums = [1, 3, 2, 5, 4]
        print("串列 nums = \(nums)")

        /* 訪問元素 */
        let num = nums[1]
        print("訪問索引 1 處的元素，得到 num = \(num)")

        /* 更新元素 */
        nums[1] = 0
        print("將索引 1 處的元素更新為 0 ，得到 nums = \(nums)")

        /* 清空串列 */
        nums.removeAll()
        print("清空串列後 nums = \(nums)")

        /* 在尾部新增元素 */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("新增元素後 nums = \(nums)")

        /* 在中間插入元素 */
        nums.insert(6, at: 3)
        print("在索引 3 處插入數字 6 ，得到 nums = \(nums)")

        /* 刪除元素 */
        nums.remove(at: 3)
        print("刪除索引 3 處的元素，得到 nums = \(nums)")

        /* 透過索引走訪串列 */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* 直接走訪串列元素 */
        count = 0
        for x in nums {
            count += x
        }

        /* 拼接兩個串列 */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("將串列 nums1 拼接到 nums 之後，得到 nums = \(nums)")

        /* 排序串列 */
        nums.sort()
        print("排序串列後 nums = \(nums)")
    }
}
