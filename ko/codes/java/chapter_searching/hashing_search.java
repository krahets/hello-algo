/**
 * File: hashing_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import utils.*;
import java.util.*;

public class hashing_search {
    /* 해시 탐색(배열) */
    static int hashingSearchArray(Map<Integer, Integer> map, int target) {
        // 해시 테이블의 key: 목표 원소, value: 인덱스
        // 해시 테이블에 해당 key가 없으면 -1을 반환한다
        return map.getOrDefault(target, -1);
    }

    /* 해시 탐색(연결 리스트) */
    static ListNode hashingSearchLinkedList(Map<Integer, ListNode> map, int target) {
        // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
        // 해시 테이블에 해당 key가 없으면 null을 반환한다
        return map.getOrDefault(target, null);
    }

    public static void main(String[] args) {
        int target = 3;

        /* 해시 탐색(배열) */
        int[] nums = { 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
        // 해시 테이블 초기화
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i); // key: 원소, value: 인덱스
        }
        int index = hashingSearchArray(map, target);
        System.out.println("목표 원소 3의 인덱스 = " + index);

        /* 해시 탐색(연결 리스트) */
        ListNode head = ListNode.arrToLinkedList(nums);
        // 해시 테이블 초기화
        Map<Integer, ListNode> map1 = new HashMap<>();
        while (head != null) {
            map1.put(head.val, head); // key: 노드 값, value: 노드
            head = head.next;
        }
        ListNode node = hashingSearchLinkedList(map1, target);
        System.out.println("목표 노드 값 3에 해당하는 노드 객체 " + node);
    }
}
