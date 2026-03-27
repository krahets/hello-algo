/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* Инициализация списка */
        // Обратите внимание: тип элементов массива int[] — это обертка Integer[]
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("Список nums = " + nums);

        /* Доступ к элементу */
        int num = nums.get(1);
        System.out.println("Элемент по индексу 1: num = " + num);

        /* Обновление элемента */
        nums.set(1, 0);
        System.out.println("После обновления элемента по индексу 1 до 0 nums = " + nums);

        /* Очистить список */
        nums.clear();
        System.out.println("После очистки списка nums = " + nums);

        /* Добавление элемента в конец */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("После добавления элементов nums = " + nums);

        /* Вставка элемента в середину */
        nums.add(3, 6);
        System.out.println("После вставки числа 6 по индексу 3 nums = " + nums);

        /* Удаление элемента */
        nums.remove(3);
        System.out.println("После удаления элемента по индексу 3 nums = " + nums);

        /* Обходить список по индексам */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* Непосредственно обходить элементы списка */
        for (int x : nums) {
            count += x;
        }

        /* Объединить два списка */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("После конкатенации списка nums1 к nums nums = " + nums);

        /* Отсортировать список */
        Collections.sort(nums);
        System.out.println("После сортировки списка nums = " + nums);
    }
}
