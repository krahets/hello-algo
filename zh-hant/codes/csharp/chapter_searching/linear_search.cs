/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* 循序搜尋（陣列） */
    int LinearSearchArray(int[] nums, int target) {
        // 走訪陣列
        for (int i = 0; i < nums.Length; i++) {
            // 找到目標元素，回傳其索引
            if (nums[i] == target)
                return i;
        }
        // 找不到目標元素，回傳 -1
        return -1;
    }

    /* 循序搜尋（鏈結串列） */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // 走訪鏈結串列
        while (head != null) {
            // 找到目標節點，回傳該節點
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 找不到目標節點，回傳 null
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 在陣列中執行循序搜尋 */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("目標元素 3 的索引 = " + index);

        /* 在鏈結串列中執行循序搜尋 */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("目標值 3 對應的節點物件為 " + node);
    }
}
