/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз */
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
            // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if (ma == i)
                break;
            // Поменять местами два узла
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // Циклически выполнять просеивание вниз
            i = ma;
        }
    }

    /* Сортировка кучей */
    void HeapSort(int[] nums) {
        // Построение кучи: выполнить просеивание для всех узлов, кроме листьев
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // Извлекать максимальный элемент из кучи в течение n-1 итераций
        for (int i = nums.Length - 1; i > 0; i--) {
            // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // Начиная с корневого узла, выполнить просеивание сверху вниз
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("После сортировки кучей nums =" + string.Join(" ", nums));
    }
}
