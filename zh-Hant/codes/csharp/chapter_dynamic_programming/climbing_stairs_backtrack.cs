/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* 回溯 */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // 當爬到第 n 階時，方案數量加 1
        if (state == n)
            res[0]++;
        // 走訪所有選擇
        foreach (int choice in choices) {
            // 剪枝：不允許越過第 n 階
            if (state + choice > n)
                continue;
            // 嘗試：做出選擇，更新狀態
            Backtrack(choices, state + choice, n, res);
            // 回退
        }
    }

    /* 爬樓梯：回溯 */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 可選擇向上爬 1 階或 2 階
        int state = 0; // 從第 0 階開始爬
        List<int> res = [0]; // 使用 res[0] 記錄方案數量
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"爬 {n} 階樓梯共有 {res} 種方案");
    }
}
