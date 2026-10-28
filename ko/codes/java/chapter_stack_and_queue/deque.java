/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* 덱 초기화 */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("덱 deque = " + deque);

        /* 원소 접근 */
        int peekFirst = deque.peekFirst();
        System.out.println("맨 앞 원소 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("맨 뒤 원소 peekLast = " + peekLast);

        /* 큐에 원소 삽입 */
        deque.offerLast(4);
        System.out.println("원소 4를 맨 뒤에 삽입한 후 deque = " + deque);
        deque.offerFirst(1);
        System.out.println("원소 1을 맨 앞에 삽입한 후 deque = " + deque);

        /* 큐에서 원소 꺼내기 */
        int popLast = deque.pollLast();
        System.out.println("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + deque);

        /* 덱의 길이 반환 */
        int size = deque.size();
        System.out.println("덱 길이 size = " + size);

        /* 덱이 비어 있는지 판단 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("덱이 비어 있는가 = " + isEmpty);
    }
}
