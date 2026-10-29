/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列で実装したキュー */
class ArrayQueue {
    private int[] nums; // キューの要素を格納する配列
    private int front; // キューの先頭要素を指す先頭ポインタ
    private int queSize; // キューの長さ

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* キューの容量を取得する */
    public int capacity() {
        return nums.length;
    }

    /* キューの長さを取得 */
    public int size() {
        return queSize;
    }

    /* キューが空か判定 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* エンキュー */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("キューが満杯です");
            return;
        }
        // 末尾のインデックス + 1 を指す末尾ポインタを計算する
        // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        int rear = (front + queSize) % capacity();
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* デキュー */
    public int pop() {
        int num = peek();
        // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 配列を返す */
    public int[] toArray() {
        // 有効な長さの範囲内にあるリストの要素だけを変換する
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* キューを初期化する */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* 要素をエンキューする */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("キュー queue = " + Arrays.toString(queue.toArray()));

        /* キューの先頭要素にアクセス */
        int peek = queue.peek();
        System.out.println("キューの先頭要素 peek = " + peek);

        /* 要素をデキューする */
        int pop = queue.pop();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後 queue = " + Arrays.toString(queue.toArray()));

        /* キューの長さを取得 */
        int size = queue.size();
        System.out.println("キューの長さ size = " + size);

        /* キューが空か判定 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューは空か = " + isEmpty);

        /* 循環配列をテストする */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("第 " + i + " 回のエンキューとデキューの後 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
