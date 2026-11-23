/**
* File: climbing_stairs_backtrack.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_backtrack {
    /* 백트래킹 */
    void Backtrack(List<int> choices, int state, int n, List<int> res) {
        // n번째 계단에 도달하면 방법의 수에 1을 더한다
        if (state == n)
            res[0]++;
        // 모든 선택지를 순회한다
        foreach (int choice in choices) {
            // 가지치기: n번째 계단을 넘어갈 수 없다
            if (state + choice > n)
                continue;
            // 시도: 선택하고 상태를 갱신한다
            Backtrack(choices, state + choice, n, res);
            // 되돌리기
        }
    }

    /* 계단 오르기: 백트래킹 */
    int ClimbingStairsBacktrack(int n) {
        List<int> choices = [1, 2]; // 한 계단 또는 두 계단 오르기를 선택할 수 있다
        int state = 0; // 0번째 계단에서 오르기 시작한다
        List<int> res = [0]; // res[0]에 방법의 수를 기록한다
        Backtrack(choices, state, n, res);
        return res[0];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsBacktrack(n);
        Console.WriteLine($"{n}개의 계단을 오르는 방법은 총 {res}가지이다");
    }
}
