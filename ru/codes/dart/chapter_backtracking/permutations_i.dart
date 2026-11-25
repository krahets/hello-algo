/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Поиск с возвратом: перестановки I */
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
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Отсечение: нельзя выбирать один элемент дважды
    if (!selected[i]) {
      // Пробуем вариант и обновляем состояние
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

/* Перестановки I */
List<List<int>> permutationsI(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Основная программа */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("Исходный массив nums = $nums");
  print("Все перестановки res = $res");
}
