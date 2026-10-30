/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* Linear search (array) */
    int LinearSearchArray(int[] nums, int target) {
        // Traverse the array
        for (int i = 0; i < nums.Length; i++) {
            // The target element was found; return its index
            if (nums[i] == target)
                return i;
        }
        // The target element was not found; return -1
        return -1;
    }

    /* Linear search (linked list) */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
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

    [Test]
    public void Test() {
        int target = 3;

        /* Perform linear search on the array */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("Index of target element 3 = " + index);

        /* Perform linear search on the linked list */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("The node object corresponding to target value 3 is " + node);
    }
}
