/**
* File: heap_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class heap_sort {
    /* ヒープの長さは n。ノード i から下方向にヒープ化 */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i)
                break;
            // 2 つのノードを交換
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // ループで上から下へヒープ化
            i = ma;
        }
    }

    /* ヒープソート */
    void HeapSort(int[] nums) {
        // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // ヒープから最大要素を取り出し、n-1 回繰り返す
        for (int i = nums.Length - 1; i > 0; i--) {
            // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // 根ノードを起点に、上から下へヒープ化
            SiftDown(nums, i, 0);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        HeapSort(nums);
        Console.WriteLine("ヒープソート完了後 nums = " + string.Join(" ", nums));
    }
}
