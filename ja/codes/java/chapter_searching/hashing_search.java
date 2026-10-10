/**
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;
import java.util.*;

public class hashing_search {
    /* ハッシュ探索（配列） */
    static int hashingSearchArray(Map<Integer, Integer> map, int target) {
        // ハッシュテーブルの key: 目標要素、value: インデックス
        // ハッシュテーブルにこの key がなければ -1 を返す
        return map.getOrDefault(target, -1);
    }

    /* ハッシュ探索（連結リスト） */
    static ListNode hashingSearchLinkedList(Map<Integer, ListNode> map, int target) {
        // ハッシュテーブルの key: 目標ノード値、value: ノードオブジェクト
        // ハッシュテーブルにこの key がなければ null を返す
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* ハッシュ探索（配列） */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // ハッシュテーブルを初期化
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i); // key: 要素、value: インデックス
        }
        int index = hashingSearchArray(map, target);
        System.out.println("対象要素 3 のインデックス = " + index);

        /* ハッシュ探索（連結リスト） */
        ListNode head = ListNode.arrToLinkedList(nums);
        // ハッシュテーブルを初期化
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head); // key: ノード値、value: ノード
            head = head.next;
        }
        ListNode node = hashingSearchLinkedList(map1, target);
        System.out.println("対象ノード値 3 に対応するノードオブジェクトは " + node);
    }
}
