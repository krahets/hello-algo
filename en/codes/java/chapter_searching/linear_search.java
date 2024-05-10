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
        // Traverse array
        for (int i = 0; i < nums.length; i++) {
            // Found the target element, thus return its index
            if (nums[i] == target)
                return i;
        }
        // Did not find the target element, thus return -1
        return -1;
    }

    /* Linear search (linked list) */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // Traverse the list
        while (head != null) {
            // Found the target node, return it
            if (head.val == target)
                return head;
            head = head.next;
        }
        // If the target node is not found, return null
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* Perform linear search in array */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("The index of target element 3 is " + index);

        /* Perform linear search in linked list */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("The corresponding node object for target node value 3 is " + node);
    }
}
