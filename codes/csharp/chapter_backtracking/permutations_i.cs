/**
 * File: permutations_i.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

using hello_algo.utils;
using NUnit.Framework;

namespace hello_algo.chapter_backtracking; 

public class permutations_i {
    /* 回溯算法：全排列 I */
    public static void backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // 当状态长度等于元素数量时，记录解
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
            if (!selected[i]) {
                // 尝试
                selected[i] = true; // 做出选择
                state.Add(choice); // 更新状态
                backtrack(state, choices, selected, res);
                // 回退
                selected[i] = false; // 撤销选择
                state.RemoveAt(state.Count - 1); // 恢复到之前的状态
            }
        }
    }

    [Test]
    public void Test() {
        int[] nums = { 1, 2, 3 };

        // 回溯算法
        List<List<int>> res = new List<List<int>>();
        backtrack(new List<int>(), nums, new bool[nums.Length], res);

        Console.WriteLine("输入数组 nums = " + string.Join(", ", nums));
        Console.WriteLine("所有排列 res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
