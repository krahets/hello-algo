/**
 * File: permutations_i.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_i {
    /* Поиск с возвратом: перестановки I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
                selected[i] = true;
                state.Add(choice);
                // Переходим к следующему выбору
                Backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Перестановки I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 3];

        List<List<int>> res = PermutationsI(nums);

        Console.WriteLine("Исходный массив nums = " + string.Join(", ", nums));
        Console.WriteLine("Все перестановки res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
