/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* キューを初期化 */
        Queue<Integer> queue = new LinkedList<>();

        /* 要素をエンキュー */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("キュー queue = " + queue);

        /* 先頭要素にアクセス */
        int peek = queue.peek();
        System.out.println("先頭要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.poll();
        System.out.println("デキューした要素 = " + pop + "、デキュー後 " + queue);

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* キューが空かどうかを判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューが空か = " + isEmpty);
    }
}