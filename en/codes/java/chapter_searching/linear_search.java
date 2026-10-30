/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* Linear search (array) */
    static int linearSearchArray(int[] nums, int target) {
        // Traverse the array
        for (int i = 0; i < nums.length; i++) {
            // The target element was found; return its index
            if (nums[i] == target)
                return i;
        }
        // The target element was not found; return -1
        return -1;
    }

    /* Linear search (linked list) */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // Traverse the linked list
        while (head != null) {
            // The target node was found; return it
            if (head.val == target)
                return head;
            head = head.next;
        }
        // The target node was not found; return null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* Perform linear search on the array */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("Index of target element 3 = " + index);

        /* Perform linear search on the linked list */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("The node object corresponding to target value 3 is " + node);
    }
}
