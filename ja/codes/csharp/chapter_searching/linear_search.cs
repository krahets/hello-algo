/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* 線形探索（配列） */
    int LinearSearchArray(int[] nums, int target) {
        // 配列を走査
        for (int i = 0; i < nums.Length; i++) {
            // 目標要素が見つかったらそのインデックスを返す
            if (nums[i] == target)
                return i;
        }
        // 目標要素が見つからなければ -1 を返す
        return -1;
    }

    /* 線形探索（連結リスト） */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // 連結リストを走査
        while (head != null) {
            // 対象ノードが見つかったら、それを返す
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 対象ノードが見つからない場合は null を返す
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 配列で線形探索を行う */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("対象要素 3 のインデックス = " + index);

        /* 連結リストで線形探索を行う */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("目標ノード値 3 に対応するノードオブジェクトは " + node);
    }
}
