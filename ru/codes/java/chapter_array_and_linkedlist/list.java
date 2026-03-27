/**
 * File: list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import java.util.*;

public class list {
    public static void main(String[] args) {
        /* Инициализировать список */
        // Обратите внимание: тип элементов массива здесь Integer[], то есть обертка для int[]
        Integer[] numbers = new Integer[] { 1, 3, 2, 5, 4 };
        List<Integer> nums = new ArrayList<>(Arrays.asList(numbers));
        System.out.println("Список nums = " + nums);

        /* Получить доступ к элементу */
        int num = nums.get(1);
        System.out.println("обратиться киндекс 1 поэлемент, получаем num =" + num);

        /* Обновить элемент */
        nums.set(1, 0);
        System.out.println("После обновления элемента по индексу 1 на 0 получаем nums = " + nums);

        /* Очистить список */
        nums.clear();
        System.out.println("После очистки списка nums = " + nums);

        /* Добавить элемент в конец */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        System.out.println("Добавитьэлементпосле nums =" + nums);

        /* Вставить элемент в середину */
        nums.add(3, 6);
        System.out.println("После вставки числа 6 по индексу 3 получаем nums = " + nums);

        /* Удалить элемент */
        nums.remove(3);
        System.out.println("После удаления элемента по индексу 3 получаем nums = " + nums);

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
        System.out.println("После присоединения списка nums1 к nums получаем nums = " + nums);

        /* Отсортировать список */
        Collections.sort(nums);
        System.out.println("После сортировки списка nums = " + nums);
    }
}
