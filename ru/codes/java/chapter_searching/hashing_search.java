/**
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;
import java.util.*;

public class hashing_search {
    /* Поиск по хеш-таблице в массиве */
    static int hashingSearchArray(Map<Integer, Integer> map, int target) {
        // Ключ хеш-таблицы — искомый элемент, значение — его индекс
        // Если ключа в хеш-таблице нет, возвращаем -1
        return map.getOrDefault(target, -1);
    }

    /* Поиск по хеш-таблице в связном списке */
    static ListNode hashingSearchLinkedList(Map<Integer, ListNode> map, int target) {
        // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
        // Если ключа в хеш-таблице нет, возвращаем null
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* Поиск по хеш-таблице в массиве */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // Создаём хеш-таблицу
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i); // Ключ — элемент, значение — индекс
        }
        int index = hashingSearchArray(map, target);
        System.out.println("Индекс элемента 3 = " + index);

        /* Поиск по хеш-таблице в связном списке */
        ListNode head = ListNode.arrToLinkedList(nums);
        // Создаём хеш-таблицу
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head); // Ключ — значение узла, значение — сам узел
            head = head.next;
        }
        ListNode node = hashingSearchLinkedList(map1, target);
        System.out.println("Узел со значением 3: " + node);
    }
}
