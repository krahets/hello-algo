/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* 初始化串列 */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("串列 nums = " + string.Join(",", nums));

        // [region]{access_element}
        /* 訪問元素 */
        int num = nums[1]; // 訪問索引 1 處的元素
        // [endregion]{access_element}
        Console.WriteLine("訪問索引 1 處的元素，得到 num = " + num);

        // [region]{update_element}
        /* 更新元素 */
        nums[1] = 0; // 將索引 1 處的元素更新為 0
        // [endregion]{update_element}
        Console.WriteLine("將索引 1 處的元素更新為 0 ，得到 nums = " + string.Join(",", nums));

        // [region]{clear_list}
        /* 清空串列 */
        nums.Clear();
        // [endregion]{clear_list}
        Console.WriteLine("清空串列後 nums = " + string.Join(",", nums));

        // [region]{append_element}
        /* 在尾部新增元素 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        // [endregion]{append_element}
        Console.WriteLine("新增元素後 nums = " + string.Join(",", nums));

        // [region]{insert_element}
        /* 在中間插入元素 */
        nums.Insert(3, 6); // 在索引 3 處插入數字 6
        // [endregion]{insert_element}
        Console.WriteLine("在索引 3 處插入數字 6 ，得到 nums = " + string.Join(",", nums));

        // [region]{remove_element}
        /* 刪除元素 */
        nums.RemoveAt(3); // 刪除索引 3 處的元素
        // [endregion]{remove_element}
        Console.WriteLine("刪除索引 3 處的元素，得到 nums = " + string.Join(",", nums));

        // [region]{iterate_list}
        /* 透過索引走訪串列 */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }

        /* 直接走訪串列元素 */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 拼接兩個串列 */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1); // 將串列 nums1 拼接到 nums 之後
        // [endregion]{concat_list}
        Console.WriteLine("將串列 nums1 拼接到 nums 之後，得到 nums = " + string.Join(",", nums));

        // [region]{sort_list}
        /* 排序串列 */
        nums.Sort(); // 排序後，串列元素從小到大排列
        // [endregion]{sort_list}
        Console.WriteLine("排序串列後 nums = " + string.Join(",", nums));
    }
}
