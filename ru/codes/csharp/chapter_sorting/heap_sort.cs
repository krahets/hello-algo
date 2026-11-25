/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* Размер кучи равен n. Выполнить просеивание вниз от узла i */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
            if (ma == i)
                break;
            // Поменять два узла местами
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // Продолжить просеивание вниз
            i = ma;
        }
    }

    /* Пирамидальная сортировка */
    void HeapSort(int[] nums) {
        // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // Извлечь максимум из кучи n-1 раз
        for (int i = nums.Length - 1; i > 0; i--) {
            // Обменять корень с крайним правым листом (первый элемент с последним)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // Выполнить просеивание вниз от корня
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("После пирамидальной сортировки nums = " + string.Join(" ", nums));
    }
}
