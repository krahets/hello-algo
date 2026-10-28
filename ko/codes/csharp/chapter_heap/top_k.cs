/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 최소 힙 초기화
        PriorityQueue<int, int> heap = new();
        // 배열의 앞쪽 k개 원소를 힙에 삽입한다
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // k+1번째 원소부터 힙의 길이를 k로 유지한다
        for (int i = k; i < nums.Length; i++) {
            // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
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
        Console.WriteLine("가장 큰 " + k + " 개 원소:");
        PrintUtil.PrintHeap(res);
    }
}
