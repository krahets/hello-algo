/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* Memoization search */
    int DFS(int i, int[] mem) {
        // Known dp[1] and dp[2], return them
        if (i == 1 || i == 2)
            return i;
        // If record dp[i] exists, return it directly
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // Record dp[i]
        mem[i] = count;
        return count;
    }

    /* Climbing stairs: Memoization search */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"Climbing {n} stairs has {res} solutions");
    }
}
