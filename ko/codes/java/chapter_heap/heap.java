/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void main(String[] args) {
        // [region]{init}
        /* 힙 초기화 */
        // 최소 힙 초기화
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 최대 힙 초기화(lambda 식으로 Comparator를 수정하면 된다)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
        // [endregion]{init}

        System.out.println("\n다음 테스트 예제는 최대 힙이다");

        // [region]{push}
        /* 힙에 원소 삽입 */
        maxHeap.offer(1);
        maxHeap.offer(3);
        maxHeap.offer(2);
        maxHeap.offer(5);
        maxHeap.offer(4);
        // [endregion]{push}
        PrintUtil.printHeap(maxHeap);

        // [region]{peek}
        /* 힙의 루트 원소 반환 */
        int peek = maxHeap.peek(); // 5
        // [endregion]{peek}
        System.out.format("\n힙의 루트 원소: %d\n", peek);

        // [region]{pop_1}
        /* 힙의 루트 원소 꺼내기 */
        // 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
        peek = maxHeap.poll(); // 5
        // [endregion]{pop_1}
        System.out.println(peek);
        // [region]{pop_2}
        peek = maxHeap.poll(); // 4
        // [endregion]{pop_2}
        System.out.println(peek);
        // [region]{pop_3}
        peek = maxHeap.poll(); // 3
        // [endregion]{pop_3}
        System.out.println(peek);
        // [region]{pop_4}
        peek = maxHeap.poll(); // 2
        // [endregion]{pop_4}
        System.out.println(peek);
        // [region]{pop_5}
        peek = maxHeap.poll(); // 1
        // [endregion]{pop_5}
        System.out.println(peek);

        // [region]{size}
        /* 힙 크기 반환 */
        int size = maxHeap.size();
        // [endregion]{size}
        System.out.format("\n힙의 원소 개수: %d\n", size);

        // [region]{is_empty}
        /* 힙이 비어 있는지 판단 */
        boolean isEmpty = maxHeap.isEmpty();
        // [endregion]{is_empty}
        System.out.format("\n힙이 비어 있는가: %b\n", isEmpty);

        // [region]{heapify}
        /* 리스트를 입력하여 힙 구성 */
        // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        // [endregion]{heapify}
        System.out.println("\n리스트를 입력하여 최소 힙을 구성한 후");
        PrintUtil.printHeap(minHeap);
    }
}
