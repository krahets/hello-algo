/**
 * File: radix_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class radix_sort {
    /* Получить k-й разряд элемента num, где exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
        return (num / exp) % 10;
    }

    /* Подсчетная сортировка (сортировка по k-му разряду nums) */
    void CountingSortDigit(int[] nums, int exp) {
        // Диапазон десятичного разряда равен 0~9, поэтому нужен массив корзин длины 10
        int[] counter = new int[10];
        int n = nums.Length;
        // Подсчитать количество появлений каждой цифры от 0 до 9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Получить k-й разряд nums[i] и обозначить его как d
            counter[d]++;                // Подсчитать количество появлений цифры d
        }
        // Вычислить префиксную сумму и преобразовать число появлений в индексы массива
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Обойти в обратном порядке и, согласно статистике по корзинам, заполнить элементы в res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Получить индекс j цифры d в массиве
            res[j] = nums[i];       // Записать текущий элемент в индекс j
            counter[d]--;           // Уменьшить количество d на 1
        }
        // Перезаписать исходный массив nums результатом
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Поразрядная сортировка */
    void RadixSort(int[] nums) {
        // Получить максимальный элемент массива, чтобы определить наибольшее число разрядов
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Перебирать от младшего разряда к старшему
        for (int exp = 1; exp <= m; exp *= 10) {
            // Выполнить подсчетную сортировку по k-му разряду элементов массива
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // то есть exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }

    [Test]
    public void Test() {
        // Поразрядная сортировка
        int[] nums = [ 10546151, 35663510, 42865989, 34862445, 81883077,
            88906420, 72429244, 30524779, 82060337, 63832996 ];
        RadixSort(nums);
        Console.WriteLine("После поразрядной сортировки nums =" + string.Join(" ", nums));
    }
}
