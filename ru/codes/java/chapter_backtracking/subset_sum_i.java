/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* Алгоритм бэктрекинга: сумма подмножеств I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        for (int i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
            // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Попытка: сделать выбор и обновить target и start
            state.add(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножеств I */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        Arrays.sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("Входной массив nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Все подмножества с суммой " + target + ": res = " + res);
    }
}
