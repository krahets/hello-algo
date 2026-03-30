/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Бэктрекинг */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
  if (state == n) {
    res[0]++;
  }
  // Перебор всех вариантов выбора
  for (int choice in choices) {
    // Отсечение: нельзя выходить за n-ю ступень
    if (state + choice > n) continue;
    // Попытка: сделать выбор и обновить состояние
    backtrack(choices, state + choice, n, res);
    // Откат
  }
}

/* Подъем по лестнице: бэктрекинг */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // Можно подняться на 1 или 2 ступени
  int state = 0; // Начать подъем с 0-й ступени
  List<int> res = [];
  res.add(0); // Использовать res[0] для хранения числа решений
  backtrack(choices, state, n, res);
  return res[0];
}

/* Driver Code */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("Количество способов подняться по лестнице из $n ступеней = $res");
}
