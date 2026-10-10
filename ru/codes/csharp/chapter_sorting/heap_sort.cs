/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* Длина кучи равна n; начиная с узла i, выполнить просеивание сверху вниз */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if (ma == i)
                break;
            // Поменять два узла местами
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // Циклическое просеивание вниз
            i = ma;
        }
    }

    /* Сортировка кучей */
    void HeapSort(int[] nums) {
        // Построение кучи: выполнить heapify для всех узлов, кроме листовых
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // Извлекать максимальный элемент из кучи в течение n-1 итераций
        for (int i = nums.Length - 1; i > 0; i--) {
            // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // Начиная с корневого узла, выполнить просеивание сверху вниз
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("После сортировки кучей nums = " + string.Join(" ", nums));
    }
}
