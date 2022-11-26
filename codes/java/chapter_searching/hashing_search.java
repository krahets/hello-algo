/*
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_searching;

import include.*;
import java.util.*;

public class hashing_search {
    /* 哈希查找（数组） */
    static int hashingSearch(Map<Integer, Integer> map, int target) {
        // 哈希表的 key: 目标元素，value: 索引
        // 若哈希表中无此 key ，返回 -1
        return map.getOrDefault(target, -1);
    }

    /* 哈希查找（链表） */
    static ListNode hashingSearch1(Map<Integer, ListNode> map, int target) {
        // 哈希表的 key: 目标结点值，value: 结点对象
        // 若哈希表中无此 key ，返回 null
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* 哈希查找（数组） */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // 初始化哈希表
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i);  // key: 元素，value: 索引
        }
        int index = hashingSearch(map, target);
        System.out.println("目标元素 3 的索引 = " + index);

        /* 哈希查找（链表） */
        ListNode head = ListNode.arrToLinkedList(nums);
        // 初始化哈希表
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head);  // key: 结点值，value: 结点
            head = head.next;
        }
        ListNode node = hashingSearch1(map1, target);
        System.out.println("目标结点值 3 的对应结点对象为 " + node);
    }
}
