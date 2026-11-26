/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с возвратом: сумма подмножества I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // Если сумма подмножества равна target, сохраняем решение
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // Перебираем все варианты
  // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
  for (int i = start; i < choices.length; i++) {
    // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
    // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
    if (target - choices[i] < 0) {
      break;
    }
    // Пробуем вариант и обновляем target и start
    state.add(choices[i]);
    // Переходим к следующему выбору
    backtrack(state, target - choices[i], choices, i, res);
    // Возврат: отменяем выбор и восстанавливаем прежнее состояние
    state.removeLast();
  }
}

/* Задача о сумме подмножества I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // Состояние (подмножество)
  nums.sort(); // Сортируем nums
  int start = 0; // Начальная позиция перебора
  List<List<int>> res = []; // Список результатов (список подмножеств)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Основная программа */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Исходный массив nums = $nums, target = $target");
  print("Все подмножества с суммой $target: res = $res");
}
