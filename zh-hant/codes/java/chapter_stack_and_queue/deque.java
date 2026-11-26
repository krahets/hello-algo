/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* 初始化雙端佇列 */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("雙端佇列 deque = " + deque);

        /* 讀取隊首與隊尾元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("隊首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("隊尾元素 peekLast = " + peekLast);

        /* 將元素加入雙端佇列 */
        deque.offerLast(4);
        System.out.println("將元素 4 加到隊尾後 deque = " + deque);
        deque.offerFirst(1);
        System.out.println("將元素 1 加到隊首後 deque = " + deque);

        /* 從雙端佇列取出元素 */
        int popLast = deque.pollLast();
        System.out.println("從隊尾取出的元素 = " + popLast + "，從隊尾取出後 deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("從隊首取出的元素 = " + popFirst + "，從隊首取出後 deque = " + deque);

        /* 取得雙端佇列長度 */
        int size = deque.size();
        System.out.println("雙端佇列長度 size = " + size);

        /* 判斷雙端佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("雙端佇列是否為空 = " + isEmpty);
    }
}
