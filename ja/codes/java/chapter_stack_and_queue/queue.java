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

        /* 要素をエンキューする */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("キュー queue = " + queue);

        /* キューの先頭要素にアクセス */
        int peek = queue.peek();
        System.out.println("キューの先頭要素 peek = " + peek);

        /* 要素をデキューする */
        int pop = queue.poll();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後 queue = " + queue);

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* キューが空か判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューは空か = " + isEmpty);
    }
}
