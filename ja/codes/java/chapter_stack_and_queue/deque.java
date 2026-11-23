/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* 両端キューを初期化する */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("両端キュー deque = " + deque);

        /* 要素にアクセスする */
        int peekFirst = deque.peekFirst();
        System.out.println("キューの先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("キューの末尾要素 peekLast = " + peekLast);

        /* 要素をエンキューする */
        deque.offerLast(4);
        System.out.println("要素 4 を末尾にエンキューした後 deque = " + deque);
        deque.offerFirst(1);
        System.out.println("要素 1 を先頭にエンキューした後 deque = " + deque);

        /* 要素をデキューする */
        int popLast = deque.pollLast();
        System.out.println("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + deque);

        /* 両端キューの長さを取得する */
        int size = deque.size();
        System.out.println("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定する */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューは空か = " + isEmpty);
    }
}
