/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножества I */
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
  // Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
  for (int i = start; i < choices.length; i++) {
    // Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
    // Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
    if (target - choices[i] < 0) {
      break;
    }
    // Попытка: сделать выбор и обновить target, start
    state.add(choices[i]);
    // Перейти к следующему варианту выбора
    backtrack(state, target - choices[i], choices, i, res);
    // Откат: отменить выбор и восстановить предыдущее состояние
    state.removeLast();
  }
}

/* Решить задачу суммы подмножества I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // Состояние (подмножество)
  nums.sort(); // Отсортировать nums
  int start = 0; // Обход начальной вершины
  List<List<int>> res = []; // Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Входмассив nums = $nums, target = $target");
  print("Все подмножества с суммой $target res = $res");
}
