/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* 範例主程式 */
    static func main() {
        /* 初始化列表 */
        var nums = [1, 3, 2, 5, 4]
        print("列表 nums = \(nums)")

        /* 存取元素 */
        let num = nums[1]
        print("存取索引 1 處的元素，得到 num = \(num)")

        /* 更新元素 */
        nums[1] = 0
        print("將索引 1 處的元素更新為 0，得到 nums = \(nums)")

        /* 清空列表 */
        nums.removeAll()
        print("清空列表後，nums = \(nums)")

        /* 在尾端加入元素 */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("加入元素後，nums = \(nums)")

        /* 在中間插入元素 */
        nums.insert(6, at: 3)
        print("在索引 3 處插入數字 6，得到 nums = \(nums)")

        /* 刪除元素 */
        nums.remove(at: 3)
        print("刪除索引 3 處的元素，得到 nums = \(nums)")

        /* 依索引走訪列表 */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* 直接走訪列表中的元素 */
        count = 0
        for x in nums {
            count += x
        }

        /* 串接兩個列表 */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("將列表 nums1 接在 nums 之後，得到 nums = \(nums)")

        /* 排序列表 */
        nums.sort()
        print("列表排序後，nums = \(nums)")
    }
}
