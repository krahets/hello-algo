/**
* File: climbing_stairs_dfs.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* 搜尋 */
    int DFS(int i) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* 爬樓梯：搜尋 */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFS(n);
        Console.WriteLine($"爬 {n} 階樓梯共有 {res} 種方案");
    }
}
