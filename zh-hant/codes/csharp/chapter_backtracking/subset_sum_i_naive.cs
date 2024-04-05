/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* 回溯演算法：子集和 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 子集和等於 target 時，記錄解
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // 走訪所有選擇
        for (int i = 0; i < choices.Length; i++) {
            // 剪枝：若子集和超過 target ，則跳過該選擇
            if (total + choices[i] > target) {
                continue;
            }
            // 嘗試：做出選擇，更新元素和 total
            state.Add(choices[i]);
            // 進行下一輪選擇
            Backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤銷選擇，恢復到之前的狀態
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 I（包含重複子集） */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 狀態（子集）
        int total = 0; // 子集和
        List<List<int>> res = []; // 結果串列（子集串列）
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("輸入陣列 nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("所有和等於 " + target + " 的子集 res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("請注意，該方法輸出的結果包含重複集合");
    }
}
