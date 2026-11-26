/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* キューを初期化する */
        Queue<Integer> queue = new LinkedList<>();

        /* 要素をキューに追加する */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("キュー queue = " + queue);

        /* キューの先頭要素を参照する */
        int peek = queue.peek();
        System.out.println("先頭要素 peek = " + peek);

        /* キューから要素を取り出す */
        int pop = queue.poll();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後の queue = " + queue);

        /* キューの要素数を取得する */
        int size = queue.size();
        System.out.println("キューの要素数 size = " + size);

        /* キューが空かどうかを判定する */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューは空か = " + isEmpty);
    }
}
