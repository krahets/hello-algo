/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* メモ化探索 */
    int DFS(int i, int[] mem) {
        // dp[1] と dp[2] は既知なので返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録があれば、それをそのまま返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // dp[i] を記録する
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"{n} 段の階段を上る方法は全部で {res} 通り");
    }
}
