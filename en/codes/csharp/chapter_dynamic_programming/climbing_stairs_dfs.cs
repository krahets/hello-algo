/**
* File: climbing_stairs_dfs.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* Search */
    int DFS(int i) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* Climbing stairs: Search */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFS(n);
        Console.WriteLine($"Climbing {n} stairs has {res} solutions");
    }
}
