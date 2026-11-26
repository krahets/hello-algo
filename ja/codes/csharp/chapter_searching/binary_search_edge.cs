/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* 最も左にある target の二分探索 */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // target の挿入位置を探すことと同じ
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // target が見つからなかったので -1 を返す
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // target が見つかったのでインデックス i を返す
        return i;
    }

    /* 最も右にある target の二分探索 */
    int BinarySearchRightEdge(int[] nums, int target) {
        // 最も左にある target + 1 の探索に置き換える
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j は最も右の target を、i は target より大きい最初の要素を指す
        int j = i - 1;
        // target が見つからなかったので -1 を返す
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // target が見つかったのでインデックス j を返す
        return j;
    }

    [Test]
    public void Test() {
        // 重複する要素がある配列
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n配列 nums = " + nums.PrintList());

        // 左端と右端の二分探索
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("最も左にある " + target + " のインデックスは " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("最も右にある " + target + " のインデックスは " + index);
        }
    }
}
