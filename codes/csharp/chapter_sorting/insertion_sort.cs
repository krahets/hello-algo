/**
 * File: insertion_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using NUnit.Framework;

namespace hello_algo.chapter_sorting
{
    public class insertion_sort
    {
        /* 插入排序 */
        static void insertionSort(int[] nums)
        {
            // 外循环：base = nums[1], nums[2], ..., nums[n-1]
            for (int i = 1; i < nums.Length; i++)
            {
                int bas = nums[i], j = i - 1;
                // 内循环：将 base 插入到左边的正确位置
                while (j >= 0 && nums[j] > bas)
                {
                    nums[j + 1] = nums[j]; // 1. 将 nums[j] 向右移动一位
                    j--;
                }
                nums[j + 1] = bas;         // 2. 将 base 赋值到正确位置
            }
        }

        [Test]
        public void Test()
        {
            int[] nums = { 4, 1, 3, 1, 5, 2 };
            insertionSort(nums);
            Console.WriteLine("插入排序完成后 nums = " + string.Join(",", nums));
        }
    }
}
