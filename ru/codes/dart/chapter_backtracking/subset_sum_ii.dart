/**
 * File: subset_sum_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств II */
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
  // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
  for (int i = start; i < choices.length; i++) {
    // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
    // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
    if (target - choices[i] < 0) {
      break;
    }
    // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
    if (i > start && choices[i] == choices[i - 1]) {
      continue;
    }
    // Попытка: сделать выбор и обновить target и start
    state.add(choices[i]);
    // Перейти к следующему выбору
    backtrack(state, target - choices[i], choices, i + 1, res);
    // Откат: отменить выбор и восстановить предыдущее состояние
    state.removeLast();
  }
}

/* Решить задачу суммы подмножеств II */
List<List<int>> subsetSumII(List<int> nums, int target) {
  List<int> state = []; // Состояние (подмножество)
  nums.sort(); // Отсортировать nums
  int start = 0; // Стартовая вершина обхода
  List<List<int>> res = []; // Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [4, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumII(nums, target);

  print("Входной массив nums = $nums, target = $target");
  print("Все подмножества с суммой $target: res = $res");
}
