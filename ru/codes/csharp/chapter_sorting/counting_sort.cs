/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    void CountingSortNaive(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    void CountingSort(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("После сортировки подсчетом (объекты не поддерживаются) nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("После сортировки подсчетом nums1 = " + string.Join(" ", nums));
    }
}
