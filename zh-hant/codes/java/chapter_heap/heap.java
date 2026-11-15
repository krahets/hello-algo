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
        /* 初始化堆積 */
        // 初始化小頂堆積
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 初始化大頂堆積（使用 lambda 表示式修改 Comparator 即可）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
        // [endregion]{init}

        System.out.println("\n以下測試樣例為大頂堆積");

        // [region]{push}
        /* 元素入堆積 */
        maxHeap.offer(1);
        maxHeap.offer(3);
        maxHeap.offer(2);
        maxHeap.offer(5);
        maxHeap.offer(4);
        // [endregion]{push}
        PrintUtil.printHeap(maxHeap);

        // [region]{peek}
        /* 獲取堆積頂元素 */
        int peek = maxHeap.peek(); // 5
        // [endregion]{peek}
        System.out.format("\n堆積頂元素為 %d\n", peek);

        // [region]{pop_1}
        /* 堆積頂元素出堆積 */
        // 出堆積元素會形成一個從大到小的序列
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
        /* 獲取堆積大小 */
        int size = maxHeap.size();
        // [endregion]{size}
        System.out.format("\n堆積元素數量為 %d\n", size);

        // [region]{is_empty}
        /* 判斷堆積是否為空 */
        boolean isEmpty = maxHeap.isEmpty();
        // [endregion]{is_empty}
        System.out.format("\n堆積是否為空 %b\n", isEmpty);

        // [region]{heapify}
        /* 輸入串列並建堆積 */
        // 時間複雜度為 O(n) ，而非 O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        // [endregion]{heapify}
        System.out.println("\n輸入串列並建立小頂堆積後");
        PrintUtil.printHeap(minHeap);
    }
}
