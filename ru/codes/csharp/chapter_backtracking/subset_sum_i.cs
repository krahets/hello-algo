/**
* File: subset_sum_i.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_i {
    /* Поиск с возвратом: сумма подмножества I */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Если сумма подмножества равна target, сохраняем решение
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебираем все варианты
        // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
        for (int i = start; i < choices.Length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
            // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Пробуем вариант и обновляем target и start
            state.Add(choices[i]);
            // Переходим к следующему выбору
            Backtrack(state, target - choices[i], choices, i, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Задача о сумме подмножества I */
    List<List<int>> SubsetSumI(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        Array.Sort(nums); // Сортируем nums
        int start = 0; // Начальная позиция перебора
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [3, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumI(nums, target);
        Console.WriteLine("Исходный массив nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Все подмножества с суммой " + target + " образуют список res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
