/**
* File: subset_sum_ii.cs
* Created Time: 2023-06-25
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_backtracking;

public class subset_sum_ii {
    /* Поиск с возвратом: сумма подмножества II */
    void Backtrack(List<int> state, int target, int[] choices, int start, List<List<int>> res) {
        // Если сумма подмножества равна target, сохраняем решение
        if (target == 0) {
            res.Add(new List<int>(state));
            return;
        }
        // Перебираем все варианты
        // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
        // Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
        for (int i = start; i < choices.Length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
            // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Пробуем вариант и обновляем target и start
            state.Add(choices[i]);
            // Переходим к следующему выбору
            Backtrack(state, target - choices[i], choices, i + 1, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            state.RemoveAt(state.Count - 1);
        }
    }

    /* Задача о сумме подмножества II */
    List<List<int>> SubsetSumII(int[] nums, int target) {
        List<int> state = []; // Состояние (подмножество)
        Array.Sort(nums); // Сортируем nums
        int start = 0; // Начальная позиция перебора
        List<List<int>> res = []; // Список результатов (список подмножеств)
        Backtrack(state, target, nums, start, res);
        return res;
    }

    [Test]
    public void Test() {
        int[] nums = [4, 4, 5];
        int target = 9;
        List<List<int>> res = SubsetSumII(nums, target);
        Console.WriteLine("Исходный массив nums = " + string.Join(", ", nums) + ", target = " + target);
        Console.WriteLine("Все подмножества с суммой " + target + " образуют список res = ");
        foreach (var subset in res) {
            PrintUtil.PrintList(subset);
        }
    }
}
