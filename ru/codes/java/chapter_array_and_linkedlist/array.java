/**
 * File: array.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

public class array {
    /* Случайный доступ к элементу */
    static int randomAccess(int[] nums) {
        // Случайно выбрать число в интервале [0, nums.length)
        int randomIndex = ThreadLocalRandom.current().nextInt(0, nums.length);
        // Получить и вернуть случайный элемент
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* Увеличить длину массива */
    static int[] extend(int[] nums, int enlarge) {
        // Инициализировать массив увеличенной длины
        int[] res = new int[nums.length + enlarge];
        // Скопировать все элементы исходного массива в новый массив
        for (int i = 0; i < nums.length; i++) {
            res[i] = nums[i];
        }
        // Вернуть новый расширенный массив
        return res;
    }

    /* Вставить элемент num в массив по индексу index */
    static void insert(int[] nums, int num, int index) {
        // Сдвинуть индекс index и все последующие элементы на одну позицию назад
        for (int i = nums.length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // Присвоить num элементу по индексу index
        nums[index] = num;
    }

    /* Удалить элемент по индексу index */
    static void remove(int[] nums, int index) {
        // Сдвинуть все элементы после индекса index на одну позицию вперед
        for (int i = index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* Перебрать массив */
    static void traverse(int[] nums) {
        int count = 0;
        // Обходить массив по индексам
        for (int i = 0; i < nums.length; i++) {
            count += nums[i];
        }
        // Непосредственно обходить элементы массива
        for (int num : nums) {
            count += num;
        }
    }

    /* Найти заданный элемент в массиве */
    static int find(int[] nums, int target) {
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        /* Инициализировать массив */
        int[] arr = new int[5];
        System.out.println("Массив arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("Массив nums = " + Arrays.toString(nums));

        /* Случайный доступ */
        int randomNum = randomAccess(nums);
        System.out.println("Полученный случайный элемент из nums " + randomNum);

        /* Расширение длины */
        nums = extend(nums, 3);
        System.out.println("После расширения длины массива до 8 получаем nums = " + Arrays.toString(nums));

        /* Вставить элемент */
        insert(nums, 6, 3);
        System.out.println("После вставки числа 6 по индексу 3 получаем nums = " + Arrays.toString(nums));

        /* Удалить элемент */
        remove(nums, 2);
        System.out.println("После удаления элемента по индексу 2 получаем nums = " + Arrays.toString(nums));

        /* Перебрать массив */
        traverse(nums);

        /* Найти элемент */
        int index = find(nums, 3);
        System.out.println("Поиск элемента 3 в nums дает индекс = " + index);
    }
}
