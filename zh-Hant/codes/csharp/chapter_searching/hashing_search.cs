/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* 雜湊查詢（陣列） */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // 雜湊表的 key: 目標元素，value: 索引
        // 若雜湊表中無此 key ，返回 -1
        return map.GetValueOrDefault(target, -1);
    }

    /* 雜湊查詢（鏈結串列） */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // 雜湊表的 key: 目標節點值，value: 節點物件
        // 若雜湊表中無此 key ，返回 null
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 雜湊查詢（陣列） */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // 初始化雜湊表
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key: 元素，value: 索引
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("目標元素 3 的索引 = " + index);

        /* 雜湊查詢（鏈結串列） */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // 初始化雜湊表
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key: 節點值，value: 節點
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("目標節點值 3 的對應節點物件為 " + node);
    }
}
