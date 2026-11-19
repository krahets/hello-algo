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
        /* 初始化堆 */
        // 初始化小顶堆
        Queue<Integer> minHeap = new PriorityQueue<>();
        // 初始化大顶堆（使用 lambda 表达式修改 Comparator 即可）
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
        // [endregion]{init}

        System.out.println("\n以下测试样例为大顶堆");

        // [region]{push}
        /* 元素入堆 */
        maxHeap.offer(1);
        maxHeap.offer(3);
        maxHeap.offer(2);
        maxHeap.offer(5);
        maxHeap.offer(4);
        // [endregion]{push}
        PrintUtil.printHeap(maxHeap);

        // [region]{peek}
        /* 获取堆顶元素 */
        int peek = maxHeap.peek(); // 5
        // [endregion]{peek}
        System.out.format("\n堆顶元素为 %d\n", peek);

        // [region]{pop_1}
        /* 堆顶元素出堆 */
        // 出堆元素会形成一个从大到小的序列
        peek = maxHeap.poll(); // 5
        // [endregion]{pop_1}
        System.out.format("出堆元素为 %d\n", peek);
        // [region]{pop_2}
        peek = maxHeap.poll(); // 4
        // [endregion]{pop_2}
        System.out.format("出堆元素为 %d\n", peek);
        // [region]{pop_3}
        peek = maxHeap.poll(); // 3
        // [endregion]{pop_3}
        System.out.format("出堆元素为 %d\n", peek);
        // [region]{pop_4}
        peek = maxHeap.poll(); // 2
        // [endregion]{pop_4}
        System.out.format("出堆元素为 %d\n", peek);
        // [region]{pop_5}
        peek = maxHeap.poll(); // 1
        // [endregion]{pop_5}
        System.out.format("出堆元素为 %d\n", peek);

        // [region]{size}
        /* 获取堆大小 */
        int size = maxHeap.size();
        // [endregion]{size}
        System.out.format("\n堆元素数量为 %d\n", size);

        // [region]{is_empty}
        /* 判断堆是否为空 */
        boolean isEmpty = maxHeap.isEmpty();
        // [endregion]{is_empty}
        System.out.format("\n堆是否为空 %b\n", isEmpty);

        // [region]{heapify}
        /* 输入列表并建堆 */
        // 时间复杂度为 O(n) ，而非 O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        // [endregion]{heapify}
        System.out.println("\n输入列表并建立小顶堆后");
        PrintUtil.printHeap(minHeap);
    }
}
