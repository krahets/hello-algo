/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* 初始化佇列 */
        Queue<Integer> queue = new LinkedList<>();

        /* 元素入列 */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("佇列 queue = " + queue);

        /* 訪問佇列首元素 */
        int peek = queue.peek();
        System.out.println("佇列首元素 peek = " + peek);

        /* 元素出列 */
        int pop = queue.poll();
        System.out.println("出列元素 pop = " + pop + "，出列後 queue = " + queue);

        /* 獲取佇列的長度 */
        int size = queue.size();
        System.out.println("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("佇列是否為空 = " + isEmpty);
    }
}
