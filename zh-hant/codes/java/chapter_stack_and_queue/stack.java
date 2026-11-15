/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        // [region]{init_stack}
        /* 初始化堆疊 */
        Stack<Integer> stack = new Stack<>();
        // [endregion]{init_stack}

        // [region]{push}
        /* 元素入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        // [endregion]{push}
        System.out.println("堆疊 stack = " + stack);

        // [region]{peek}
        /* 訪問堆疊頂元素 */
        int peek = stack.peek();
        // [endregion]{peek}
        System.out.println("堆疊頂元素 peek = " + peek);

        // [region]{pop}
        /* 元素出堆疊 */
        int pop = stack.pop();
        // [endregion]{pop}
        System.out.println("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + stack);

        // [region]{size}
        /* 獲取堆疊的長度 */
        int size = stack.size();
        // [endregion]{size}
        System.out.println("堆疊的長度 size = " + size);

        // [region]{is_empty}
        /* 判斷是否為空 */
        boolean isEmpty = stack.isEmpty();
        // [endregion]{is_empty}
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
