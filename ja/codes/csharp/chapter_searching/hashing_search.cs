/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* ハッシュ探索（配列） */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // ハッシュテーブルのキーは目標の要素、値はインデックス
        // このキーがハッシュテーブルになければ -1 を返す
        return map.GetValueOrDefault(target, -1);
    }

    /* ハッシュ探索（連結リスト） */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // ハッシュテーブルのキーは目標ノードの値、値はノードオブジェクト
        // このキーがハッシュテーブルになければ null を返す
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* ハッシュ探索（配列） */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // ハッシュテーブルを初期化する
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // キーは要素、値はインデックス
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("目標値 3 のインデックス = " + index);

        /* ハッシュ探索（連結リスト） */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // ハッシュテーブルを初期化する
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // キーはノードの値、値はノード
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("目標値 3 に対応するノードオブジェクトは " + node);
    }
}
