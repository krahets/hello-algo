/**
 * File: bubble_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class bubble_sort {
    /* バブルソート */
    void BubbleSort(int[] nums) {
        // 外側のループ：未整列区間は [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }

    /* バブルソート（フラグによる最適化）*/
    void BubbleSortWithFlag(int[] nums) {
        // 外側のループ：未整列区間は [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // フラグを初期化
            // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // 交換があったことを記録
                }
            }
            if (!flag) break;     // この走査で交換がなければループを終了
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        BubbleSort(nums);
        Console.WriteLine("バブルソート後の  nums = " + string.Join(",", nums));

        int[] nums1 = [4, 1, 3, 1, 5, 2];
        BubbleSortWithFlag(nums1);
        Console.WriteLine("バブルソート後の nums1 = " + string.Join(",", nums1));
    }
}
