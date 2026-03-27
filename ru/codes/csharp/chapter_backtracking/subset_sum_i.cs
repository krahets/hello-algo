/**
* File: subset_sum_i.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i {
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (int i = start; i < choices.Length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.Add(choices[i]);
            // Перейти к следующему выбору
            Backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Решить задачу суммы подмножеств I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        Array.Sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumI(nums, target);
        Console.WriteLine("Входной массив nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Все подмножества с суммой " + target + ": res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
