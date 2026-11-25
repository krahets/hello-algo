/**
* File: selection_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class selection_sort {
    /* 選択ソート */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // 外側のループ：未整列区間は [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内側のループ：未整列区間の最小要素を探す
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 最小要素のインデックスを記録
            }
            // その最小要素と未整列区間の先頭要素を交換
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        SelectionSort(nums);
        Console.WriteLine("選択ソート後の nums = " + string.Join(" ", nums));
    }
}
