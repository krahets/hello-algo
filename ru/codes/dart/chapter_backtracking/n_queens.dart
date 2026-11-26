/**
 * File: n_queens.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с возвратом: задача о n ферзях */
void backtrack(
  int row,
  int n,
  List<List<String>> state,
  List<List<List<String>>> res,
  List<bool> cols,
  List<bool> diags1,
  List<bool> diags2,
) {
  // Когда ферзи расставлены во всех строках, сохраняем решение
  if (row == n) {
    List<List<String>> copyState = [];
    for (List<String> sRow in state) {
      copyState.add(List.from(sRow));
    }
    res.add(copyState);
    return;
  }
  // Перебираем все столбцы
  for (int col = 0; col < n; col++) {
    // Вычисляем индексы прямой и обратной диагоналей клетки
    int diag1 = row - col + n - 1;
    int diag2 = row + col;
    // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
    if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
      // Пробуем поставить ферзя на эту клетку
      state[row][col] = "Q";
      cols[col] = true;
      diags1[diag1] = true;
      diags2[diag2] = true;
      // Переходим к следующей строке
      backtrack(row + 1, n, state, res, cols, diags1, diags2);
      // Возврат: освобождаем клетку
      state[row][col] = "#";
      cols[col] = false;
      diags1[diag1] = false;
      diags2[diag2] = false;
    }
  }
}

/* Решение задачи о n ферзях */
List<List<List<String>>> nQueens(int n) {
  // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
  List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
  List<bool> cols = List.filled(n, false); // Отмечаем столбцы, занятые ферзями
  List<bool> diags1 = List.filled(2 * n - 1, false); // Отмечаем прямые диагонали, занятые ферзями
  List<bool> diags2 = List.filled(2 * n - 1, false); // Отмечаем обратные диагонали, занятые ферзями
  List<List<List<String>>> res = [];

  backtrack(0, n, state, res, cols, diags1, diags2);

  return res;
}

/* Основная программа */
void main() {
  int n = 4;
  List<List<List<String>>> res = nQueens(n);
  print("Длина стороны доски: $n");
  print("Число расстановок ферзей: ${res.length}.");
  for (List<List<String>> state in res) {
    print("--------------------");
    for (List<String> row in state) {
      print(row);
    }
  }
}
