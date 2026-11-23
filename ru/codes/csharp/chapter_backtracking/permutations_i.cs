/**
 * File: permutations_i.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_i {
    /* Алгоритм бэктрекинга: все перестановки I */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
                selected[i] = true;
                state.Add(choice);
                // Перейти к следующему выбору
                Backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Все перестановки I */
    List<List<int>> PermutationsI(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 3];

        List<List<int>> res = PermutationsI(nums);

        Console.WriteLine("Входной массив nums = " + string.Join(", ", nums));
        Console.WriteLine("Все перестановки res = ");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
