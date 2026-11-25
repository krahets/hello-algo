/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 循環配列を使ったキュー */
class ArrayQueue {
    private int[] nums; // キューの要素を格納する配列
    private int front; // キューの先頭要素を指すインデックス
    private int queSize; // キューの要素数

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* キューの容量を取得する */
    public int capacity() {
        return nums.length;
    }

    /* キューの要素数を取得する */
    public int size() {
        return queSize;
    }

    /* キューが空かどうかを判定する */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* エンキューする */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("キューが満杯です");
            return;
        }
        // キューの末尾要素の次の位置を示すインデックスを求める
        // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        int rear = (front + queSize) % capacity();
        // num をキューの末尾に追加する
        nums[rear] = num;
        queSize++;
    }

    /* デキューする */
    public int pop() {
        int num = peek();
        // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 配列を返す */
    public int[] toArray() {
        // キューの要素数に当たる範囲だけを変換する
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

        /* 要素をキューに追加する */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("キュー queue = " + Arrays.toString(queue.toArray()));

        /* キューの先頭要素を参照する */
        int peek = queue.peek();
        System.out.println("先頭要素 peek = " + peek);

        /* キューから要素を取り出す */
        int pop = queue.pop();
        System.out.println("デキューした要素 pop = " + pop + "、デキュー後の queue = " + Arrays.toString(queue.toArray()));

        /* キューの要素数を取得する */
        int size = queue.size();
        System.out.println("キューの要素数 size = " + size);

        /* キューが空かどうかを判定する */
        boolean isEmpty = queue.isEmpty();
        System.out.println("キューは空か = " + isEmpty);

        /* 循環配列の動作を確認する */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("第 " + i + " 回のエンキューとデキューを終えた後の queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
