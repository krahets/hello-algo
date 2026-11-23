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
        // 配列を走査する
        for (int i = 0; i < nums.length; i++) {
            // 目的の要素が見つかったので、そのインデックスを返す
            if (nums[i] == target)
                return i;
        }
        // 目的の要素が見つからなかったので、-1 を返す
        return -1;
    }

    /* 線形探索（連結リスト） */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // 連結リストを走査する
        while (head != null) {
            // 目的のノードが見つかったので、それを返す
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 目的のノードが見つからなかったので、null を返す
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* 配列で線形探索を行う */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("目的の要素 3 のインデックス = " + index);

        /* 連結リストで線形探索を行う */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("目的のノードの値 3 に対応するノードオブジェクトは " + node);
    }
}
