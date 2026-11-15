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
        /* スタックを初期化する */
        Stack<Integer> stack = new Stack<>();
        // [endregion]{init_stack}

        // [region]{push}
        /* 要素をプッシュする */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        // [endregion]{push}
        System.out.println("スタック stack = " + stack);

        // [region]{peek}
        /* スタックの先頭要素にアクセスする */
        int peek = stack.peek();
        // [endregion]{peek}
        System.out.println("スタックの先頭要素 peek = " + peek);

        // [region]{pop}
        /* 要素をポップする */
        int pop = stack.pop();
        // [endregion]{pop}
        System.out.println("ポップした要素 pop = " + pop + "、ポップ後 stack = " + stack);

        // [region]{size}
        /* スタックの長さを取得する */
        int size = stack.size();
        // [endregion]{size}
        System.out.println("スタックの長さ size = " + size);

        // [region]{is_empty}
        /* 空かどうかを判定する */
        boolean isEmpty = stack.isEmpty();
        // [endregion]{is_empty}
        System.out.println("スタックは空か = " + isEmpty);
    }
}
