/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* 両端キューを初期化 */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("両端キュー deque = " + deque);

        /* 要素へのアクセス */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素のエンキュー */
        deque.offerLast(4);
        System.out.println("要素4を末尾にエンキュー、deque = " + deque);
        deque.offerFirst(1);
        System.out.println("要素1を先頭にエンキュー、deque = " + deque);

        /* 要素のデキュー */
        int popLast = deque.pollLast();
        System.out.println("両端キュー末尾要素 = " + popLast + "、末尾からデキュー後 " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("両端キュー先頭要素 = " + popFirst + "、先頭からデキュー後 " + deque);

        /* 両端キューの長さを取得 */
        int size = deque.size();
        System.out.println("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューが空か = " + isEmpty);
    }
}