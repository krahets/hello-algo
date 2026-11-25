/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* Linear search in an array */
    static int linearSearchArray(int[] nums, int target) {
        // Traverse the array
        for (int i = 0; i < nums.length; i++) {
            // Found the target. Return its index
            if (nums[i] == target)
                return i;
        }
        // Target not found. Return -1
        return -1;
    }

    /* Linear search in a linked list */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // Traverse the linked list
        while (head != null) {
            // Found the target node. Return it
            if (head.val == target)
                return head;
            head = head.next;
        }
        // Target node not found. Return null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* Run linear search on the array */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("Index of target 3 = " + index);

        /* Run linear search on the linked list */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("Node object for target value 3 = " + node);
    }
}
