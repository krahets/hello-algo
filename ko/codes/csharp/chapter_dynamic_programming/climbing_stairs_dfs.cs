/**
* File: climbing_stairs_dfs.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dfs {
    /* 탐색 */
    int DFS(int i) {
        // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = DFS(i - 1) + DFS(i - 2);
        return count;
    }

    /* 계단 오르기: 탐색 */
    int ClimbingStairsDFS(int n) {
        return DFS(n);
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsDFS(n);
        Console.WriteLine($"{n}개의 계단을 오르는 방법은 총 {res}가지이다");
    }
}
