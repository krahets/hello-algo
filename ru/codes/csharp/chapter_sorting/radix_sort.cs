/**
 * File: radix_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class radix_sort {
    /* Получить k-ю цифру числа num, где exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
        return (num / exp) % 10;
    }

    /* Сортировка подсчётом по k-й цифре элементов nums */
    void CountingSortDigit(int[] nums, int exp) {
        // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
        int[] counter = new int[10];
        int n = nums.Length;
        // Подсчитать вхождения каждой цифры от 0 до 9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Получить k-ю цифру nums[i] и обозначить её d
            counter[d]++;                // Подсчитать вхождения цифры d
        }
        // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Пройти массив с конца и заполнить res по данным счётчиков
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Найти индекс j в массиве для цифры d
            res[j] = nums[i];       // Записать текущий элемент по индексу j
            counter[d]--;           // Уменьшить счётчик d на 1
        }
        // Скопировать результат в исходный массив nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Поразрядная сортировка */
    void RadixSort(int[] nums) {
        // Найти максимум массива, чтобы определить наибольшее число разрядов
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Перебирать разряды от младшего к старшему
        for (int exp = 1; exp <= m; exp *= 10) {
            // Отсортировать элементы подсчётом по k-й цифре
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // То есть exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }

    [Test]
    public void Test() {
        // Поразрядная сортировка
        int[] nums = [ 10546151, 35663510, 42865989, 34862445, 81883077,
            88906420, 72429244, 30524779, 82060337, 63832996 ];
        RadixSort(nums);
        Console.WriteLine("После поразрядной сортировки nums = " + string.Join(" ", nums));
    }
}
