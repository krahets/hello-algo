/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 基於環形陣列實現的雙向佇列 */
class ArrayDeque {
    private int[] nums; // 用於儲存雙向佇列元素的陣列
    private int front; // 佇列首指標，指向佇列首元素
    private int queSize; // 雙向佇列長度

    /* 建構子 */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* 獲取雙向佇列的容量 */
    public int capacity() {
        return nums.length;
    }

    /* 獲取雙向佇列的長度 */
    public int size() {
        return queSize;
    }

    /* 判斷雙向佇列是否為空 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 計算環形陣列索引 */
    private int index(int i) {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        return (i + capacity()) % capacity();
    }

    /* 佇列首入列 */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("雙向佇列已滿");
            return;
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        front = index(front - 1);
        // 將 num 新增至佇列首
        nums[front] = num;
        queSize++;
    }

    /* 佇列尾入列 */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("雙向佇列已滿");
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        int rear = index(front + queSize);
        // 將 num 新增至佇列尾
        nums[rear] = num;
        queSize++;
    }

    /* 佇列首出列 */
    public int popFirst() {
        int num = peekFirst();
        // 佇列首指標向後移動一位
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 佇列尾出列 */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 訪問佇列尾元素 */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 計算尾元素索引
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 返回陣列用於列印 */
    public int[] toArray() {
        // 僅轉換有效長度範圍內的串列元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* 初始化雙向佇列 */
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("雙向佇列 deque = " + Arrays.toString(deque.toArray()));

        /* 訪問元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("佇列首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("佇列尾元素 peekLast = " + peekLast);

        /* 元素入列 */
        deque.pushLast(4);
        System.out.println("元素 4 佇列尾入列後 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("元素 1 佇列首入列後 deque = " + Arrays.toString(deque.toArray()));

        /* 元素出列 */
        int popLast = deque.popLast();
        System.out.println("佇列尾出列元素 = " + popLast + "，佇列尾出列後 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("佇列首出列元素 = " + popFirst + "，佇列首出列後 deque = " + Arrays.toString(deque.toArray()));

        /* 獲取雙向佇列的長度 */
        int size = deque.size();
        System.out.println("雙向佇列長度 size = " + size);

        /* 判斷雙向佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("雙向佇列是否為空 = " + isEmpty);
    }
}
