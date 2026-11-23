/**
 * File: hashing_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class hashing_search {
    /* 해시 탐색(배열) */
    int HashingSearchArray(Dictionary<int, int> map, int target) {
        // 해시 테이블의 key: 목표 원소, value: 인덱스
        // 해시 테이블에 해당 key가 없으면 -1을 반환한다
        return map.GetValueOrDefault(target, -1);
    }

    /* 해시 탐색(연결 리스트) */
    ListNode? HashingSearchLinkedList(Dictionary<int, ListNode> map, int target) {

        // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
        // 해시 테이블에 해당 key가 없으면 null을 반환한다
        return map.GetValueOrDefault(target);
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 해시 탐색(배열) */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // 해시 테이블 초기화
        Dictionary<int, int> map = [];
        for (int i = 0; i < nums.Length; i++) {
            map[nums[i]] = i;  // key: 원소, value: 인덱스
        }
        int index = HashingSearchArray(map, target);
        Console.WriteLine("목표 원소 3의 인덱스 = " + index);

        /* 해시 탐색(연결 리스트) */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        // 해시 테이블 초기화
        Dictionary<int, ListNode> map1 = [];
        while (head != null) {
            map1[head.val] = head;  // key: 노드 값, value: 노드
            head = head.next;
        }
        ListNode? node = HashingSearchLinkedList(map1, target);
        Console.WriteLine("목표 노드 값 3에 해당하는 노드 객체 " + node);
    }
}
