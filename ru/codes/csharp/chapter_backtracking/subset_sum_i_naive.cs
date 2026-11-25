/**
* File: subset_sum_i_naive.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i_naive {
    /* Поиск с возвратом: сумма подмножества I */
    void Backtrack(List<int> state, int target, int total, int[] choices, List<List<int>> res) {
        // Если сумма подмножества равна target, сохраняем решение
        if (total == target) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.Length; i++) {
            // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
            if (total + choices[i] > target) {
                continue;
            }
            // Пробуем вариант и обновляем сумму элементов total
            state.Add(choices[i]);
            // Переходим к следующему выбору
            Backtrack(state, target, total + choices[i], choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Задача о сумме подмножества I (с повторяющимися подмножествами) */
    List<List<int>> SubsetSumINaive(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        int total = 0; // Сумма подмножества
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, total, nums, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumINaive(nums, target);
        Console.WriteLine("Исходный массив nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Все подмножества с суммой " + target + " образуют список res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
        Console.WriteLine("Обратите внимание: результат этого метода содержит повторяющиеся множества");
    }
}
