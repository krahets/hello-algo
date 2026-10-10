/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* Линейный поиск (массив) */
    static int linearSearchArray(int[] nums, int target) {
        // Обход массива
        for (int i = 0; i < nums.length; i++) {
            // Целевой элемент найден, вернуть его индекс
            if (nums[i] == target)
                return i;
        }
        // Целевой элемент не найден, вернуть -1
        return -1;
    }

    /* Линейный поиск (связный список) */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // Обойти связный список
        while (head != null) {
            // Найти целевой узел и вернуть его
            if (head.val == target)
                return head;
            head = head.next;
        }
        // Целевой узел не найден, вернуть null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* Выполнить линейный поиск в массиве */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("Индекс целевого элемента 3 = " + index);

        /* Выполнить линейный поиск в связном списке */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("Объект узла со значением 3 = " + node);
    }
}
