/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* 편집 거리: 완전 탐색 */
    int EditDistanceDFS(string s, string t, int i, int j) {
        // s와 t가 모두 비어 있으면 0을 반환한다
        if (i == 0 && j == 0)
            return 0;
        // s가 비어 있으면 t의 길이를 반환한다
        if (i == 0)
            return j;
        // t가 비어 있으면 s의 길이를 반환한다
        if (j == 0)
            return i;
        // 두 문자가 같으면 두 문자를 바로 건너뛴다
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // 최소 편집 횟수를 반환한다
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* 편집 거리: 메모이제이션을 이용한 탐색 */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // s와 t가 모두 비어 있으면 0을 반환한다
        if (i == 0 && j == 0)
            return 0;
        // s가 비어 있으면 t의 길이를 반환한다
        if (i == 0)
            return j;
        // t가 비어 있으면 s의 길이를 반환한다
        if (j == 0)
            return i;
        // 기록이 이미 있으면 해당 값을 바로 반환한다
        if (mem[i][j] != -1)
            return mem[i][j];
        // 두 문자가 같으면 두 문자를 바로 건너뛴다
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 최소 편집 횟수를 기록하고 반환한다
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 편집 거리: 동적 계획법 */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 상태 전이: 첫 번째 행
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i <= n; i++) {
            // 상태 전이: 첫 번째 열
            int leftup = dp[0]; // dp[i-1, j-1]을 임시로 저장한다
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // 완전 탐색
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");

        // 메모이제이션을 이용한 탐색
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");

        // 동적 계획법
        res = EditDistanceDP(s, t);
        Console.WriteLine("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");

        // 공간을 최적화한 동적 계획법
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");
    }
}
