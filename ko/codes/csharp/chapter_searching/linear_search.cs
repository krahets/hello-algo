/**
 * File: linear_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class linear_search {
    /* 배열에서의 선형 탐색 */
    int LinearSearchArray(int[] nums, int target) {
        // 배열을 순회한다.
        for (int i = 0; i < nums.Length; i++) {
            // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
            if (nums[i] == target)
                return i;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다.
        return -1;
    }

    /* 연결 리스트에서의 선형 탐색 */
    ListNode? LinearSearchLinkedList(ListNode? head, int target) {
        // 연결 리스트를 순회한다.
        while (head != null) {
            // 목표 노드를 찾았으므로 해당 노드를 반환한다.
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 목표 노드를 찾지 못했으므로 null을 반환한다.
        return null;
    }

    [Test]
    public void Test() {
        int target = 3;

        /* 배열에서 선형 탐색 수행 */
        int[] nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        int index = LinearSearchArray(nums, target);
        Console.WriteLine("목표 원소 3의 인덱스 = " + index);

        /* 연결 리스트에서 선형 탐색 수행 */
        ListNode? head = ListNode.ArrToLinkedList(nums);
        ListNode? node = LinearSearchLinkedList(head, target);
        Console.WriteLine("값이 3인 목표 노드의 객체 = " + node);
    }
}
