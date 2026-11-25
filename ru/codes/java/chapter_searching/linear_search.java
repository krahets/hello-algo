/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* Линейный поиск в массиве */
    static int linearSearchArray(int[] nums, int target) {
        // Обходим массив
        for (int i = 0; i < nums.length; i++) {
            // Элемент найден, возвращаем его индекс
            if (nums[i] == target)
                return i;
        }
        // Элемент не найден, возвращаем -1
        return -1;
    }

    /* Линейный поиск в связном списке */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // Обходим связный список
        while (head != null) {
            // Нужный узел найден, возвращаем его
            if (head.val == target)
                return head;
            head = head.next;
        }
        // Нужный узел не найден, возвращаем null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* Выполняем линейный поиск в массиве */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("Индекс элемента 3 = " + index);

        /* Выполняем линейный поиск в связном списке */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("Узел со значением 3: " + node);
    }
}
