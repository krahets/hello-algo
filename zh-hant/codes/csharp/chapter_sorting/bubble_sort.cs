/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class bubble_sort {
    /* 氣泡排序 */
    void BubbleSort(int[] nums) {
        // 外層迴圈：尚未排序的區間為 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }

    /* 氣泡排序（以旗標最佳化）*/
    void BubbleSortWithFlag(int[] nums) {
        // 外層迴圈：尚未排序的區間為 [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // 初始化旗標
            // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // 交換 nums[j] 與 nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // 記錄本輪曾交換元素
                }
            }
            if (!flag) break;     // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        BubbleSort(nums);
        Console.WriteLine("氣泡排序完成後  nums = " + string.Join(",", nums));

        int[] nums1 = [4, 1, 3, 1, 5, 2];
        BubbleSortWithFlag(nums1);
        Console.WriteLine("氣泡排序完成後 nums1 = " + string.Join(",", nums1));
    }
}
