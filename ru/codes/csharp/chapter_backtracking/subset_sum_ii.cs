/**
* File: subset_sum_ii.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choices.Length; i++) {
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
            state.Add(choices[i]);
            // Перейти к следующему выбору
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Решить задачу суммы подмножеств II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        Array.Sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("Входной массив nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Все подмножества с суммой " + target + ": res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
