/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        // [region]{init_queue}
        /* 初始化队列 */
        Queue<Integer> queue = new LinkedList<>();
        // [endregion]{init_queue}

        // [region]{push}
        /* 元素入队 */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        // [endregion]{push}
        System.out.println("队列 queue = " + queue);

        // [region]{peek}
        /* 访问队首元素 */
        int peek = queue.peek();
        // [endregion]{peek}
        System.out.println("队首元素 peek = " + peek);

        // [region]{pop}
        /* 元素出队 */
        int pop = queue.poll();
        // [endregion]{pop}
        System.out.println("出队元素 pop = " + pop + "，出队后 queue = " + queue);

        // [region]{size}
        /* 获取队列的长度 */
        int size = queue.size();
        // [endregion]{size}
        System.out.println("队列长度 size = " + size);

        // [region]{is_empty}
        /* 判断队列是否为空 */
        boolean isEmpty = queue.isEmpty();
        // [endregion]{is_empty}
        System.out.println("队列是否为空 = " + isEmpty);
    }
}
