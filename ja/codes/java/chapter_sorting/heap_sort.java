/**
 * File: heap_sort.java
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class heap_sort {
    /* ヒープの長さは n。ノード i から下方向にヒープ化 */
    public static void siftDown(int[] nums, int n, int i) {
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
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // ループで上から下へヒープ化
            i = ma;
        }
    }

    /* ヒープソート */
    public static void heapSort(int[] nums) {
        // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // ヒープから最大要素を取り出し、n-1 回繰り返す
        for (int i = nums.length - 1; i > 0; i--) {
            // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // 根ノードを起点に、上から下へヒープ化
            siftDown(nums, i, 0);
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        heapSort(nums);
        System.out.println("ヒープソート完了後の nums = " + Arrays.toString(nums));
    }
}
