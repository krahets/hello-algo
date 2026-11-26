/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* Linear search in an array */
    int LinearSearchArray(int[] nums, int target) {
        // Traverse the array
        for (int i = 0; i < nums.Length; i++) {
            // Found the target. Return its index
            if (nums[i] == target)
                return i;
        }
        // Target not found. Return -1
        return -1;
    }

    /* Linear search in a linked list */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
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

    [Test]
    public void Test() {
        int target = 3;

        /* Run linear search on the array */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("Index of target 3 = " + index);

        /* Run linear search on the linked list */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("Node object for target value 3 = " + node);
    }
}
