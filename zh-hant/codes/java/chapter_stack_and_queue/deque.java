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
        /* 初始化雙向佇列 */
        Deque<Integer> deque = new LinkedList<>();
        // [endregion]{init_deque}

        // [region]{push}
        /* 元素入列 */
        deque.offerLast(2); // 新增至佇列尾
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3); // 新增至佇列首
        deque.offerFirst(1);
        // [endregion]{push}
        System.out.println("雙向佇列 deque = " + deque);

        // [region]{peek_first}
        /* 訪問元素 */
        int peekFirst = deque.peekFirst(); // 佇列首元素
        // [endregion]{peek_first}
        System.out.println("佇列首元素 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int peekLast = deque.peekLast(); // 佇列尾元素
        // [endregion]{peek_last}
        System.out.println("佇列尾元素 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 元素出列 */
        int popFirst = deque.pollFirst(); // 佇列首元素出列
        // [endregion]{pop_first}
        System.out.println("佇列首出列元素 = " + popFirst + "，佇列首出列後 deque = " + deque);
        // [region]{pop_last}
        int popLast = deque.pollLast(); // 佇列尾元素出列
        // [endregion]{pop_last}
        System.out.println("佇列尾出列元素 = " + popLast + "，佇列尾出列後 deque = " + deque);

        // [region]{size}
        /* 獲取雙向佇列的長度 */
        int size = deque.size();
        // [endregion]{size}
        System.out.println("雙向佇列長度 size = " + size);

        // [region]{is_empty}
        /* 判斷雙向佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        // [endregion]{is_empty}
        System.out.println("雙向佇列是否為空 = " + isEmpty);
    }
}
