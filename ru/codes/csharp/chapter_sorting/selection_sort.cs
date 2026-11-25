/**
* File: selection_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class selection_sort {
    /* Сортировка выбором */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // Внешний цикл: неотсортированный участок [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Внутренний цикл: найти минимум неотсортированного участка
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Запомнить индекс минимума
            }
            // Поменять минимум местами с первым элементом неотсортированного участка
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        SelectionSort(nums);
        Console.WriteLine("После сортировки выбором nums = " + string.Join(" ", nums));
    }
}
