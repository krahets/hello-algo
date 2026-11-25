/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* 백트래킹 */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // n번째 계단에 도달하면 방법 수를 1 늘린다
        if (state == n)
            res[0]++;
        // 모든 선택지 순회
        foreach (int choice in choices) {
            // 가지치기: n번째 계단을 넘지 않는다
            if (state + choice > n)
                continue;
            // 시도: 선택한 뒤 상태를 갱신한다
            Backtrack(choices, state + choice, n, res);
            // 선택 취소
        }
    }

    /* 계단 오르기: 백트래킹 */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 한 번에 한 계단 또는 두 계단을 오른다
        int state = 0; // 0번째 계단에서 출발한다
        List<int> res = [0]; // res[0]에 방법 수를 기록한다
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"계단 {n}개를 오르는 방법은 {res}가지");
    }
}
