/**
 * File: insertion_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class insertion_sort {
    /* 挿入ソート */
    void InsertionSort(int[] nums) {
        // 外側のループ：整列済み区間は [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // 内側のループ：整列済み区間 [0, i-1] の正しい位置に base を挿入
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // nums[j] を 1 つ右に移動
                j--;
            }
            nums[j + 1] = bas;         // 正しい位置に base を代入
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        InsertionSort(nums);
        Console.WriteLine("挿入ソート後の nums = " + string.Join(",", nums));
    }
}
