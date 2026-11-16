/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        // [region]{init_list}
        /* 初始化列表 */
        // 无初始值
        List<int> emptyNums = [];
        // 有初始值
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        // [endregion]{init_list}
        Console.WriteLine("列表 nums = " + string.Join(",", nums));
        Console.WriteLine("列表 emptyNums = " + string.Join(",", emptyNums));

        // [region]{access_element}
        /* 访问元素 */
        int num = nums[1]; // 访问索引 1 处的元素
        // [endregion]{access_element}
        Console.WriteLine("访问索引 1 处的元素，得到 num = " + num);

        // [region]{update_element}
        /* 更新元素 */
        nums[1] = 0; // 将索引 1 处的元素更新为 0
        // [endregion]{update_element}
        Console.WriteLine("将索引 1 处的元素更新为 0 ，得到 nums = " + string.Join(",", nums));

        // [region]{clear_list}
        /* 清空列表 */
        nums.Clear();
        // [endregion]{clear_list}
        Console.WriteLine("清空列表后 nums = " + string.Join(",", nums));

        // [region]{append_element}
        /* 在尾部添加元素 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        // [endregion]{append_element}
        Console.WriteLine("添加元素后 nums = " + string.Join(",", nums));

        // [region]{insert_element}
        /* 在中间插入元素 */
        nums.Insert(3, 6); // 在索引 3 处插入数字 6
        // [endregion]{insert_element}
        Console.WriteLine("在索引 3 处插入数字 6 ，得到 nums = " + string.Join(",", nums));

        // [region]{remove_element}
        /* 删除元素 */
        nums.RemoveAt(3); // 删除索引 3 处的元素
        // [endregion]{remove_element}
        Console.WriteLine("删除索引 3 处的元素，得到 nums = " + string.Join(",", nums));

        // [region]{iterate_list}
        /* 通过索引遍历列表 */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }

        /* 直接遍历列表元素 */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 拼接两个列表 */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1); // 将列表 nums1 拼接到 nums 之后
        // [endregion]{concat_list}
        Console.WriteLine("将列表 nums1 拼接到 nums 之后，得到 nums = " + string.Join(",", nums));

        // [region]{sort_list}
        /* 排序列表 */
        nums.Sort(); // 排序后，列表元素从小到大排列
        // [endregion]{sort_list}
        Console.WriteLine("排序列表后 nums = " + string.Join(",", nums));
    }
}
