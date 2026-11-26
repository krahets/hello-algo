/**
 * File: permutations_i.java
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class permutations_i {
    /* Поиск с возвратом: перестановки I */
    public static void backtrack(List<Integer> state, int[] choices, boolean[] selected, List<List<Integer>> res) {
        // Когда длина текущей перестановки равна числу элементов, сохраняем решение
        if (state.size() == choices.length) {
            res.add(new ArrayList<Integer>(state));
            return;
        }
        // Перебираем все варианты
        for (int i = 0; i < choices.length; i++) {
            int choice = choices[i];
            // Отсечение: нельзя выбирать один элемент дважды
            if (!selected[i]) {
                // Пробуем вариант и обновляем состояние
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

    /* Перестановки I */
    static List<List<Integer>> permutationsI(int[] nums) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        backtrack(new ArrayList<Integer>(), nums, new boolean[nums.length], res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 1, 2, 3 };

        List<List<Integer>> res = permutationsI(nums);

        System.out.println("Исходный массив nums = " + Arrays.toString(nums));
        System.out.println("Все перестановки res = " + res);
    }
}
