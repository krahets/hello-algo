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
        // Тип массива должен быть Integer[], а не int[]: элементам списка нужен Integer — класс-обёртка для int
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("Список nums = " + nums);

        /* Доступ к элементу */
        int num = nums.get(1);
        System.out.println("Элемент по индексу 1: num = " + num);

        /* Изменение элемента */
        nums.set(1, 0);
        System.out.println("После записи 0 по индексу 1 nums = " + nums);

        /* Очистка списка */
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

        /* Обойти список по индексам */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }
        /* Перебрать элементы списка напрямую */
        for (int x : nums) {
            count += x;
        }

        /* Объединение двух списков */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1);
        System.out.println("После добавления nums1 в конец nums получаем nums = " + nums);

        /* Сортировка списка */
        Collections.sort(nums);
        System.out.println("После сортировки nums = " + nums);
    }
}
