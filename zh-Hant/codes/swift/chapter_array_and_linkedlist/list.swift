/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        /* 初始化列表 */
        var nums = [1, 3, 2, 5, 4]
        print("列表 nums = \(nums)")

        /* 访问元素 */
        let num = nums[1]
        print("访问索引 1 处的元素，得到 num = \(num)")

        /* 更新元素 */
        nums[1] = 0
        print("将索引 1 处的元素更新为 0 ，得到 nums = \(nums)")

        /* 清空列表 */
        nums.removeAll()
        print("清空列表后 nums = \(nums)")

        /* 在尾部添加元素 */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("添加元素后 nums = \(nums)")

        /* 在中间插入元素 */
        nums.insert(6, at: 3)
        print("在索引 3 处插入数字 6 ，得到 nums = \(nums)")

        /* 删除元素 */
        nums.remove(at: 3)
        print("删除索引 3 处的元素，得到 nums = \(nums)")

        /* 通过索引遍历列表 */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* 直接遍历列表元素 */
        count = 0
        for x in nums {
            count += x
        }

        /* 拼接两个列表 */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("将列表 nums1 拼接到 nums 之后，得到 nums = \(nums)")

        /* 排序列表 */
        nums.sort()
        print("排序列表后 nums = \(nums)")
    }
}
