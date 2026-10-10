/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* バックトラッキング：N クイーン */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // すべての行への配置が完了したら、解を記録する
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // すべての列を走査
        for (int col = 0; col < n; col++) {
            // このマスに対応する主対角線と副対角線を計算
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 試行：そのマスにクイーンを置く
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 次の行に配置する
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 戻す：そのマスを空きマスに戻す
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* N クイーンを解く */
    List<List<List<string>>> NQueens(int n) {
        // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // 列にクイーンがあるか記録
        bool[] diags1 = new bool[2 * n - 1]; // 主対角線にクイーンがあるかを記録
        bool[] diags2 = new bool[2 * n - 1]; // 副対角線にクイーンがあるかを記録
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("盤面の縦横サイズの入力値は " + n);
        Console.WriteLine("クイーンの配置パターンは全部で " + res.Count + " 通り");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
