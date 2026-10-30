/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* Hash-based search (array) */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // Hash table key: target element; value: index
        // Return -1 if the hash table does not contain this key
        return map.GetValueOrDefault(target, -1);
    }

    /* Hash-based search (linked list) */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // Hash table key: target node value; value: node object
        // Return null if the hash table does not contain this key
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* Hash-based search (array) */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // Initialize the hash table
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key: element; value: index
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("Index of target element 3 = " + index);

        /* Hash-based search (linked list) */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // Initialize the hash table
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key: node value; value: node
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("The node object corresponding to target value 3 is " + node);
    }
}
