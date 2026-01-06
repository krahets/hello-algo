/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* 線形探索（配列） */
    static int linearSearchArray(int[] nums, int target) {
        // 配列を走査
        for (int i = 0; i < nums.length; i++) {
            // 目標要素を見つけたので、そのインデックスを返す
            if (nums[i] == target)
                return i;
        }
        // 目標要素を見つけられなかったので、-1 を返す
        return -1;
    }

    /* 線形探索（連結リスト） */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // リストを走査
        while (head != null) {
            // 目標ノードを見つけたので、それを返す
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 目標ノードが見つからない場合、null を返す
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* 配列で線形探索を実行 */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("目標要素 3 のインデックスは " + index);

        /* 連結リストで線形探索を実行 */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("目標ノード値 3 に対応するノードオブジェクトは " + node);
    }
}