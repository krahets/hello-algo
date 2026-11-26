/**
 * File: subset_sum_i.java
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class subset_sum_i {
    /* Поиск с возвратом: сумма подмножества I */
    static void backtrack(List<Integer> state, int target, int[] choices, int start, List<List<Integer>> res) {
        // Если сумма подмножества равна target, сохраняем решение
        if (target == 0) {
            res.add(new ArrayList<>(state));
            return;
        }
        // Перебираем все варианты
        // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
        for (int i = start; i < choices.length; i++) {
            // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
            // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
            if (target - choices[i] < 0) {
                break;
            }
            // Пробуем вариант и обновляем target и start
            state.add(choices[i]);
            // Переходим к следующему выбору
            backtrack(state, target - choices[i], choices, i, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            state.remove(state.size() - 1);
        }
    }

    /* Задача о сумме подмножества I */
    static List<List<Integer>> subsetSumI(int[] nums, int target) {
        List<Integer> state = new ArrayList<>(); // Состояние (подмножество)
        Arrays.sort(nums); // Сортируем nums
        int start = 0; // Начальная позиция перебора
        List<List<Integer>> res = new ArrayList<>(); // Список результатов (список подмножеств)
        backtrack(state, target, nums, start, res);
        return res;
    }

    public static void main(String[] args) {
        int[] nums = { 3, 4, 5 };
        int target = 9;

        List<List<Integer>> res = subsetSumI(nums, target);

        System.out.println("Исходный массив nums = " + Arrays.toString(nums) + ", target = " + target);
        System.out.println("Все подмножества с суммой " + target + " образуют список res = " + res);
    }
}
