/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с возвратом */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // На ступени n увеличить число способов на 1
  if (state == n) {
    res[0]++;
  }
  // Перебрать все варианты
  for (int choice in choices) {
    // Отсечь шаги за ступень n
    if (state + choice > n) continue;
    // Сделать выбор и обновить состояние
    backtrack(choices, state + choice, n, res);
    // Отменить выбор
  }
}

/* Подъём по лестнице: поиск с возвратом */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // Можно подняться на 1 или 2 ступени
  int state = 0; // Начать со ступени 0
  List<int> res = [];
  res.add(0); // Хранить число способов в res[0]
  backtrack(choices, state, n, res);
  return res[0];
}

/* Основная программа */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("Число способов подняться на лестницу из $n ступеней: $res.");
}
