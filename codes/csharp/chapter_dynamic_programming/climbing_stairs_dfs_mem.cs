/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* 记忆化搜索 */
    int DFS(int i, int[] mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在记录 dp[i] ，则直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // 记录 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬楼梯：记忆化搜索 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"爬 {n} 阶楼梯共有 {res} 种方案");
    }
}
