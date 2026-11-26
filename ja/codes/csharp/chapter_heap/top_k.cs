/**
* File: top_k.cs
* Created Time: 2023-06-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_heap;

public class top_k {
    /* ヒープを使って配列の上位 k 個の要素を求める */
    PriorityQueue<int, int> TopKHeap(int[] nums, int k) {
        // 最小ヒープを初期化する
        PriorityQueue<int, int> heap = new();
        // 配列の先頭 k 個の要素をヒープに入れる
        for (int i = 0; i < k; i++) {
            heap.Enqueue(nums[i], nums[i]);
        }
        // k+1 番目の要素からはヒープのサイズを k に保つ
        for (int i = k; i < nums.Length; i++) {
            // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
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
        Console.WriteLine("上位 " + k + " 個の要素：");
        PrintUtil.PrintHeap(res);
    }
}
