/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* バックトラッキングアルゴリズム：n クイーン */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // すべての行が配置されたら、解を記録
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // すべての列を走査
        for (int col = 0; col < n; col++) {
            // セルに対応する主対角線と副対角線を計算
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪定：セルの列、主対角線、副対角線にクイーンを配置することを許可しない
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 試行：セルにクイーンを配置
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 次の行を配置
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：セルを空のスポットに復元
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* n クイーンを解く */
    public static List<List<List<String>>> nQueens(int n) {
        // n*n サイズのチェスボードを初期化、'Q' はクイーンを表し、'#' は空のスポットを表す
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // クイーンのある列を記録
        boolean[] diags1 = new boolean[2 * n - 1]; // クイーンのある主対角線を記録
        boolean[] diags2 = new boolean[2 * n - 1]; // クイーンのある副対角線を記録
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("チェスボードの次元を " + n + " として入力");
        System.out.println("クイーン配置解の総数 = " + res.size());
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}