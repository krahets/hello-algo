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

        /* 要素を参照する */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素を両端キューに追加する */
        deque.offerLast(4);
        System.out.println("末尾に 4 を追加した後の deque = " + deque);
        deque.offerFirst(1);
        System.out.println("先頭に 1 を追加した後の deque = " + deque);

        /* 両端キューから要素を取り出す */
        int popLast = deque.pollLast();
        System.out.println("末尾から取り出した要素 = " + popLast + "、末尾から取り出した後の deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("先頭から取り出した要素 = " + popFirst + "、先頭から取り出した後の deque = " + deque);

        /* 両端キューの要素数を取得する */
        int size = deque.size();
        System.out.println("両端キューの要素数 size = " + size);

        /* 両端キューが空かどうかを判定する */
        boolean isEmpty = deque.isEmpty();
        System.out.println("両端キューは空か = " + isEmpty);
    }
}
