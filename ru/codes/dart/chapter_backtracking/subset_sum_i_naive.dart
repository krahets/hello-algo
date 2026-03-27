/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // Если сумма подмножества равна target, записать решение
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // Перебор всех вариантов выбора
  for (int i = 0; i < choices.length; i++) {
    // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
    if (total + choices[i] > target) {
      continue;
    }
    // Попытка: сделать выбор и обновить элемент и total
    state.add(choices[i]);
    // Перейти к следующему выбору
    backtrack(state, target, total + choices[i], choices, res);
    // Откат: отменить выбор и восстановить предыдущее состояние
    state.removeLast();
  }
}

/* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // Состояние (подмножество)
  int total = 0; // Сумма элементов
  List<List<int>> res = []; // Список результатов (список подмножеств)
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("Входной массив nums = $nums, target = $target");
  print("Все подмножества с суммой $target: res = $res");
  print("Обратите внимание: результат этого метода содержит повторяющиеся множества");
}
