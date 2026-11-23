/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // Если сумма подмножества равна target, записать решение
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // Обойти все варианты выбора
  // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
  for (int i = start; i < choices.length; i++) {
    // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
    // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
    if (target - choices[i] < 0) {
      break;
    }
    // Попытка: сделать выбор и обновить target и start
    state.add(choices[i]);
    // Перейти к следующему выбору
    backtrack(state, target - choices[i], choices, i, res);
    // Откат: отменить выбор и восстановить предыдущее состояние
    state.removeLast();
  }
}

/* Решить задачу суммы подмножеств I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // Состояние (подмножество)
  nums.sort(); // Отсортировать nums
  int start = 0; // Стартовая вершина обхода
  List<List<int>> res = []; // Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Входной массив nums = $nums, target = $target");
  print("Все подмножества с суммой $target: res = $res");
}
