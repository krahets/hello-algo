/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* 初始化列表 */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("列表 nums = " + string.Join(",", nums));

        /* 存取元素 */
        int num = nums[1];
        Console.WriteLine("存取索引 1 處的元素，得到 num = " + num);

        /* 更新元素 */
        nums[1] = 0;
        Console.WriteLine("將索引 1 處的元素更新為 0，得到 nums = " + string.Join(",", nums));

        /* 清空列表 */
        nums.Clear();
        Console.WriteLine("清空列表後，nums = " + string.Join(",", nums));

        /* 在尾端加入元素 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("加入元素後，nums = " + string.Join(",", nums));

        /* 在中間插入元素 */
        nums.Insert(3, 6);
        Console.WriteLine("在索引 3 處插入數字 6，得到 nums = " + string.Join(",", nums));

        /* 刪除元素 */
        nums.RemoveAt(3);
        Console.WriteLine("刪除索引 3 處的元素，得到 nums = " + string.Join(",", nums));

        /* 依索引走訪列表 */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }
        /* 直接走訪列表中的元素 */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }

        /* 串接兩個列表 */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("將列表 nums1 接在 nums 之後，得到 nums = " + string.Join(",", nums));

        /* 排序列表 */
        nums.Sort(); // 排序後，列表元素由小到大排列
        Console.WriteLine("列表排序後，nums = " + string.Join(",", nums));
    }
}
