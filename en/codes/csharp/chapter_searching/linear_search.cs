/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* Linear search (array) */
    int LinearSearchArray(int[] nums, int target) {
        // Traverse array
        for (int i = 0; i < nums.Length; i++) {
            // Found the target element, return its index
            if (nums[i] == target)
                return i;
        }
        // Target element not found, return -1
        return -1;
    }

    /* Linear search (linked list) */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // Traverse the linked list
        while (head != null) {
            // Found the target node, return it
            if (head.val == target)
                return head;
            head = head.next;
        }
        // Target node not found, return null
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Perform linear search in array */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("Index of target element 3 = " + index);

        /* Perform linear search in linked list */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("Node object corresponding to target node value 3 is " + node);
    }
}
