/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Алгоритм бэктрекинга: n ферзей */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // Когда все строки заполнены, записать решение
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // Обойти все столбцы
  for (int col = 0; col < n; col++) {
    // Вычислить главную и побочную диагонали, соответствующие этой клетке
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Попытка: разместить ферзя в этой клетке
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Перейти к размещению следующей строки
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Откат: восстановить эту клетку в пустое состояние
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Решить задачу n ферзей */
List<List<List<String>>> nQueens(int n) {
  // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Записать, есть ли ферзь в столбце
  List<bool> diags1 = List.filled(2 * n - 1, false); // Записать, есть ли ферзь на главной диагонали
  List<bool> diags2 = List.filled(2 * n - 1, false); // Записать, есть ли ферзь на побочной диагонали
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Driver Code */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Входдоскаразмерравно $n");
  print("Количество схем размещения ферзей равно ${res.length} видов");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
