/**
 * File: permutations_ii.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_ii {
    /* Поиск с возвратом: перестановки II */
    static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебираем все варианты
        Set<Integer> duplicated = new HashSet<Integer>();
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
            if (!selected[i] && !duplicated.contains(choice)) {
                // Пробуем вариант и обновляем состояние
                duplicated.add(choice); // Отмечаем уже выбранные значения
                selected[i] = true;
                state.add(choice);
                // Переходим к следующему выбору
                backtrack(state, choices, selected, res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                selected[i] = false;
                state.remove(state.size() - 1);
            }
        }
    }

    /* Перестановки II */
    static List<List<Integer>> permutationsII(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 2 };

        List<List<Integer>> res = permutationsII(nums);

        System.out.println("Исходный массив nums = " + Arrays.toString(nums));
        System.out.println("Все перестановки res = " + res);
    }
}
