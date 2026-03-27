/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Алгоритм бэктрекинга: сумма подмножества I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебрать все варианты выбора
        for (int i = 0; i < choices.Length; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить сумму элементов total
            state.Add(choices[i]);
            // Перейти к следующему варианту выбора
            Backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Решить задачу суммы подмножества I (включая повторяющиеся подмножества) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        int total = 0; // подмножествосумма
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("Входной массив nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Все подмножества res с суммой " + target + " = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("Обратите внимание: результат этого метода содержит повторяющиеся множества");
    }
}
