/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* Using heap to find the largest k elements in an array */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // Initialize min-heap
        PriorityQueue<int, int> heap = new();
        // Enter the first k elements of the array into the heap
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // From the k+1th element, keep the heap length as k
        for (int i = k; i < nums.Length; i++) {
            // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
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
