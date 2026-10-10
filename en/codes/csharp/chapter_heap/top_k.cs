/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* Find the largest k elements in array based on heap */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Python's heapq module implements min heap by default
        PriorityQueue<int, int> heap = new();
        // Enter the first k elements of array into heap
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // Starting from the (k+1)th element, maintain heap length as k
        for (int i = k; i < nums.Length; i++) {
            // If current element is greater than top element, top element exits heap, current element enters heap
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
        Console.WriteLine("The largest " + k + " elements are");
        PrintUtil.PrintHeap(res);
    }
}
