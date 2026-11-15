/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        // [region]{init_deque}
        /* 初始化双向队列 */
        Deque<Integer> deque = new LinkedList<>();
        // [endregion]{init_deque}

        // [region]{push}
        /* 元素入队 */
        deque.offerLast(2); // 添加至队尾
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3); // 添加至队首
        deque.offerFirst(1);
        // [endregion]{push}
        System.out.println("双向队列 deque = " + deque);

        // [region]{peek_first}
        /* 访问元素 */
        int peekFirst = deque.peekFirst(); // 队首元素
        // [endregion]{peek_first}
        System.out.println("队首元素 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int peekLast = deque.peekLast(); // 队尾元素
        // [endregion]{peek_last}
        System.out.println("队尾元素 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 元素出队 */
        int popFirst = deque.pollFirst(); // 队首元素出队
        // [endregion]{pop_first}
        System.out.println("队首出队元素 = " + popFirst + "，队首出队后 deque = " + deque);
        // [region]{pop_last}
        int popLast = deque.pollLast(); // 队尾元素出队
        // [endregion]{pop_last}
        System.out.println("队尾出队元素 = " + popLast + "，队尾出队后 deque = " + deque);

        // [region]{size}
        /* 获取双向队列的长度 */
        int size = deque.size();
        // [endregion]{size}
        System.out.println("双向队列长度 size = " + size);

        // [region]{is_empty}
        /* 判断双向队列是否为空 */
        boolean isEmpty = deque.isEmpty();
        // [endregion]{is_empty}
        System.out.println("双向队列是否为空 = " + isEmpty);
    }
}
