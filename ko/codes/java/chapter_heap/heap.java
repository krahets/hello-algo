/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void testPush(Queue<Integer> heap, int val) {
        heap.offer(val); // 힙에 원소 삽입
        System.out.format("\n원소 %d 삽입 후\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // 힙의 루트 원소 꺼내기
        System.out.format("\n루트 원소 %d을 꺼낸 뒤의 힙\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* 힙 초기화 */
        // 최소 힙 초기화
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 최대 힙 초기화(람다 식으로 Comparator를 변경하면 됨)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n다음은 최대 힙 테스트 예제다.");

        /* 힙에 원소 삽입 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 힙의 루트 원소 구하기 */
        int peek = maxHeap.peek();
        System.out.format("\n힙의 루트 원소: %d\n", peek);

        /* 힙의 루트 원소 꺼내기 */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* 힙 크기 구하기 */
        int size = maxHeap.size();
        System.out.format("\n힙의 원소 수: %d\n", size);

        /* 힙이 비었는지 확인 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n빈 힙 여부: %b\n", isEmpty);

        /* 입력 리스트로 힙 구성 */
        // 시간 복잡도는 O(nlogn)이 아니라 O(n)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\n입력 리스트로 만든 최소 힙:");
        PrintUtil.printHeap(minHeap);
    }
}
