/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* ハッシュ探索（配列） */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // ハッシュテーブルの key: 目標要素、value: インデックス
        // ハッシュテーブルにこの key がなければ -1 を返す
        return map.GetValueOrDefault(target, -1);
    }

    /* ハッシュ探索（連結リスト） */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // ハッシュテーブルの key: 目標ノード値、value: ノードオブジェクト
        // ハッシュテーブルにこの key がなければ null を返す
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* ハッシュ探索（配列） */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // ハッシュテーブルを初期化
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key: 要素、value: インデックス
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("対象要素 3 のインデックス = " + index);

        /* ハッシュ探索（連結リスト） */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // ハッシュテーブルを初期化
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key: ノード値、value: ノード
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("目標ノード値 3 に対応するノードオブジェクトは " + node);
    }
}
