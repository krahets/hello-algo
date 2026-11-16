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
        /* 덱 초기화 */
        Deque<Integer> deque = new LinkedList<>();
        // [endregion]{init_deque}

        // [region]{push}
        /* 원소 삽입 */
        deque.offerLast(2); // 맨 뒤에 추가한다
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3); // 맨 앞에 추가한다
        deque.offerFirst(1);
        // [endregion]{push}
        System.out.println("덱 deque = " + deque);

        // [region]{peek_first}
        /* 원소 접근 */
        int peekFirst = deque.peekFirst(); // 맨 앞 원소
        // [endregion]{peek_first}
        System.out.println("맨 앞 원소 peekFirst = " + peekFirst);
        // [region]{peek_last}
        int peekLast = deque.peekLast(); // 맨 뒤 원소
        // [endregion]{peek_last}
        System.out.println("맨 뒤 원소 peekLast = " + peekLast);

        // [region]{pop_first}
        /* 원소 꺼내기 */
        int popFirst = deque.pollFirst(); // 맨 앞 원소를 꺼낸다
        // [endregion]{pop_first}
        System.out.println("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + deque);
        // [region]{pop_last}
        int popLast = deque.pollLast(); // 맨 뒤 원소를 꺼낸다
        // [endregion]{pop_last}
        System.out.println("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + deque);

        // [region]{size}
        /* 덱의 길이 반환 */
        int size = deque.size();
        // [endregion]{size}
        System.out.println("덱 길이 size = " + size);

        // [region]{is_empty}
        /* 덱이 비어 있는지 판단 */
        boolean isEmpty = deque.isEmpty();
        // [endregion]{is_empty}
        System.out.println("덱이 비어 있는가 = " + isEmpty);
    }
}
