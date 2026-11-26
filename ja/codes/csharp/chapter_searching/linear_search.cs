/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* 線形探索（配列） */
    int LinearSearchArray(int[] nums, int target) {
        // 配列を走査する
        for (int i = 0; i < nums.Length; i++) {
            // 目標の要素が見つかったので、そのインデックスを返す
            if (nums[i] == target)
                return i;
        }
        // 目標の要素が見つからなかったので -1 を返す
        return -1;
    }

    /* 線形探索（連結リスト） */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // 連結リストを走査する
        while (head != null) {
            // 目標ノードが見つかったので、そのノードを返す
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 目標ノードが見つからなかったので null を返す
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 配列で線形探索を行う */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("目標値 3 のインデックス = " + index);

        /* 連結リストで線形探索を行う */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("目標値 3 に対応するノードオブジェクトは " + node);
    }
}
