/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* ヒープに基づいて配列中の最大の k 個の要素を探す */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 最小ヒープを初期化
        PriorityQueue<int, int> heap = new();
        // 配列の先頭 k 個の要素をヒープに追加
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // k+1 番目の要素から開始し、ヒープ長を k に保つ
        for (int i = k; i < nums.Length; i++) {
            // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
        Console.WriteLine("最大の " + k + " 個の要素は");
        PrintUtil.PrintHeap(res);
    }
}
