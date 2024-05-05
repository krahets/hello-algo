/**
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;
import java.util.*;

public class hashing_search {
    /* Hash search (array) */
    static int hashingSearchArray(Map<Integer, Integer> map, int target) {
        // Hash table's key: target element, value: index
        // If the hash table does not contain this key, return -1
        return map.getOrDefault(target, -1);
    }

    /* Hash search (linked list) */
    static ListNode hashingSearchLinkedList(Map<Integer, ListNode> map, int target) {
        // Hash table key: target node value, value: node object
        // If the key is not in the hash table, return null
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* Hash search (array) */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // Initialize hash table
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i); // key: element, value: index
        }
        int index = hashingSearchArray(map, target);
        System.out.println("The index of target element 3 is " + index);

        /* Hash search (linked list) */
        ListNode head = ListNode.arrToLinkedList(nums);
        // Initialize hash table
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head); // key: node value, value: node
            head = head.next;
        }
        ListNode node = hashingSearchLinkedList(map1, target);
        System.out.println("The corresponding node object for target node value 3 is " + node);
    }
}
