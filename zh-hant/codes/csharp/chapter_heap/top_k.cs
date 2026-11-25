/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* 以堆積找出陣列中最大的 k 個元素 */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 初始化最小堆積
        PriorityQueue<int, int> heap = new();
        // 將陣列的前 k 個元素加入堆積
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // 從第 k+1 個元素開始，讓堆積大小維持在 k
        for (int i = k; i < nums.Length; i++) {
            // 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
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
        Console.WriteLine("最大的 " + k + " 個元素為");
        PrintUtil.PrintHeap(res);
    }
}
