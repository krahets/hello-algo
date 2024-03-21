/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* 記憶化搜尋 */
    int DFS(int i, int[] mem) {
        // 已知 dp[1] 和 dp[2] ，返回之
        if (i == 1 || i == 2)
            return i;
        // 若存在記錄 dp[i] ，則直接返回之
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // 記錄 dp[i]
        mem[i] = count;
        return count;
    }

    /* 爬樓梯：記憶化搜尋 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"爬 {n} 階樓梯共有 {res} 種方案");
    }
}
