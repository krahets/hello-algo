/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* 回溯演算法：全排列 II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 當狀態長度等於元素數量時，記錄解
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // 走訪所有選擇
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 剪枝：不允許重複選擇元素 且 不允許重複選擇相等元素
            if (!selected[i] && !duplicated.Contains(choice)) {
                // 嘗試：做出選擇，更新狀態
                duplicated.Add(choice); // 記錄選擇過的元素值
                selected[i] = true;
                state.Add(choice);
                // 進行下一輪選擇
                Backtrack(state, choices, selected, res);
                // 回退：撤銷選擇，恢復到之前的狀態
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* 全排列 II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 2];

        List<List<int>> res = PermutationsII(nums);

        Console.WriteLine("輸入陣列 nums = " + string.Join(", ", nums));
        Console.WriteLine("所有排列 res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
