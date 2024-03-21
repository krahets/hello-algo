/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* 基於堆積查詢陣列中最大的 k 個元素 */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 初始化小頂堆積
        PriorityQueue<int, int> heap = new();
        // 將陣列的前 k 個元素入堆積
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // 從第 k+1 個元素開始，保持堆積的長度為 k
        for (int i = k; i < nums.Length; i++) {
            // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
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
