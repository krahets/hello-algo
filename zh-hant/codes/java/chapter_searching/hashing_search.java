/**
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;
import java.util.*;

public class hashing_search {
    /* 雜湊查詢（陣列） */
    static int hashingSearchArray(Map<Integer, Integer> map, int target) {
        // 雜湊表的 key: 目標元素，value: 索引
        // 若雜湊表中無此 key ，返回 -1
        return map.getOrDefault(target, -1);
    }

    /* 雜湊查詢（鏈結串列） */
    static ListNode hashingSearchLinkedList(Map<Integer, ListNode> map, int target) {
        // 雜湊表的 key: 目標節點值，value: 節點物件
        // 若雜湊表中無此 key ，返回 null
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* 雜湊查詢（陣列） */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // 初始化雜湊表
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i); // key: 元素，value: 索引
        }
        int index = hashingSearchArray(map, target);
        System.out.println("目標元素 3 的索引 = " + index);

        /* 雜湊查詢（鏈結串列） */
        ListNode head = ListNode.arrToLinkedList(nums);
        // 初始化雜湊表
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head); // key: 節點值，value: 節點
            head = head.next;
        }
        ListNode node = hashingSearchLinkedList(map1, target);
        System.out.println("目標節點值 3 的對應節點物件為 " + node);
    }
}
