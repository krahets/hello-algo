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
        System.out.println("双方向キュー deque = " + deque);

        /* 要素にアクセス */
        int peekFirst = deque.peekFirst();
        System.out.println("先頭要素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("末尾要素 peekLast = " + peekLast);

        /* 要素をエンキュー */
        deque.offerLast(4);
        System.out.println("要素 4 を末尾にエンキューした後の deque = " + deque);
        deque.offerFirst(1);
        System.out.println("要素 1 を先頭にエンキューした後の deque = " + deque);

        /* 要素をデキュー */
        int popLast = deque.pollLast();
        System.out.println("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後の deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後の deque = " + deque);

        /* 両端キューの長さを取得 */
        int size = deque.size();
        System.out.println("双方向キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双方向キューが空かどうか = " + isEmpty);
    }
}
