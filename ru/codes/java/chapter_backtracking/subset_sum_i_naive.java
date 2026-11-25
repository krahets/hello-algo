/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* Поиск с возвратом: сумма подмножества I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // Если сумма подмножества равна target, сохраняем решение
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.length; i++) {
            // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
            if (total + choices[i] > target) {
                continue;
            }
            // Пробуем вариант и обновляем сумму элементов total
            state.add(choices[i]);
            // Переходим к следующему выбору
            backtrack(state, target, total + choices[i], choices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Задача о сумме подмножества I (с повторяющимися подмножествами) */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        int total = 0; // Сумма подмножества
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("Исходный массив nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Все подмножества с суммой " + target + " образуют список res = " + res);
        System.out.println("Обратите внимание: результат этого метода содержит повторяющиеся множества");
    }
}
