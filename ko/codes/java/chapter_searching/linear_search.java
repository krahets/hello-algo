/**
 * File: linear_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;

public class linear_search {
    /* 선형 탐색(배열) */
    static int linearSearchArray(int[] nums, int target) {
        // 배열 순회
        for (int i = 0; i < nums.length; i++) {
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            if (nums[i] == target)
                return i;
        }
        // 목표 원소를 찾지 못했으므로 -1을 반환한다
        return -1;
    }

    /* 선형 탐색(연결 리스트) */
    static ListNode linearSearchLinkedList(ListNode head, int target) {
        // 연결 리스트 순회
        while (head != null) {
            // 목표 노드를 찾았으므로 해당 노드를 반환한다
            if (head.val == target)
                return head;
            head = head.next;
        }
        // 목표 노드를 찾지 못했으므로 null을 반환한다
        return null;
    }

    public static void main(String[] args) {
        int target = 3;

        /* 배열에서 선형 탐색을 수행한다 */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        int index = linearSearchArray(nums, target);
        System.out.println("목표 원소 3의 인덱스 = " + index);

        /* 연결 리스트에서 선형 탐색을 수행한다 */
        ListNode head = ListNode.arrToLinkedList(nums);
        ListNode node = linearSearchLinkedList(head, target);
        System.out.println("목표 노드 값 3에 해당하는 노드 객체 " + node);
    }
}
