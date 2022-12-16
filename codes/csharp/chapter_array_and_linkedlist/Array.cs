// File: Array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist
{
    public class Array
    {
        /// <summary>
        /// 随机返回一个数组元素
        /// </summary>
        public static int RandomAccess(int[] nums)
        {
            Random random = new();
            int randomIndex = random.Next(nums.Length);
            int randomNum = nums[randomIndex];
            return randomNum;
        }

        /// <summary>
        /// 扩展数组长度
        /// </summary>
        public static int[] Extend(int[] nums, int enlarge)
        {
            // 初始化一个扩展长度后的数组
            int[] res = new int[nums.Length + enlarge];
            // 将原数组中的所有元素复制到新数组
            for (int i = 0; i < nums.Length; i++)
            {
                res[i] = nums[i];
            }
            // 返回扩展后的新数组
            return res;
        }

        /// <summary>
        /// 在数组的索引 index 处插入元素 num
        /// </summary>
        public static void Insert(int[] nums, int num, int index)
        {
            // 把索引 index 以及之后的所有元素向后移动一位
            for (int i = nums.Length - 1; i >= index; i--)
            {
                nums[i] = nums[i - 1];
            }
            // 将 num 赋给 index 处元素
            nums[index] = num;
        }

        /// <summary>
        /// 删除索引 index 处元素
        /// </summary>
        public static void Remove(int[] nums, int index)
        {
            // 把索引 index 之后的所有元素向前移动一位
            for (int i = index; i < nums.Length - 1; i++)
            {
                nums[i] = nums[i + 1];
            }
        }

        /// <summary>
        /// 遍历数组
        /// </summary>
        public static void Traverse(int[] nums)
        {
            int count = 0;
            // 通过索引遍历数组
            for (int i = 0; i < nums.Length; i++)
            {
                count++;
            }
            // 直接遍历数组
            foreach (int num in nums)
            {
                count++;
            }
        }

        /// <summary>
        /// 在数组中查找指定元素
        /// </summary>
        public static int Find(int[] nums, int target)
        {
            for (int i = 0; i < nums.Length; i++)
            {
                if (nums[i] == target)
                    return i;
            }
            return -1;
        }

        /// <summary>
        /// 辅助函数,数组转字符串
        /// </summary>
        public static string ToString(int[] nums)
        {
            return string.Join(",", nums);
        }
    }
}