/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* 回溯 */
    public void backtrack(List<int> choices, int state, int n, List<int> res) {
        // 当爬到第 n 阶时，方案数量加 1
        if (state == n)
            res[0]++;
        // 遍历所有选择
        foreach (int choice in choices) {
            // 剪枝：不允许越过第 n 阶
            if (state + choice > n)
                break;
            // 尝试：做出选择，更新状态
            backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬楼梯：回溯 */
    public int climbingStairsBacktrack(int n) {
        List<int> choices = new List<int> { 1, 2 }; // 可选择向上爬 1 或 2 阶
        int state = 0; // 从第 0 阶开始爬
        List<int> res = new List<int> { 0 }; // 使用 res[0] 记录方案数量
        backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = climbingStairsBacktrack(n);
        Console.WriteLine($"爬 {n} 阶楼梯共有 {res} 种方案");
    }
}
