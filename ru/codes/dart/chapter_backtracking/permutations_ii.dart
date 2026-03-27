/**
 * File: permutations_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Алгоритм бэктрекинга: все перестановки II */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // Когда длина состояния равна числу элементов, записать решение
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // Перебор всех вариантов выбора
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
    if (!selected[i] && !duplicated.contains(choice)) {
      // Попытка: сделать выбор и обновить состояние
      duplicated.add(choice); // Записать значения уже выбранных элементов
      selected[i] = true;
      state.add(choice);
      // Перейти к следующему выбору
      backtrack(state, choices, selected, res);
      // Откат: отменить выбор и восстановить предыдущее состояние
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* Все перестановки II */
List<List<int>> permutationsII(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 2];

  List<List<int>> res = permutationsII(nums);

  print("Входной массив nums = $nums");
  print("Все перестановки res = $res");
}
