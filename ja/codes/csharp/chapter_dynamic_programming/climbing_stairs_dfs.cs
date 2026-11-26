/**
* File: climbing_stairs_dfs.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* 探索 */
    int DFS(int i) {
        // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* 階段の登り方：探索 */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFS(n);
        Console.WriteLine($"全 {n} 段の階段の登り方は {res} 通り");
    }
}
