/**
 * File: subset_sum_ii.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_ii {
    /* Алгоритм бэктрекинга: сумма подмножеств II */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Если сумма подмножества равна target, записать решение
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Обойти все варианты выбора
        // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
        // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
        for (int i = start; i < choices.length; i++) {
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
            state.add(choices[i]);
            // Перейти к следующему выбору
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Решить задачу суммы подмножеств II */
    static List<List<Integer>> subsetSumII(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        Arrays.sort(nums); // Отсортировать nums
        int start = 0; // Стартовая вершина обхода
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 4, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumII(nums, target);

        System.out.println("Входной массив nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Все подмножества с суммой " + target + ": res = " + res);
    }
}
