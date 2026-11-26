/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 以環狀陣列實作雙端佇列 */
class ArrayDeque {
    private int[] nums; // 存放雙端佇列元素的陣列
    private int front; // 隊首索引，記錄隊首元素在陣列中的位置
    private int queSize; // 雙端佇列長度

    /* 建構子 */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* 取得雙端佇列容量 */
    public int capacity() {
        return nums.length;
    }

    /* 取得雙端佇列長度 */
    public int size() {
        return queSize;
    }

    /* 判斷雙端佇列是否為空 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 計算環狀陣列的索引 */
    private int index(int i) {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        return (i + capacity()) % capacity();
    }

    /* 從隊首加入元素 */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("雙端佇列已滿");
            return;
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        front = index(front - 1);
        // 將 num 加到隊首
        nums[front] = num;
        queSize++;
    }

    /* 從隊尾加入元素 */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("雙端佇列已滿");
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        int rear = index(front + queSize);
        // 將 num 加到隊尾
        nums[rear] = num;
        queSize++;
    }

    /* 從隊首取出元素 */
    public int popFirst() {
        int num = peekFirst();
        // 將隊首索引往後移一格
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* 從隊尾取出元素 */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 讀取隊尾元素 */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 計算隊尾元素的索引
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* 回傳陣列以便輸出 */
    public int[] toArray() {
        // 只轉換雙端佇列中實際存放的元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* 初始化雙端佇列 */
        ArrayDeque deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("雙端佇列 deque = " + Arrays.toString(deque.toArray()));

        /* 讀取隊首與隊尾元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("隊首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("隊尾元素 peekLast = " + peekLast);

        /* 將元素加入雙端佇列 */
        deque.pushLast(4);
        System.out.println("將元素 4 加到隊尾後 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("將元素 1 加到隊首後 deque = " + Arrays.toString(deque.toArray()));

        /* 從雙端佇列取出元素 */
        int popLast = deque.popLast();
        System.out.println("從隊尾取出的元素 = " + popLast + "，從隊尾取出後 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("從隊首取出的元素 = " + popFirst + "，從隊首取出後 deque = " + Arrays.toString(deque.toArray()));

        /* 取得雙端佇列長度 */
        int size = deque.size();
        System.out.println("雙端佇列長度 size = " + size);

        /* 判斷雙端佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("雙端佇列是否為空 = " + isEmpty);
    }
}
