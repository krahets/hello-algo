/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class bubble_sort {
    /* Сортировка пузырьком */
    void BubbleSort(int[] nums) {
        // Внешний цикл: неотсортированный участок [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }

    /* Сортировка пузырьком с флагом обмена*/
    void BubbleSortWithFlag(int[] nums) {
        // Внешний цикл: неотсортированный участок [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // Инициализировать флаг
            // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // Отметить, что произошёл обмен
                }
            }
            if (!flag) break;     // За этот проход обменов не было. Выйти из цикла
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        BubbleSort(nums);
        Console.WriteLine("После сортировки пузырьком  nums = " + string.Join(",", nums));

        int[] nums1 = [4, 1, 3, 1, 5, 2];
        BubbleSortWithFlag(nums1);
        Console.WriteLine("После сортировки пузырьком nums1 = " + string.Join(",", nums1));
    }
}
