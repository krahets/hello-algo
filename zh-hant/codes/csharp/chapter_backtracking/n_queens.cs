/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* 回溯演算法：n 皇后 */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
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
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    List<List<List<string>>> NQueens(int n) {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // 記錄各欄是否已有皇后
        bool[] diags1 = new bool[2 * n - 1]; // 記錄各主對角線上是否已有皇后
        bool[] diags2 = new bool[2 * n - 1]; // 記錄各副對角線上是否已有皇后
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("輸入棋盤的邊長為 " + n);
        Console.WriteLine("皇后擺法共有 " + res.Count + " 種");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
