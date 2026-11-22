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
        System.out.format("\n원소를 힙에 삽입한 후(원소: %d)\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // 힙의 루트 원소 꺼내기
        System.out.format("\n힙의 루트 원소를 꺼낸 후(원소: %d)\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* 힙 초기화 */
        // 최소 힙 초기화
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 최대 힙 초기화(lambda 식으로 Comparator를 수정하면 된다)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\n다음 테스트 예제는 최대 힙이다");

        /* 힙에 원소 삽입 */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* 힙의 루트 원소 반환 */
        int peek = maxHeap.peek();
        System.out.format("\n힙의 루트 원소: %d\n", peek);

        /* 힙의 루트 원소 꺼내기 */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* 힙 크기 반환 */
        int size = maxHeap.size();
        System.out.format("\n힙의 원소 개수: %d\n", size);

        /* 힙이 비어 있는지 판단 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n힙이 비어 있는가: %b\n", isEmpty);

        /* 리스트를 입력하여 힙 구성 */
        // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\n리스트를 입력하여 최소 힙을 구성한 후");
        PrintUtil.printHeap(minHeap);
    }
}
