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
        // Случайным образом выбрать число из интервала [0, nums.length)
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
        // Вернуть новый массив после расширения
        return res;
    }

    /* Вставить элемент num по индексу index в массив */
    static void insert(int[] nums, int num, int index) {
        // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
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

    /* Обход массива */
    static void traverse(int[] nums) {
        int count = 0;
        // Обход массива по индексам
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
        /* Инициализация массива */
        int[] arr = new int[5];
        System.out.println("Массив arr = " + Arrays.toString(arr));
        int[] nums = { 1, 3, 2, 5, 4 };
        System.out.println("Массив nums = " + Arrays.toString(nums));

        /* Случайный доступ */
        int randomNum = randomAccess(nums);
        System.out.println("Случайный элемент из nums = " + randomNum);

        /* Расширение длины */
        nums = extend(nums, 3);
        System.out.println("После увеличения длины массива до 8 nums = " + Arrays.toString(nums));

        /* Вставка элемента */
        insert(nums, 6, 3);
        System.out.println("После вставки числа 6 по индексу 3 nums = " + Arrays.toString(nums));

        /* Удаление элемента */
        remove(nums, 2);
        System.out.println("После удаления элемента по индексу 2 nums = " + Arrays.toString(nums));

        /* Обход массива */
        traverse(nums);

        /* Поиск элемента */
        int index = find(nums, 3);
        System.out.println("Поиск элемента 3 в nums: индекс = " + index);
    }
}
