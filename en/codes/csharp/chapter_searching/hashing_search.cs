/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* Hash lookup in an array */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // Hash table key: target element, value: index
        // Return -1 if the key is absent
        return map.GetValueOrDefault(target, -1);
    }

    /* Hash lookup in a linked list */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // Hash table key: target node value, value: node object
        // Return null if the key is absent
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Hash lookup in an array */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // Initialize the hash table
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key: element, value: index
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("Index of target 3 = " + index);

        /* Hash lookup in a linked list */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // Initialize the hash table
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key: node value, value: node
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("Node object for target value 3 = " + node);
    }
}
