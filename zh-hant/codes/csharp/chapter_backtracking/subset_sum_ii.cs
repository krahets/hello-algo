/**
* File: subset_sum_ii.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* 回溯演算法：子集和 II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // 子集總和達到目標時，記錄此解
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // 逐一檢查所有選項
        // 剪枝二：從 start 開始走訪，避免產生重複子集
        // 剪枝三：從 start 開始走訪，避免重複選取同一個元素
        for (int i = start; i < choices.Length; i++) {
            // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
            // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
            if (target - choices[i] < 0) {
                break;
            }
            // 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // 嘗試：做出選擇，更新 target 和 start
            state.Add(choices[i]);
            // 進入下一輪選擇
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // 回溯：撤銷選擇，還原先前的狀態
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // 狀態（子集）
        Array.Sort(nums); // 將 nums 排序
        int start = 0; // 走訪的起點
        List<List<int>> res = []; // 結果串列（子集串列）
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("輸入陣列 nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("所有總和等於 " + target + " 的子集 res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
