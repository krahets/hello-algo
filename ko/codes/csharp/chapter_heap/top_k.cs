/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 최소 힙 초기화
        PriorityQueue<int, int> heap = new();
        // 배열의 처음 k개 원소를 힙에 삽입
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // k+1번째 원소부터 힙의 크기를 k로 유지
        for (int i = k; i < nums.Length; i++) {
            // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
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
        Console.WriteLine("가장 큰 원소 " + k + " 개:");
        PrintUtil.PrintHeap(res);
    }
}
