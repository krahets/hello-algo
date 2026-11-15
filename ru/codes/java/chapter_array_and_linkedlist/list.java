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

        // [region]{access_element}
        /* Доступ к элементу */
        int num = nums.get(1); // Доступ к элементу по индексу 1
        // [endregion]{access_element}
        System.out.println("Элемент по индексу 1: num = " + num);

        // [region]{update_element}
        /* Изменение элемента */
        nums.set(1, 0); // Изменить значение элемента с индексом 1 на 0
        // [endregion]{update_element}
        System.out.println("После изменения значения элемента с индексом 1 на 0 nums = " + nums);

        // [region]{clear_list}
        /* Очистить список */
        nums.clear();
        // [endregion]{clear_list}
        System.out.println("После очистки списка nums = " + nums);

        // [region]{append_element}
        /* Добавление элемента в конец */
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        // [endregion]{append_element}
        System.out.println("После добавления элементов nums = " + nums);

        // [region]{insert_element}
        /* Вставка элемента в середину */
        nums.add(3, 6); // Вставить число 6 по индексу 3
        // [endregion]{insert_element}
        System.out.println("После вставки числа 6 по индексу 3 nums = " + nums);

        // [region]{remove_element}
        /* Удаление элемента */
        nums.remove(3); // Удалить элемент по индексу 3
        // [endregion]{remove_element}
        System.out.println("После удаления элемента по индексу 3 nums = " + nums);

        // [region]{iterate_list}
        /* Обходить список по индексам */
        int count = 0;
        for (int i = 0; i < nums.size(); i++) {
            count += nums.get(i);
        }

        /* Непосредственно обходить элементы списка */
        for (int x : nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* Объединить два списка */
        List<Integer> nums1 = new ArrayList<>(Arrays.asList(new Integer[] { 6, 8, 7, 10, 9 }));
        nums.addAll(nums1); // Присоединить список nums1 к концу nums
        // [endregion]{concat_list}
        System.out.println("После конкатенации списка nums1 к nums nums = " + nums);

        // [region]{sort_list}
        /* Отсортировать список */
        Collections.sort(nums); // После сортировки элементы списка идут по возрастанию
        // [endregion]{sort_list}
        System.out.println("После сортировки списка nums = " + nums);
    }
}
