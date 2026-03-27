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
  // Перебрать все варианты выбора
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Отсечение: не допускается повторный выбор элемента и не допускается повторный выбор равных элементов
    if (!selected[i] && !duplicated.contains(choice)) {
      // Попытка: сделать выбор и обновить состояние
      duplicated.add(choice); // Записатьвыбранныеэлементзначение
      selected[i] = true;
      state.add(choice);
      // Перейти к следующему варианту выбора
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
