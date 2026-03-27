/**
 * File: subset_sum_i_naive.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i_naive {
    /* Алгоритм бэктрекинга: сумма подмножества I */
    static void backtrack(List<Integer> state, int target, int total, int[] choices, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (total == target) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Перебрать все варианты выбора
        for (int i = 0; i < choices.length; i++) {
            // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
            if (total + choices[i] > target) {
                continue;
            }
            // Попытка: сделать выбор и обновить сумму элементов total
            state.add(choices[i]);
            // Перейти к следующему варианту выбора
            backtrack(state, target, total + choices[i], choices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножества I (включая повторяющиеся подмножества) */
    static List<List<Integer>> subsetSumINaive(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        int total = 0; // подмножествосумма
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, total, nums, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumINaive(nums, target);

        System.out.println("Входной массив nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Все подмножества res с суммой " + target + " = " + res);
        System.out.println("Обратите внимание: результат этого метода содержит повторяющиеся множества");
    }
}
