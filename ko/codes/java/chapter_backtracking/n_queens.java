/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* 백트래킹 알고리즘: n-퀸 */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // 모든 행에 배치했으면 해를 기록한다
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // 모든 열을 순회한다
        for (int col = 0; col < n; col++) {
            // 해당 칸이 속한 주대각선과 부대각선을 계산한다
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 시도: 해당 칸에 퀸을 놓는다
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 다음 행에 배치한다
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 되돌리기: 해당 칸을 빈칸으로 되돌린다
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* n-퀸 문제 풀기 */
    public static List<List<List<String>>> nQueens(int n) {
        // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // 열에 퀸이 있는지 기록한다
        boolean[] diags1 = new boolean[2 * n - 1]; // 주대각선에 퀸이 있는지 기록한다
        boolean[] diags2 = new boolean[2 * n - 1]; // 부대각선에 퀸이 있는지 기록한다
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("입력한 체스판의 가로와 세로 길이: " + n);
        System.out.println("퀸을 배치하는 방법은 총 " + res.size() + " 가지이다");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
