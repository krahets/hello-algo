/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* 初始化双向队列 */
        Deque<Integer> deque = new LinkedList<>();

        /* 元素入队 */
        deque.offerLast(2);
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3);
        deque.offerFirst(1);
        System.out.println("双向队列 deque = " + deque);

        /* 访问元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("队首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("队尾元素 peekLast = " + peekLast);

        /* 元素出队 */
        int pollFirst = deque.pollFirst();
        System.out.println("队首出队元素 pollFirst = " + pollFirst + "，队首出队后 deque = " + deque);
        int pollLast = deque.pollLast();
        System.out.println("队尾出队元素 pollLast = " + pollLast + "，队尾出队后 deque = " + deque);

        /* 获取双向队列的长度 */
        int size = deque.size();
        System.out.println("双向队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双向队列是否为空 = " + isEmpty);
    }
}
