/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* 長さ n のヒープで、ノード i から下向きにヒープ化 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のものを ma とする
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // i の値が最大か、左右の子のインデックス l, r がともに範囲外なら、ヒープ化を終了
            if (ma == i)
                break;
            // 2 つのノードを交換
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }

    /* ヒープソート */
    void HeapSort(int[] nums) {
        // ヒープの構築：葉以外のすべてのノードをヒープ化
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // ヒープから最大要素を取り出す操作を n-1 回繰り返す
        for (int i = nums.Length - 1; i > 0; i--) {
            // 根と右端の葉を交換（先頭要素と末尾要素の交換）
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 根から下向きにヒープ化
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("ヒープソート後の nums = " + string.Join(" ", nums));
    }
}
