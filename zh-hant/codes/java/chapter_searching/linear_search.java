/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* 循序搜尋（陣列） */
    static int linearSearchArray(int[] nums, int target) {
        // 走訪陣列
        for (int i = 0; i < nums.length; i++) {
            // 找到目標元素，回傳其索引
            if (nums[i] == target)
                return i;
        }
        // 找不到目標元素，回傳 -1
        return -1;
    }

    /* 循序搜尋（鏈結串列） */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // 走訪鏈結串列
        while (head != null) {
            // 找到目標節點，回傳該節點
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 找不到目標節點，回傳 null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* 在陣列中執行循序搜尋 */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("目標元素 3 的索引 = " + index);

        /* 在鏈結串列中執行循序搜尋 */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("目標值 3 對應的節點物件為 " + node);
    }
}
