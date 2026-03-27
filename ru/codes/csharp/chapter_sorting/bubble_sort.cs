/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class bubble_sort {
    /* Пузырьковая сортировка */
    void BubbleSort(int[] nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }

    /* Пузырьковая сортировка (оптимизация флагом) */
    void BubbleSortWithFlag(int[] nums) {
        // Внешний цикл: неотсортированный диапазон [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // Инициализировать флаг
            // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // Записать обмен элементов
                }
            }
            if (!flag) break;     // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        BubbleSort(nums);
        Console.WriteLine("После пузырьковой сортировки nums = " + string.Join(",", nums));

        int[] nums1 = [4, 1, 3, 1, 5, 2];
        BubbleSortWithFlag(nums1);
        Console.WriteLine("После пузырьковой сортировки nums1 = " + string.Join(",", nums1));
    }
}
