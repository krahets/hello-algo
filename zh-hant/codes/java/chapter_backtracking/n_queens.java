/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* 回溯演算法：n 皇后 */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // 逐一檢查各欄
        for (int col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    public static List<List<List<String>>> nQueens(int n) {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // 記錄各欄是否已有皇后
        boolean[] diags1 = new boolean[2 * n - 1]; // 記錄各主對角線上是否已有皇后
        boolean[] diags2 = new boolean[2 * n - 1]; // 記錄各副對角線上是否已有皇后
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("輸入棋盤的邊長為 " + n);
        System.out.println("皇后擺法共有 " + res.size() + " 種");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
