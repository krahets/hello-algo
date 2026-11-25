/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* Найти k наибольших элементов массива с помощью кучи */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Инициализировать мин-кучу
        PriorityQueue<int, int> heap = new();
        // Добавить в кучу первые k элементов массива
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
        for (int i = k; i < nums.Length; i++) {
            // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
            if (nums[i] > heap.Peek()) {
                heap.Dequeue();
                heap.Enqueue(nums[i], nums[i]);
            }
        }
        return heap;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 7, 6, 3, 2];
        int k = 3;
        PriorityQueue<int, int> res = TopKHeap(nums, k);
        Console.WriteLine("При k = " + k + " наибольшие элементы:");
        PrintUtil.PrintHeap(res);
    }
}
