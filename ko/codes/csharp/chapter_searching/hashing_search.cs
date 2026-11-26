/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* 배열에서의 해시 탐색 */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // 해시 테이블의 key는 목표 원소, value는 인덱스다.
        // 해시 테이블에 해당 키가 없으면 -1을 반환한다.
        return map.GetValueOrDefault(target, -1);
    }

    /* 연결 리스트에서의 해시 탐색 */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
        // 해시 테이블에 해당 키가 없으면 null을 반환한다.
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 배열에서의 해시 탐색 */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // 해시 테이블 초기화
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key는 원소, value는 인덱스다.
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("목표 원소 3의 인덱스 = " + index);

        /* 연결 리스트에서의 해시 탐색 */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // 해시 테이블 초기화
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key는 노드의 값, value는 노드다.
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("값이 3인 목표 노드의 객체 = " + node);
    }
}
