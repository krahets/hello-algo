/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* Driver Code */
    static func main() {
        // [region]{init_list}
        /* 初始化列表 */
        // 无初始值
        let emptyNums: [Int] = []
        // 有初始值
        var nums = [1, 3, 2, 5, 4]
        // [endregion]{init_list}
        print("列表 nums = \(nums)")
        print("列表 emptyNums = \(emptyNums)")

        // [region]{access_element}
        /* 访问元素 */
        let num = nums[1] // 访问索引 1 处的元素
        // [endregion]{access_element}
        print("访问索引 1 处的元素，得到 num = \(num)")

        // [region]{update_element}
        /* 更新元素 */
        nums[1] = 0 // 将索引 1 处的元素更新为 0
        // [endregion]{update_element}
        print("将索引 1 处的元素更新为 0 ，得到 nums = \(nums)")

        // [region]{clear_list}
        /* 清空列表 */
        nums.removeAll()
        // [endregion]{clear_list}
        print("清空列表后 nums = \(nums)")

        // [region]{append_element}
        /* 在尾部添加元素 */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        // [endregion]{append_element}
        print("添加元素后 nums = \(nums)")

        // [region]{insert_element}
        /* 在中间插入元素 */
        nums.insert(6, at: 3) // 在索引 3 处插入数字 6
        // [endregion]{insert_element}
        print("在索引 3 处插入数字 6 ，得到 nums = \(nums)")

        // [region]{remove_element}
        /* 删除元素 */
        nums.remove(at: 3) // 删除索引 3 处的元素
        // [endregion]{remove_element}
        print("删除索引 3 处的元素，得到 nums = \(nums)")

        // [region]{iterate_list}
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
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 拼接两个列表 */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1) // 将列表 nums1 拼接到 nums 之后
        // [endregion]{concat_list}
        print("将列表 nums1 拼接到 nums 之后，得到 nums = \(nums)")

        // [region]{sort_list}
        /* 排序列表 */
        nums.sort() // 排序后，列表元素从小到大排列
        // [endregion]{sort_list}
        print("排序列表后 nums = \(nums)")
    }
}
