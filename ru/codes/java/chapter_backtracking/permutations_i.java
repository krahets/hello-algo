/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* Алгоритм бэктрекинга: все перестановки I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина состояния равна числу элементов, записать решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебор всех вариантов выбора
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один и тот же элемент повторно
            if (!selected[i]) {
                // Попытка: сделать выбор и обновить состояние
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

    /* Все перестановки I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("Входной массив nums = " + Arrays.toString(nums));
        System.out.println("Все перестановки res = " + res);
    }
}
