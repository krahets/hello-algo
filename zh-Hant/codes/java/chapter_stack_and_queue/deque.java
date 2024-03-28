/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* 初始化雙向佇列 */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("雙向佇列 deque = " + deque);

        /* 訪問元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("佇列首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("佇列尾元素 peekLast = " + peekLast);

        /* 元素入列 */
        deque.offerLast(4);
        System.out.println("元素 4 佇列尾入列後 deque = " + deque);
        deque.offerFirst(1);
        System.out.println("元素 1 佇列首入列後 deque = " + deque);

        /* 元素出列 */
        int popLast = deque.pollLast();
        System.out.println("佇列尾出列元素 = " + popLast + "，佇列尾出列後 deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("佇列首出列元素 = " + popFirst + "，佇列首出列後 deque = " + deque);

        /* 獲取雙向佇列的長度 */
        int size = deque.size();
        System.out.println("雙向佇列長度 size = " + size);

        /* 判斷雙向佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("雙向佇列是否為空 = " + isEmpty);
    }
}
