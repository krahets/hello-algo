/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* 回溯算法：子集和 I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // 子集和等于 target 时，记录解
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // 遍历所有选择
        for (int i = 0; i < choices.Length; i++) {
            // 剪枝：若子集和超过 target ，则跳过该选择
            if (total + choices[i] > target) {
                continue;
            }
            // 尝试：做出选择，更新元素和 total
            state.Add(choices[i]);
            // 进行下一轮选择
            Backtrack(state, target, total + choices[i], choices, res);
            // 回退：撤销选择，恢复到之前的状态
            state.RemoveAt(state.Count - 1);
        }
    }

    /* 求解子集和 I（包含重复子集） */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // 状态（子集）
        int total = 0; // 子集和
        List<List<int>> res = []; // 结果列表（子集列表）
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("输入数组 nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("所有和等于 " + target + " 的子集 res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("请注意，该方法输出的结果包含重复集合");
    }
}
