/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* 백트래킹 알고리즘: n-퀸 */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // 모든 행에 배치했으면 해를 기록한다
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
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
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 다음 행에 배치한다
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 되돌리기: 해당 칸을 빈칸으로 되돌린다
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* n-퀸 문제 풀기 */
    List<List<List<string>>> NQueens(int n) {
        // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // 열에 퀸이 있는지 기록한다
        bool[] diags1 = new bool[2 * n - 1]; // 주대각선에 퀸이 있는지 기록한다
        bool[] diags2 = new bool[2 * n - 1]; // 부대각선에 퀸이 있는지 기록한다
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("입력한 체스판의 가로와 세로 길이: " + n);
        Console.WriteLine("퀸을 배치하는 방법은 총 " + res.Count + " 가지이다");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
