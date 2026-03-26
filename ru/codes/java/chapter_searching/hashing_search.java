/**
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;
import java.util.*;

public class hashing_search {
    /* Хеш-поиск (массив) */
    static int hashingSearchArray(Map<Integer, Integer> map, int target) {
        // У хеш-таблицы key: целевой элемент, value: индекс
        // Если такого key в хеш-таблице нет, вернуть -1
        return map.getOrDefault(target, -1);
    }

    /* Хеш-поиск (связный список) */
    static ListNode hashingSearchLinkedList(Map<Integer, ListNode> map, int target) {
        // У хеш-таблицы key: целевое значение узла, value: объект узла
        // Если такого key в хеш-таблице нет, вернуть null
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* Хеш-поиск (массив) */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // Инициализировать хеш-таблицу
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i); // key: элемент, value: индекс
        }
        int index = hashingSearchArray(map, target);
        System.out.println("Индекс целевого элемента 3 =" + index);

        /* Хеш-поиск (связный список) */
        ListNode head = ListNode.arrToLinkedList(nums);
        // Инициализировать хеш-таблицу
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head); // key: значение узла, value: узел
            head = head.next;
        }
        ListNode node = hashingSearchLinkedList(map1, target);
        System.out.println("Объект узла, соответствующий целевому значению 3, равен" + node);
    }
}
