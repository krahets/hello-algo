/**
 * File: heap_sort.java
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class heap_sort {
    /* ヒープの長さは n、ノード i から上から下へヒープ化開始 */
    public static void siftDown(int[] nums, int n, int i) {
        while (true) {
            // i, l, r の中で最大のノードを判定し、ma とする
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外の場合、さらなるヒープ化は不要、ブレーク
            if (ma == i)
                break;
            // 2つのノードを交換
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // 下向きにヒープ化をループ
            i = ma;
        }
    }

    /* ヒープソート */
    public static void heapSort(int[] nums) {
        // ヒープ構築操作: 葉ノード以外のすべてのノードをヒープ化
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // ヒープから最大要素を抽出し、n-1 回繰り返し
        for (int i = nums.length - 1; i > 0; i--) {
            // ルートノードと最も右の葉ノードを交換（最初の要素と最後の要素を交換）
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // ルートノードから上から下へヒープ化開始
            siftDown(nums, i, 0);
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        heapSort(nums);
        System.out.println("ヒープソート後、nums = " + Arrays.toString(nums));
    }
}