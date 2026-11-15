/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* 큐 초기화 */
        Queue<Integer> queue = new LinkedList<>();

        /* 큐에 원소 삽입 */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("큐 queue = " + queue);

        /* 맨 앞 원소 접근 */
        int peek = queue.peek();
        System.out.println("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.poll();
        System.out.println("큐에서 꺼낸 원소 pop = " + pop + ", 큐에서 꺼낸 후 queue = " + queue);

        /* 큐의 길이 반환 */
        int size = queue.size();
        System.out.println("큐 길이 size = " + size);

        /* 큐가 비어 있는지 판단 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("큐가 비어 있는가 = " + isEmpty);
    }
}
