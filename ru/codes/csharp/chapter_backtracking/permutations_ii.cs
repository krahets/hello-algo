/**
 * File: permutations_ii.cs
 * Created Time: 2023-04-24
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class permutations_ii {
    /* Алгоритм бэктрекинга: все перестановки II */
    void Backtrack(List<int> state, int[] choices, bool[] selected, List<List<int>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.Count == choices.Length) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебрать все варианты выбора
        HashSet<int> duplicated = [];
        for (int i = 0; i < choices.Length; i++) {
            int choice = choices[i];
            // Отсечение: не допускается повторный выбор элемента и не допускается повторный выбор равных элементов
            if (!selected[i] && !duplicated.Contains(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.Add(choice); // Записатьвыбранныеэлементзначение
                selected[i] = true;
                state.Add(choice);
                // Перейти к следующему варианту выбора
                Backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.RemoveAt(state.Count - 1);
            }
        }
    }

    /* Все перестановки II */
    List<List<int>> PermutationsII(int[] nums) {
        List<List<int>> res = [];
        Backtrack([], nums, new bool[nums.Length], res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [1, 2, 2];

        List<List<int>> res = PermutationsII(nums);

        Console.WriteLine("Входмассив nums =" + string.Join(", ", nums));
        Console.WriteLine("Все перестановки res =");
        foreach (List<int> permutation in res) {
            PrintUtil.PrintList(permutation);
        }
    }
}
