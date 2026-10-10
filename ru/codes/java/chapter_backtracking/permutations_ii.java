/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* Алгоритм бэктрекинга: все перестановки II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебор всех вариантов выбора
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
            if (!selected[i] && !duplicated.contains(choice)) {
                // Попытка: сделать выбор и обновить состояние
                duplicated.add(choice); // Записать значения уже выбранных элементов
                selected[i] = true;
                state.add(choice);
                // Перейти к следующему выбору
                backtrack(state, choices, selected, res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Все перестановки II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("Входной массив nums = " + Arrays.toString(nums));
        System.out.println("Все перестановки res = " + res);
    }
}
