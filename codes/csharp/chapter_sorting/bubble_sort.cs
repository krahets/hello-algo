/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using NUnit.Framework;

namespace hello_algo.chapter_sorting
{
    public class bubble_sort
    {
        /* 冒泡排序 */
        static void bubbleSort(int[] nums)
        {
            // 外循环：待排序元素数量为 n-1, n-2, ..., 1
            for (int i = nums.Length - 1; i > 0; i--)
            {
                // 内循环：冒泡操作
                for (int j = 0; j < i; j++)
                {
                    if (nums[j] > nums[j + 1])
                    {
                        // 交换 nums[j] 与 nums[j + 1]
                        int tmp = nums[j];
                        nums[j] = nums[j + 1];
                        nums[j + 1] = tmp;
                    }
                }
            }
        }

        /* 冒泡排序（标志优化）*/
        static void bubbleSortWithFlag(int[] nums)
        {
            // 外循环：待排序元素数量为 n-1, n-2, ..., 1
            for (int i = nums.Length - 1; i > 0; i--)
            {
                bool flag = false; // 初始化标志位
                // 内循环：冒泡操作
                for (int j = 0; j < i; j++)
                {
                    if (nums[j] > nums[j + 1])
                    {
                        // 交换 nums[j] 与 nums[j + 1]
                        int tmp = nums[j];
                        nums[j] = nums[j + 1];
                        nums[j + 1] = tmp;
                        flag = true;  // 记录交换元素
                    }
                }
                if (!flag) break;     // 此轮冒泡未交换任何元素，直接跳出
            }
        }

        [Test]
        public void Test()
        {
            int[] nums = { 4, 1, 3, 1, 5, 2 };
            bubbleSort(nums);
            Console.WriteLine("冒泡排序完成后  nums = " + string.Join(",",nums));

            int[] nums1 = { 4, 1, 3, 1, 5, 2 };
            bubbleSortWithFlag(nums1);
            Console.WriteLine("冒泡排序完成后 nums1 = " + string.Join(",", nums));
        }
    }
}
