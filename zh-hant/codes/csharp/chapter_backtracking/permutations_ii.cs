/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* 回溯演算法：全排列 II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 當狀態長度等於元素個數時，記錄此解
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // 逐一檢查所有選項
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 剪枝：不可重複選取同一個元素，同一層也不可重複選取相同的值
            if (!selected[i] && !duplicated.Contains(choice)) {
                // 嘗試：做出選擇並更新狀態
                duplicated.Add(choice); // 記錄已選過的元素值
                selected[i] = true;
                state.Add(choice);
                // 進入下一輪選擇
                Backtrack(state, choices, selected, res);
                // 回溯：撤銷選擇，還原先前的狀態
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
