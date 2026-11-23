/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* 편집 거리: 완전 탐색 */
    static int editDistanceDFS(String s, String t, int i, int j) {
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
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // 최소 편집 횟수를 반환한다
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* 편집 거리: 메모이제이션을 이용한 탐색 */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
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
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // 최소 편집 횟수를 기록하고 반환한다
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* 편집 거리: 동적 계획법 */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // 상태 전이: 첫 번째 행과 첫 번째 열
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // 상태 전이: 나머지 행과 열
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* 편집 거리: 공간을 최적화한 동적 계획법 */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
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
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // 두 문자가 같으면 두 문자를 바로 건너뛴다
                    dp[j] = leftup;
                } else {
                    // 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // 다음 반복의 dp[i-1, j-1]로 갱신한다
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // 완전 탐색
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");

        // 메모이제이션을 이용한 탐색
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");

        // 동적 계획법
        res = editDistanceDP(s, t);
        System.out.println("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");

        // 공간을 최적화한 동적 계획법
        res = editDistanceDPComp(s, t);
        System.out.println("변경: " + s + " → " + t + " 변경에 필요한 최소 편집 횟수: " + res + " 회");
    }
}
