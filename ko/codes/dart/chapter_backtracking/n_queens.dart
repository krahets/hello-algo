/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 백트래킹 알고리즘: n-퀸 */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // 모든 행에 배치했으면 해를 기록한다
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
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
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // 다음 행에 배치한다
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // 되돌리기: 해당 칸을 빈칸으로 되돌린다
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* n-퀸 문제 풀기 */
List<List<List<String>>> nQueens(int n) {
  // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // 열에 퀸이 있는지 기록한다
  List<bool> diags1 = List.filled(2 * n - 1, false); // 주대각선에 퀸이 있는지 기록한다
  List<bool> diags2 = List.filled(2 * n - 1, false); // 부대각선에 퀸이 있는지 기록한다
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* 실행 코드 */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("입력 체스판의 가로와 세로 길이 = $n");
  print("퀸을 배치하는 방법은 총 ${res.length}가지이다");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
