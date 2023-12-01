// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* 随机访问元素 */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 在区间 [0, nums.Length) 中随机抽取一个数字
        int randomIndex = random.Next(nums.Length);
        // 获取并返回随机元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 扩展数组长度 */
    int[] Extend(int[] nums, int enlarge) {
        // 初始化一个扩展长度后的数组
        int[] res = new int[nums.Length + enlarge];
        // 将原数组中的所有元素复制到新数组
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 返回扩展后的新数组
        return res;
    }

    /* 在数组的索引 index 处插入元素 num */
    void Insert(int[] nums, int num, int index) {
        // 把索引 index 以及之后的所有元素向后移动一位
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 将 num 赋给 index 处的元素
        nums[index] = num;
    }

    /* 删除索引 index 处的元素 */
    void Remove(int[] nums, int index) {
        // 把索引 index 之后的所有元素向前移动一位
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 遍历数组 */
    void Traverse(int[] nums) {
        int count = 0;
        // 通过索引遍历数组
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 直接遍历数组元素
        foreach (int num in nums) {
            count += num;
        }
    }

    /* 在数组中查找指定元素 */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 辅助函数,数组转字符串 */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // 初始化数组
        int[] arr = new int[5];
        Console.WriteLine("数组 arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("数组 nums = " + ToString(nums));

        // 随机访问
        int randomNum = RandomAccess(nums);
        Console.WriteLine("在 nums 中获取随机元素 " + randomNum);

        // 长度扩展
        nums = Extend(nums, 3);
        Console.WriteLine("将数组长度扩展至 8 ，得到 nums = " + ToString(nums));

        // 插入元素
        Insert(nums, 6, 3);
        Console.WriteLine("在索引 3 处插入数字 6 ，得到 nums = " + ToString(nums));

        // 删除元素
        Remove(nums, 2);
        Console.WriteLine("删除索引 2 处的元素，得到 nums = " + ToString(nums));

        // 遍历数组
        Traverse(nums);

        // 查找元素 
        int index = Find(nums, 3);
        Console.WriteLine("在 nums 中查找元素 3 ，得到索引 = " + index);
    }
}
