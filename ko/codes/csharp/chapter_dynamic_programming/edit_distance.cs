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
        // 두 문자가 같으면 둘 다 건너뛴다
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // 최소 편집 횟수 반환
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* 편집 거리: 메모이제이션 탐색 */
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
        // 기록이 있으면 바로 반환한다
        if (mem[i][j] != -1)
            return mem[i][j];
        // 두 문자가 같으면 둘 다 건너뛴다
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
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
        // 상태 전이: 첫 행과 첫 열
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
                    // 두 문자가 같으면 둘 다 건너뛴다
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* 편집 거리: 공간 최적화 동적 계획법 */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // 상태 전이: 첫 행
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // 상태 전이: 나머지 행
        for (int i = 1; i <= n; i++) {
            // 상태 전이: 첫 열
            int leftup = dp[0]; // dp[i-1, j-1] 임시 저장
            dp[0] = i;
            // 상태 전이: 나머지 열
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // 두 문자가 같으면 둘 다 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복에서 쓸 dp[i-1, j-1] 값으로 갱신한다
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
        Console.WriteLine("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: " + res + " 회");

        // 메모이제이션 탐색
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: " + res + " 회");

        // 동적 계획법
        res = EditDistanceDP(s, t);
        Console.WriteLine("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: " + res + " 회");

        // 공간 최적화 동적 계획법
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: " + res + " 회");
    }
}
