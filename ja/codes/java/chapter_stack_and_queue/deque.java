/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        // [region]{init_deque}
        /* 両端キューを初期化する */
        Deque<Integer> deque = new LinkedList<>();
        // [endregion]{init_deque}

        // [region]{push}
        /* 要素をエンキューする */
        deque.offerLast(2); // キューの末尾に追加する
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3); // キューの先頭に追加する
        deque.offerFirst(1);
        // [endregion]{push}
        System.out.println("両端キュー deque = " + deque);

        // [region]{peek_first}
        /* 要素にアクセスする */
        int peekFirst = deque.peekFirst(); // キューの先頭要素
        // [endregion]{peek_first}
        System.out.println("キューの先頭要素 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int peekLast = deque.peekLast(); // キューの末尾要素
        // [endregion]{peek_last}
        System.out.println("キューの末尾要素 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 要素をデキューする */
        int popFirst = deque.pollFirst(); // キューの先頭要素をデキューする
        // [endregion]{pop_first}
        System.out.println("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + deque);
        // [region]{pop_last}
        int popLast = deque.pollLast(); // キューの末尾要素をデキューする
        // [endregion]{pop_last}
        System.out.println("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + deque);

        // [region]{size}
        /* 両端キューの長さを取得する */
        int size = deque.size();
        // [endregion]{size}
        System.out.println("両端キューの長さ size = " + size);

        // [region]{is_empty}
        /* 両端キューが空かどうかを判定する */
        boolean isEmpty = deque.isEmpty();
        // [endregion]{is_empty}
        System.out.println("両端キューは空か = " + isEmpty);
    }
}
