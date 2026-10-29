/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* バックトラッキング：n クイーン */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // すべての行への配置が終わったら、解を記録する
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // すべての列を走査する
        for (int col = 0; col < n; col++) {
            // このマスに対応する主対角線と副対角線を求める
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 試行：このマスにクイーンを配置する
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 次の行に配置する
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 復元：このマスを空きマスに戻す
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* n クイーン問題を解く */
    public static List<List<List<String>>> nQueens(int n) {
        // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // 列にクイーンがあるかどうかを記録する
        boolean[] diags1 = new boolean[2 * n - 1]; // 主対角線にクイーンがあるかどうかを記録する
        boolean[] diags2 = new boolean[2 * n - 1]; // 副対角線にクイーンがあるかどうかを記録する
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("入力した盤面の縦横の長さは " + n);
        System.out.println("クイーンの配置方法は全部で " + res.size() + " 通り");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
