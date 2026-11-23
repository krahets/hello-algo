/**
 * File: insertion_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class insertion_sort {
    /* Сортировка вставками */
    void InsertionSort(int[] nums) {
        // Внешний цикл: отсортированный диапазон [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // Сдвинуть nums[j] на одну позицию вправо
                j--;
            }
            nums[j + 1] = bas;         // Поместить base в правильную позицию
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        InsertionSort(nums);
        Console.WriteLine("После сортировки вставками nums = " + string.Join(",", nums));
    }
}
