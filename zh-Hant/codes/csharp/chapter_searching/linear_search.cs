/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* 線性查詢（陣列） */
    int LinearSearchArray(int[] nums, int target) {
        // 走訪陣列
        for (int i = 0; i < nums.Length; i++) {
            // 找到目標元素，返回其索引
            if (nums[i] == target)
                return i;
        }
        // 未找到目標元素，返回 -1
        return -1;
    }

    /* 線性查詢（鏈結串列） */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // 走訪鏈結串列
        while (head != null) {
            // 找到目標節點，返回之
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 未找到目標節點，返回 null
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 在陣列中執行線性查詢 */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("目標元素 3 的索引 = " + index);

        /* 在鏈結串列中執行線性查詢 */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("目標節點值 3 的對應節點物件為 " + node);
    }
}
