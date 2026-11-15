/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        // [region]{init_queue}
        /* キューを初期化する */
        Queue<Integer> queue = new LinkedList<>();
        // [endregion]{init_queue}

        // [region]{push}
        /* 要素をエンキューする */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        // [endregion]{push}
        System.out.println("キュー queue = " + queue);

        // [region]{peek}
        /* キューの先頭要素にアクセス */
        int peek = queue.peek();
        // [endregion]{peek}
        System.out.println("キューの先頭要素 peek = " + peek);

        // [region]{pop}
        /* 要素をデキューする */
        int pop = queue.poll();
        // [endregion]{pop}
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後 queue = " + queue);

        // [region]{size}
        /* キューの長さを取得 */
        int size = queue.size();
        // [endregion]{size}
        System.out.println("キューの長さ size = " + size);

        // [region]{is_empty}
        /* キューが空か判定 */
        boolean isEmpty = queue.isEmpty();
        // [endregion]{is_empty}
        System.out.println("キューは空か = " + isEmpty);
    }
}
