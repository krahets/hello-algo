/**
 * File: permutations_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с возвратом: перестановки II */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // Когда длина текущей перестановки равна числу элементов, сохраняем решение
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // Перебираем все варианты
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
    if (!selected[i] && !duplicated.contains(choice)) {
      // Пробуем вариант и обновляем состояние
      duplicated.add(choice); // Отмечаем уже выбранные значения
      selected[i] = true;
      state.add(choice);
      // Переходим к следующему выбору
      backtrack(state, choices, selected, res);
      // Возврат: отменяем выбор и восстанавливаем прежнее состояние
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* Перестановки II */
List<List<int>> permutationsII(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Основная программа */
void main() {
  List<int> nums = [1, 2, 2];

  List<List<int>> res = permutationsII(nums);

  print("Исходный массив nums = $nums");
  print("Все перестановки res = $res");
}
