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

        /* 將元素加入佇列 */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("佇列 queue = " + queue);

        /* 讀取隊首元素 */
        int peek = queue.peek();
        System.out.println("隊首元素 peek = " + peek);

        /* 從佇列取出元素 */
        int pop = queue.poll();
        System.out.println("出隊元素 pop = " + pop + "，出隊後 queue = " + queue);

        /* 取得佇列長度 */
        int size = queue.size();
        System.out.println("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("佇列是否為空 = " + isEmpty);
    }
}
