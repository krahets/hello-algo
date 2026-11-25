/**
* File: climbing_stairs_dfs_mem.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs_mem {
    /* 메모이제이션 탐색 */
    int DFS(int i, int[] mem) {
        // 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
        if (i == 1 || i == 2)
            return i;
        // dp[i]의 기록이 있으면 바로 반환한다
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1, mem) + DFS(i - 2, mem);
        // dp[i] 기록
        mem[i] = count;
        return count;
    }

    /* 계단 오르기: 메모이제이션 탐색 */
    int ClimbingStairsDFSMem(int n) {
        // mem[i]에 i번째 계단까지 오르는 방법 수를 기록한다. -1은 기록이 없음을 뜻한다
        int[] mem = new int[n + 1];
        Array.Fill(mem, -1);
        return DFS(n, mem);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFSMem(n);
        Console.WriteLine($"계단 {n}개를 오르는 방법은 {res}가지");
    }
}
