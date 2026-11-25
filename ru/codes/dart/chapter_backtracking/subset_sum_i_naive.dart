/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // Если сумма подмножества равна target, сохраняем решение
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // Перебираем все варианты
  for (int i = 0; i < choices.length; i++) {
    // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
    if (total + choices[i] > target) {
      continue;
    }
    // Пробуем вариант и обновляем сумму элементов total
    state.add(choices[i]);
    // Переходим к следующему выбору
    backtrack(state, target, total + choices[i], choices, res);
    // Возврат: отменяем выбор и восстанавливаем прежнее состояние
    state.removeLast();
  }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // Состояние (подмножество)
  int total = 0; // Сумма элементов
  List<List<int>> res = []; // Список результатов (список подмножеств)
  backtrack(state, target, total, nums, res);
  return res;
}

/* Основная программа */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("Исходный массив nums = $nums, target = $target");
  print("Все подмножества с суммой $target: res = $res");
  print("Обратите внимание: результат этого метода содержит повторяющиеся множества");
}
