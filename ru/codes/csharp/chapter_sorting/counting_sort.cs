/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* Подсчетная сортировка */
    // Простая реализация, не может использоваться дляСортировкаобъект
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
        // 3. Обойти counter и записать элементы обратно в исходный массив nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Подсчетная сортировка */
    // Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
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
        // 3. Вычислить префиксные суммы counter, преобразовав «число появлений» в «конечный индекс»
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
            res[counter[num] - 1] = num; // Разместить num в соответствующем индексе
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums результатом из массива res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("Подсчетная сортировкапосле завершения nums1 =" + string.Join(" ", nums));
    }
}
