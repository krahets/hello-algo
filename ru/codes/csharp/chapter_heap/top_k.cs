/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* Найти k наибольших элементов массива с помощью кучи */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Инициализация минимальной кучи
        PriorityQueue<int, int> heap = new();
        // Поместить первые k элементов массива в кучу
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // Начиная с элемента k+1, поддерживать длину кучи равной k
        for (int i = k; i < nums.Length; i++) {
            // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
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
        Console.WriteLine("Наибольшие " + k + " элементов =");
        PrintUtil.PrintHeap(res);
    }
}
