/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* Сортировка подсчётом */
    // Простая реализация, непригодная для сортировки объектов
    void CountingSortNaive(int[] nums) {
        // 1. Найти максимальный элемент m в массиве
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Подсчитать число вхождений каждого значения
        // counter[num] — число вхождений num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Пройти по counter и записать элементы в исходный массив nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Сортировка подсчётом */
    // Полная реализация: устойчивая сортировка с поддержкой объектов
    void CountingSort(int[] nums) {
        // 1. Найти максимальный элемент m в массиве
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Подсчитать число вхождений каждого значения
        // counter[num] — число вхождений num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
        // То есть counter[num]-1 — индекс последнего вхождения num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
        // Создать массив res для результата
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
        }
        // Скопировать результат из res в исходный массив nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("После сортировки подсчётом (без поддержки объектов) nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("После сортировки подсчётом nums1 = " + string.Join(" ", nums));
    }
}
