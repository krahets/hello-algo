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
        // 當放置完所有行時，記錄解
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // 走訪所有列
        for (int col = 0; col < n; col++) {
            // 計算該格子對應的主對角線和次對角線
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放置在該格子
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：將該格子恢復為空位
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    List<List<List<string>>> NQueens(int n) {
        // 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // 記錄列是否有皇后
        bool[] diags1 = new bool[2 * n - 1]; // 記錄主對角線上是否有皇后
        bool[] diags2 = new bool[2 * n - 1]; // 記錄次對角線上是否有皇后
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("輸入棋盤長寬為 " + n);
        Console.WriteLine("皇后放置方案共有 " + res.Count + " 種");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
